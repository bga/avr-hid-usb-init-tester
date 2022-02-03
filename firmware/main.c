/* Name: main.c
 * Project: HID-Test
 * Author: Christian Starkjohann
 * Creation Date: 2006-02-02
 * Tabsize: 4
 * Copyright: (c) 2006 by OBJECTIVE DEVELOPMENT Software GmbH
 * License: GNU GPL v2 (see License.txt) or proprietary (CommercialLicense.txt)
 * This Revision: $Id$
 */

#include <stdint.h>
#include <stdbool.h>

#include <avr/io.h>
#include <avr/interrupt.h>
#include <avr/pgmspace.h>
#include <avr/wdt.h>
#include <util/delay.h>

#include "usbdrv.h"
// #include "oddebug.h"
#include "config.h"

// #define _BV(bitNoArg) (1UL << (bitNoArg))

void StatusLed_on() {
	STATUS_LED__PORT |= _BV(StatusLed_pin);
}
void StatusLed_off() {
	STATUS_LED__PORT &= ~_BV(StatusLed_pin);
}
void StatusLed_toggle() {
	STATUS_LED__PORT ^= _BV(StatusLed_pin);
}

void StatusLed2_on() {
	STATUS_LED2__PORT |= _BV(StatusLed2_pin);
}
void StatusLed2_off() {
	STATUS_LED2__PORT &= ~_BV(StatusLed2_pin);
}
void StatusLed2_toggle() {
	STATUS_LED2__PORT ^= _BV(StatusLed2_pin);
}


enum {
	timeQuant_ms = 20, 
};

#define msToTicksCount(msArg) ((msArg) / timeQuant_ms)


void Timer_init() {
	TCCR0A = TCCR0B = 0;
	
	//prescale timer to 1024   
	TCCR0B |= _BV(CS02) | _BV(CS00);    
	
	// set compare match register for 1000 Hz increments
	const uint8_t counter = F_CPU / (1024UL * (1000 / timeQuant_ms));
	// static_assert(counter < 256, "timer counter should be less 256");
	// static_assert(1 < counter, "timer counter should be more than 1");
	OCR0A = counter - 1;
	
	// turn on CTC mode
	TCCR0A |= _BV(WGM01);

	//enable timer overflow interrupt   
	TIMSK = _BV(OCIE0A);   
	
}

void timerThread();

ISR(TIMER0_COMPA_vect){
	timerThread();
}

const PROGMEM char usbHidReportDescriptor[35] = {   /* USB report descriptor */
	0x05, 0x01,                    // USAGE_PAGE (Generic Desktop)
	0x09, 0x06,                    // USAGE (Keyboard)
	0xa1, 0x01,                    // COLLECTION (Application)
	0x05, 0x07,                    //   USAGE_PAGE (Keyboard)
	0x19, 0xe0,                    //   USAGE_MINIMUM (Keyboard LeftControl)
	0x29, 0xe7,                    //   USAGE_MAXIMUM (Keyboard Right GUI)
	0x15, 0x00,                    //   LOGICAL_MINIMUM (0)
	0x25, 0x01,                    //   LOGICAL_MAXIMUM (1)
	0x75, 0x01,                    //   REPORT_SIZE (1)
	0x95, 0x08,                    //   REPORT_COUNT (8)
	0x81, 0x02,                    //   INPUT (Data,Var,Abs)
	0x95, 0x01,                    //   REPORT_COUNT (1)
	0x75, 0x08,                    //   REPORT_SIZE (8)
	0x25, 0x65,                    //   LOGICAL_MAXIMUM (101)
	0x19, 0x00,                    //   USAGE_MINIMUM (Reserved (no event indicated))
	0x29, 0x65,                    //   USAGE_MAXIMUM (Keyboard Application)
	0x81, 0x00,                    //   INPUT (Data,Ary,Abs)
	0xc0                           // END_COLLECTION
};
/* We use a simplifed keyboard report descriptor which does not support the
 * boot protocol. We don't allow setting status LEDs and we only allow one
 * simultaneous key press (except modifiers). We can therefore use short
 * 2 byte input reports.
 * The report descriptor has been created with usb.org's "HID Descriptor Tool"
 * which can be downloaded from http://www.usb.org/developers/hidpage/.
 * Redundant entries (such as LOGICAL_MINIMUM and USAGE_PAGE) have been omitted
 * for the second INPUT item.
 */

void Hw_init() {
	//# set cpu clock prescaler to 1
	if(1) {
		CLKPR = 0x80;
		CLKPR = 0x00;
	};

	DDRB = _BV(StatusLed_pin) | _BV(StatusLed2_pin);
}

/* The following function returns an index for the first key pressed. It
 * returns 0 if no key is pressed.
 */
static uchar    keyPressed(void) {
	return 0;
}

/* ------------------------------------------------------------------------- */
/* ----------------------------- USB interface ----------------------------- */
/* ------------------------------------------------------------------------- */

static uchar    reportBuffer[2];    /* buffer for HID reports */
static uchar    idleRate;           /* in 4 ms units */

static void buildReport(uchar key) {
	/* This (not so elegant) cast saves us 10 bytes of program memory */
	// *(int*)reportBuffer = pgm_read_word(keyReport[key]);
	*(int*)reportBuffer = 0;
}

uchar	usbFunctionSetup(uchar data[8]) {
	usbRequest_t* rq = (void*)data;
	
	usbMsgPtr = reportBuffer;
	if((rq->bmRequestType & USBRQ_TYPE_MASK) == USBRQ_TYPE_CLASS) {   /* class request type */
		if(rq->bRequest == USBRQ_HID_GET_REPORT) { /* wValue: ReportType (highbyte), ReportID (lowbyte) */
			/* we only have one report type, so don't look at wValue */
			buildReport(keyPressed());
			return sizeof(reportBuffer);
		}
		else if(rq->bRequest == USBRQ_HID_GET_IDLE) {
			usbMsgPtr = &idleRate;
			return 1;
		}
		else if(rq->bRequest == USBRQ_HID_SET_IDLE) {
			idleRate = rq->wValue.bytes[1];
		}
	}
	else {
		/* no vendor specific requests implemented */
	}
	return 0;
}

uint8_t idleCounterLimit = msToTicksCount(idleCounterLimit_noSetup_ms);

void Usb_Config_setAddressCallback() {
	StatusLed2_on();
	idleCounterLimit = msToTicksCount(idleCounterLimit_afterSetup_ms);
} 

volatile uint8_t Usb_sofWasCatched = 0;
uint8_t idleCounter = 0;


void Usb_Config_rxCallback(const uint8_t* data, uint16_t len) {
	Usb_sofWasCatched = true;
}

void timerThread() {
	if(++idleCounter >= idleCounterLimit) {
		idleCounter = 0;
		if(Usb_sofWasCatched) {
			Usb_sofWasCatched = 0;
			StatusLed_toggle();
		};
	};
}


int	main(void) {
	cli();
	wdt_enable(WDTO_1S); // enable 1s watchdog timer
	
	Hw_init();
	Timer_init();	
	
	StatusLed_on();
	StatusLed2_off();
    
	if(0) {
		sei();
		while(1) wdt_reset();
	};
	usbInit();
	
	usbDeviceDisconnect(); // enforce re-enumeration
	// wait 500 ms, watchdog is set to 1 sec, so no wdt_reset() calls are required
	_delay_ms(500);	
	usbDeviceConnect();

	sei(); // Enable interrupts after re-enumeration

	while (1) {
		wdt_reset(); // keep the watchdog happy
		usbPoll();
	}
	return 0;
}
