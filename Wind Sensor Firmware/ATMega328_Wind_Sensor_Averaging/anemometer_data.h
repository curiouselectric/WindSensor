#pragma once

#include <stdio.h>
#include <Arduino.h>
#include "config.h"

class data_channel {
  public:
    int   id;
    float data_1s;
    float data_10s;
    float data_60s;
    float data_600s;
    float data_3600s;
    float data_min;     // Holds the minimum value ever recorded until reset
                          // Once read and recorded then this value is reset 
    float data_max;     // Holds the maximum value ever recorded until reset
                          // Once read and recorded then this value is reset 
    float data_1s_holder;
    float data_10s_holder;
    float data_60s_holder;
    float data_600s_holder;
    float data_3600s_holder;

    float wind_speed_conv_m;  // The conversion is y=mx+c, with the m and c here.
    float wind_speed_conv_c;
    
    // This is the constructor
    data_channel() {
      data_1s = 0; data_10s = 0; data_60s = 0; data_600s = 0; data_3600s = 0; 
      data_min = 99999; data_max = -99999;
    }
};
