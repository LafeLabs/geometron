/*
  Reading a serial ASCII-encoded string.

 This sketch demonstrates the Serial parseInt() function.
 It looks for an ASCII string of comma-separated values.
 It parses them into ints, and uses those to fade an RGB LED.

 Circuit: Common-Cathode RGB LED wired like so:
 * Red anode: digital pin 3
 * Green anode: digital pin 5
 * Blue anode: digital pin 6
 * Cathode : GND

 created 13 Apr 2012
 by Tom Igoe
 
 modified 14 Mar 2016
 by Arturo Guadalupi

 This example code is in the public domain.
 */

int myInts[64];
int index = 0;
int readIndex = 0;
float scaleFactor = 2.0;
float side = 1000;

int pin1A = 13;
int pin1B = 12;

int pin2A = 5;
int pin2B = 6;

void setup() {
  // initialize serial:
  Serial.begin(115200);
  pinMode(pin1A, OUTPUT);
  digitalWrite(pin1A,LOW);
  pinMode(pin1B, OUTPUT);
  digitalWrite(pin1B,LOW);
  pinMode(pin2A, OUTPUT);
  digitalWrite(pin2A,LOW);
  pinMode(pin2B, OUTPUT);
  digitalWrite(pin2B,LOW);
    
  for(index = 0;index < 64;index++){
    myInts[index] = 0;
  }
  
}

void loop() {
  // if there's any serial available, read it:
  while (Serial.available() > 0) {
    
     myInts[readIndex] = Serial.parseInt();

    // look for the newline. That's the end of your
    // sentence:
    readIndex++;
    if (Serial.read() == '\n') {
      for(index = 0;index < 64;index++){
        doTheThing(myInts[index]);
      }
      for(index = 0;index < 64;index++){
        myInts[index] = 0;
      }
      index = 0;
    }
  }
}

void drawGlyph(int currentGlyph[]){
  for(int i=0;i < 16;i++){
    doTheThing(currentGlyph[index]);
  }
}

void doTheThing(int localCommand){

    if(localCommand == 0){
        delay(side);
        digitalWrite(pin1A,HIGH);
        delay(side);
        digitalWrite(pin1A,LOW);
    }
    if(localCommand == 1){
        delay(side);
        digitalWrite(pin1B,HIGH);
        delay(side);
        digitalWrite(pin1B,LOW);
    }
    if(localCommand == 2){
        delay(side);
        digitalWrite(pin2A,HIGH);
        delay(side);
        digitalWrite(pin2A,LOW);
    }
    if(localCommand == 3){
        delay(side);
        digitalWrite(pin2B,HIGH);
        delay(side);
        digitalWrite(pin2B,LOW);
    }
    if(localCommand == 4){
      side /= scaleFactor; // -
    }
    if(localCommand == 5){
      side *= scaleFactor; // +
    }
    if(localCommand == 6){
     // pen down
    }
    if(localCommand == 7){
      // pen up
    }

}
