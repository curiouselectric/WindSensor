#pragma once

#include <Arduino.h>
#include <Wire.h>

#define LED0_PIN          7 
#define SWA_PIN           8

#define HC12_PWR_PIN      7     // This is a power output for the HC12 unit - set to LED0 at present

#define FREQ_PIN          2
#define VANE_PIN          A3

#define LED_FLASH_TIME    5000   // time in mS between LED flashes
#define LED_ON_TIME       100   // time in mS of the flash length

#define POWER_SETTLE_TIME 50    // Time in mS to wait after power is applied before sending serial data and time to wait after data set before switching off power.

//// The baud rate for serial communications
#define MAX_BAUD_RATES    5

#define ADD_CRC_CHECK     true    // Use this to add CRC check to incomming and outgoing messages

#define DEBUG_FLAG        false   // Use this for debugging. Not need for roll out.
#define DEBUG_DATA_1S     false   // Use this for debugging. Not need for roll out.
#define DEBUG_DATA_10S    false   // Use this for debugging. Not need for roll out.
#define DEBUG_DATA_60S    false   // Use this for debugging. Not need for roll out.
#define DEBUG_DATA_600S   false   // Use this for debugging. Not need for roll out.
#define DEBUG_DATA_3600S  false   // Use this for debugging. Not need for roll out.
                                    
#define DEBOUNCE_DELAY    5       // debounce delay time in milli-Seconds This also gives max pulses - 5mS = 200 pulses per second                                   
                            
// These three digital pins are for the Device ID selection:
#define  GPIO_ID0      A0  //  A0 Digital 4 on Arduino
#define  GPIO_ID1      A1  //  A1 Digital 5 on Arduino
#define  GPIO_ID2      A2  //  A3 Digital 6 on Arduino

// I2C ADC is on standard I2C Pins: A4 (SDA) and A5 (SCL)
