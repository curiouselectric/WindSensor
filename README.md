# WindSensor Overview
A DIY Wind sensor interface board.

This connects to various anemometers and wind vanes and provides a serial interface for averaged data from the pulses.

It runs on an ATMega328 running at 8MHz with selectable baud serial (up to 57600). It comes pre-programmed, but code can be uploaded via the Arduino IDE, using the MiniCore board add-on. See firmware for more details.

Each unit can have a unique ID (using a solder pad for 0-7 values), so multiple units can be added to a serial bus, if needed. The defalt is 0.

It was designed as a relatively simple interface to remove the need for monitoring pulses and averaging them. 

The anemometer can either be a pulse output, NPN output or hall-effect output. The unit reads digital pulses, with circuitry on the unit converting the hall effect output to pulses. (Note: This unit cannot read 0-5V or analog output sensors).
The unit stores average wind speeds for 1 second, 10 second, 1 min, 10 min and 1 hour values. It also records the maximum and minimum wind speed.
The unit converts the pulses into a real wind speed using a y=mx+c linear conversion, where y is the wind speed and c is the number of pulses. m and c are stored in EEPROM and have default values of m=1 and c=0. These are floats and can be changed as required through the serial interface. Any updated values are stored in EEPROM.

The wind vane input is analog. This can read either resistive wiper vanes or stepped resistive vanes. The stepped rsistive vanes have magnet reed switches which switch in and out different resistances. The resistance then tells us the direction. A pull up reistor is required in these situations.
The wind vane input can be 'trained'. So put the unit into vane training mode via the serial interface. This will run through N, NE, E, SE, S, SW, W, NW and you can hold the unit in the correct direction position and press the switch to store that data to memory. Once trained then the unit creates a buffer zone around each of the values and within the zone then the unit will record the correct direction.
Wind direction is difficult to measure, as you cannot directly average the analog value (because of the 360 to 0 point where the analog value rolls around from 1024 back to 0 - this means an average of a unit pointing just off north (ie one reading of 0 and one reading of 360) will give an average of (360+0) = 180, which is south and totally wrong!). 
This unit will record the number of seconds the vane has been pointing in a certain direction. This means a 'wind rose' can easily be created. This is stored and updated until it is directly reset. The unit will also return the instantaeous direction, if that is needed.


# Hardware

The PCB was designed in KiCAD and is available here. A small PCB has been designed.
There is one reset switch, one user input switch and one LED output.

Both inputs for the wind vane and anemometer are buffered with an op-amp and also have 5.1V zener protection. The anemometer input compares the input with a low voltage level to create a pulse from a hall-effect (which output a sine-wave like signal). This also works as a pull-down pulse sensor, which works with NPN and switch output anemometers.




# Firmware
This uses an ATMega328 running at 8MHz with 3.3v or 5V supply.

## Initial bootloader installation:
You should not need to do this, as the unit should come with this already installed. This is just for information.

Optiboot is used as the bootlloader:
Need to download optiboot5a from here:
https://code.google.com/archive/p/optiboot/downloads
Install optiboot_atmega328.hex into a folder called "optiboot5a" in the hardware section
Use this optiboot hex file for upload to the ATmega328
Fuses are: Low = 0xFF, High = 0xDE, Extended = 0xFE

## Program via Arduino IDE

To program it then MiniCore is used:
Install MiniCore from here: https://github.com/MCUdude/MiniCore
Add to preferences and then board manager.

You can then upload code by choosing the "ATMega328" option with the "External 8MHz Oscillator" set.

# Serial Data and Commands

It returns the average values and information when requested on serial port.
At all other times then the unit is asleep.

## Wind Speed data:
Request: “aaI0WSA4#”   Where 0 is an ID from 0-9 set by solder on PCB. 4 is the averaging period (0=1s, 1=10s, 2 = 60s, 3 = 600s, 4=3600s)

Returns: "aaWSA0:3.00#"  // Where 3.00 is the data
                                      
## Wind Speed data minimum:
Request: “aaI0WSMN#”  - does not matter what averaging period. min/max are just the min/max seen.

Returns: "aaWSMN:3.00#"  // Where 3.00 is the data
                                      
## Wind Speed data maximum:
Request: “aaI0WSMX#”  - does not matter what averaging period. min/max are just the min/max seen.

Returns: "aaWSMX:3.00#"  // Where 3.00 is the data
                                      
## Wind Vane data: 
Request: “aaI0WV#”   Where 0 is an ID from 0-9 set by solder on PCB. 4 is the averaging period (0=1s, 1=10s, 2 = 60s, 3 = 600s, 4=3600s)

Returns:    The instantaneuous direction AND the direction array data
                                     
Returns:    "aaWV=W:0.00:0.00:0.00:0.00:0.00:0.00:62.00:0.00#"
                                     
## Reset the max, min and wind vane array:  
Request: "aaI0RESET#"

Returns: "aaRESET#"
                                     
## What is baud rate?:                 
Request: "aaI0BD#"

Returns: "aaBD9600#"  // Where 9600 is the baud rate
                                      
## Set Baud Rate:                      
Request: "aaI0STBD*#"  Where * is (0)1200, (1)2400, (2)9600, (3)57600, (4)115200

Returns: "aaBD9600#"   // Where 9600 is the baud rate

## What is ID?:                        
Mentioned at start up of unit - it is solder-programmed... cannot be changed in code.

## Enter vane training mode:           
Request: "aaI0VT#"

Returns: Enter the vane training routine - use button to go through the different directiosn and set the values.

The serial port will show which direction the vane should be pointing at. 

Move the vane to this position and press the user switch (for around 0.5 seconds).

The serial port will show then next direction and will got N, NE, E, SE, S, SW, W, NW and then end.

When it ends this data is stored within the unit and the direction 'bands' are recaluclated.
                                      
## What is Anemometer converstion?:    
Request: "aaI0WSCON#"

Returns: "aaI0STWSCONm123.4c567.89#" (from stored values)
                                      
## Set the Anemometer conversion:      
Request: "aaI0WSSTm123.4c567.89#"   Where 123.4 is the gradient and 567.89 is the constant (y=mx+c)

Returns: "aaI0STWSSETm123.4c567.89#" (set to the new values)


## Failure codes:
If data is not that length or does not have 'aa' and '#' at start/end then return with send "aaFAIL**#" error code

"aaFAIL1#" = String too long

"aaFAIL2#" = Unit ID not correct/not a number

"aaFAIL3#" = Channel ID is not correct/not a number

"aaFAIL4#" = Average not correct/not a number

"aaFAIL5#" = Start/End chars not correct

"aaFAILID#" = Channel ID not correct

"aaFAILID#" = Ave Value not correct

