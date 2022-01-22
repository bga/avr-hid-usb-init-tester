#pragma once

enum {
	idleCounterLimit_noSetup_ms = 250, 
	idleCounterLimit_afterSetup_ms = 500, 
};

enum {
	#define STATUS_LED__PORT PORTB
	StatusLed_pin = 7, 
};
