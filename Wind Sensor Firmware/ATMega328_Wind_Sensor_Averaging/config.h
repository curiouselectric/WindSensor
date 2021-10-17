#pragma once

#include <Arduino.h>
#include <Wire.h>

#define LED0_PIN          7 
#define SWA_PIN           8

#define FREQ_PIN          2
#define VANE_PIN          A3

#define LED_FLASH_TIME    5000   // time in mS between LED flashes
#define LED_ON_TIME       100   // time in mS of the flash length

//// The baud rate for serial communications
#define MAX_BAUD_RATES    5

#define DEBUG_FLAG        true    // Use this for debugging. Not need for roll out.
#define DEBUG_DATA_1S     false   // Use this for debugging. Not need for roll out.
#define DEBUG_DATA_10S    false   // Use this for debugging. Not need for roll out.
#define DEBUG_DATA_60S    false   // Use this for debugging. Not need for roll out.
#define DEBUG_DATA_600S   false   // Use this for debugging. Not need for roll out.
#define DEBUG_DATA_3600S  false   // Use this for debugging. Not need for roll out.

#define NUM_CHANNELS  2             // 13 is the maximum before hitting memory issues!!
                                    // This holds:
                                    // Wind speed pulses (and max)
                                    // Wind vane direction average (and variability - store min and max)
                                    
#define DEBOUNCE_DELAY  5       // debounce delay time in milli-Seconds This also gives max pulses - 50mS = 20 pulses per second                                   
                            
// These three digital pins are for the Device ID selection:
#define  GPIO_ID0      A0  //  A0 Digital 4 on Arduino
#define  GPIO_ID1      A1  //  A1 Digital 5 on Arduino
#define  GPIO_ID2      A2  //  A3 Digital 6 on Arduino

// I2C ADC is on standard I2C Pins: A4 (SDA) and A5 (SCL)
