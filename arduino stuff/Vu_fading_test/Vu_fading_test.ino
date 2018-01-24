/*
  Fading

  This example shows how to fade an LED using the analogWrite() function.

  The circuit:
   LED attached from digital pin 9 to ground.

  Created 1 Nov 2008
  By David A. Mellis
  modified 30 Aug 2011
  By Tom Igoe

  http://www.arduino.cc/en/Tutorial/Fading

  This example code is in the public domain.

*/


int ledPin[3] = {2, 3, 4}; // Assign the pins for the

void setup() {
  for (int i = 0; i < 3; i++) {
    pinMode(ledPin[i], OUTPUT); // setting up all the elements of an array to outPut methode.
  }
}

void loop() {
turnOn();
//delay(30);
turnOff();
//delay(30);

}


void turnOn() {
  for (int fadeValue = 0 ; fadeValue <= 255; fadeValue += 5) {
      delay(20);
    for (int i = 0; i < 3; i++) {
      // sets the value (range from 0 to 255):
      analogWrite(ledPin[i], fadeValue);
      // wait for 30 milliseconds to see the dimming effect


    }
  }
}


void turnOff() {
  for (int fadeValue = 255 ; fadeValue > 0; fadeValue += 5) {
    delay(20);
    for (int i = 0; i < 3; i++) {
      // sets the value (range from 0 to 255):
      analogWrite(ledPin[i], fadeValue);



    }
  }
}



