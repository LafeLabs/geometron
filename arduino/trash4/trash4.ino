
int shapeTable[512];
int mainGlyph[64];
int index = 0;
int readIndex = 0;
float scaleFactor = 2.0;
float side = 170;
float unit = 170;

int pin1A = 8;
int pin1B = 9;

int pin2A = 10;
int pin2B = 11;

void setup() {

  pinMode(pin1A, OUTPUT);
  digitalWrite(pin1A,LOW);
  pinMode(pin1B, OUTPUT);
  digitalWrite(pin1B,LOW);
  pinMode(pin2A, OUTPUT);
  digitalWrite(pin2A,LOW);
  pinMode(pin2B, OUTPUT);
  digitalWrite(pin2B,LOW);
    
    
  for(int i= 0;i < 512;i++){
    shapeTable[index] = -1;
  }
  for(int i= 0;i < 64;i++){
    mainGlyph[index] = -1;
  }
mainGlyph[0] = 0;
mainGlyph[1] = 2;
mainGlyph[2] = 1;
mainGlyph[3] = 3;
mainGlyph[4] = 4;
mainGlyph[5] = 0;
mainGlyph[6] = 2;
mainGlyph[7] = 1;
mainGlyph[8] = 3;
mainGlyph[9] = 4;
mainGlyph[10] = 0;
mainGlyph[11] = 2;
mainGlyph[12] = 1;
mainGlyph[13] = 3;
mainGlyph[14] = 4;
mainGlyph[15] = 0;
mainGlyph[16] = 2;
mainGlyph[17] = 1;
mainGlyph[18] = 3;
drawGlyph(mainGlyph);

}

void loop() {

  
}

void drawGlyph(int currentGlyph[]){
  for(int i=0;i < 64;i++){
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

