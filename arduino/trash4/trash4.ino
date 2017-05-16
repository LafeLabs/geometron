
int shapeTable[512];
int mainGlyph[64];
int index = 0;
int readIndex = 0;
float scaleFactor = 2.0;
float side = 400;
float unit = 100;

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
    
    
  digitalWrite(pin1A,HIGH);
  digitalWrite(pin1B,LOW);
  delay(side);
  digitalWrite(pin1A,LOW);
  digitalWrite(pin1B,LOW);
  delay(100);    

  digitalWrite(pin2A,HIGH);
  digitalWrite(pin2B,LOW);
  delay(side/2);
  digitalWrite(pin2A,LOW);
  digitalWrite(pin2B,LOW);
  delay(100);    
  
  digitalWrite(pin1A,LOW);
  digitalWrite(pin1B,HIGH);
  delay(side);
  digitalWrite(pin1A,LOW);
  digitalWrite(pin1B,LOW);
  delay(100);    

  digitalWrite(pin2A,LOW);
  digitalWrite(pin2B,HIGH);
  delay(side/2);
  digitalWrite(pin2A,LOW);
  digitalWrite(pin2B,LOW);
  delay(100);    
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

