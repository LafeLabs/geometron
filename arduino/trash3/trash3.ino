/*
All glyphs limited to 16 actions, which can in turn be glyphs which reference glyphs etc

shape table is 32 cells of 16, which maps from 0210 to 0250 in the shape table in js

this code uses decimal instead of octal 

0330 -> 0
0331 -> 1
0332 -> 2
0333 -> 3
0336 -> 4
0337 -> 5
0360 -> 6
0361 -> 7
0300 -> 8


0200 -> 10
0201 -> 11
0202 -> 12
...
0247 -> 31
 
 */

int myInts[64];
int shapeTable[512];
int index = 0;
int readIndex = 0;
float scaleFactor = 2.0;
float side = 1000;
float unit = 1000;

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
    myInts[index] = -1;
  }

  for(int i= 0;i < 512;i++){
    shapeTable[index] = -1;
  }

  myInts[0] = 0;
  myInts[1] = 4;  
  myInts[2] = 0;
  myInts[3] = 4;
  myInts[4] = 0;
  myInts[5] = 4;  
  myInts[6] = 0;
  myInts[7] = 4;
  myInts[8] = 0;
  myInts[9] = 4;  
  myInts[10] = 0;
  myInts[11] = 4;
  myInts[12] = 0;
  myInts[13] = 4;  
  myInts[14] = 0;
  myInts[15] = 8;

}

void loop() {

  drawGlyph(myInts);
  
}

void drawGlyph(int currentGlyph[]){
  for(int i=0;i < 16;i++){
    doTheThing(currentGlyph[i]);
  }
}

void drawShape(int startIndex){
  for(int i=startIndex;i < startIndex + 16;i++){
    doTheThing(shapeTable[i]);
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
    if(localCommand == 8){//reset scale
      side = unit;
    }
    
    if(localCommand >= 10){
      drawShape(localCommand);
    }
}
