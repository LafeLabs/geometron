
float side = 1000;
float scaleFactor = 2;
int buttonValue = 0;
int buttonArray[] = {91,144,203,291,465,1023};
int commandArray[] = {0330,0331,0332,0333,0336,0337};
int buttonDelta = 20;
int commandValue = 0;
int buttonOld = 0;

void setup() {
  analogWrite(5,0);
  analogWrite(6,0);
  analogWrite(9,0);
  analogWrite(10,0);
  Serial.begin(115200);
}

void loop() {
  buttonValue = analogRead(A0);
  if(buttonValue != 0 && buttonOld == 0){
    commandValue = button2command(buttonValue);
    if(commandValue != 0){
      Serial.println(commandValue);
    }
  }
  buttonOld = buttonValue;
  delay(1);
}

int button2command(int localButtonValue){

  int localCommand = 0;
  for(int index = 0;index < 6;index++){
    if( abs(localButtonValue - buttonArray[index]) < buttonDelta){
        localCommand = commandArray[index];
        doTheThing(localCommand);
    }
  }
  return localCommand;
}

void doTheThing(int localByte){
  if(localByte == 0330){
      analogWrite(5,255);
      analogWrite(9,255);
      delay(side);
      analogWrite(5,0);
      analogWrite(9,0);
  }
  if(localByte == 0331){
      analogWrite(6,255);
      analogWrite(10,255);
      delay(side);
      analogWrite(6,0);
      analogWrite(10,0);
  }
  if(localByte == 0332){
      analogWrite(5,255);
      analogWrite(10,255);
      delay(side);
      analogWrite(5,0);
      analogWrite(10,0);
  }
  if(localByte == 0333){
      analogWrite(6,255);
      analogWrite(9,255);
      delay(side);
      analogWrite(6,0);
      analogWrite(9,0);
  }
  if(localByte == 0336){
    side /= scaleFactor;
  }
  if(localByte == 0337){
    side *= scaleFactor;
  }
    
}

