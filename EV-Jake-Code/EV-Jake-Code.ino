#include <servo.h>
#include <Adafruit_SSD1306.h>
#include "config.h"

Adafruit_SSD1306 SCREEN(SCREEN_WIDTH, SCREEN_HEIGHT, SCREEN_WIRE, OLED_RESET);

Servo MOTOR_ESC;
Servo FAN_ESC;

double DIST;//in meters
int STATE;//for screen
bool READY;

//For increment menu
double DELTA_X_OPTIONS[] = { 1, 0.25, 0.1, 0.01, 0.001 };
int DELTA_X_I;

uint8_t BTN_PINS[] = { BTN0, BTN1, BTN2, BTN3, BTN4 };
bool BTN_PREV_STATES[] = { LOW, LOW, LOW, LOW, LOW };

bool BTN_STATE(uint8_t index) {
  bool buttonstate = digitalRead(BTN_PINS[index]);
  if (buttonstate != BTN_PREV_STATES[index]) {
    BTN_PREV_STATES[index] = buttonstate;
    if (buttonstate == HIGH) {
      return true;
    }
  }
  return false;
}

void run(double d){

}

void setup(){

}

void loop(){

}