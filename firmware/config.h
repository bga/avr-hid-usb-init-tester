#pragma once

enum {
	idleCounterLimit_noSetup_ms = 250, 
	idleCounterLimit_afterSetup_ms = 250, 
};

enum {
	#define STATUS_LED__PORT PORTB
	StatusLed_pin = 7, 
	#define STATUS_LED2__PORT PORTB
	StatusLed2_pin = 5, 
};
