


int raw,raw1,raw2,raw3,raw4;
int pin1 = 5;
int pin2 = 6;
int pin3 = 9;
int pin4 = 10; 
bool button1,button2,button3,button4;
int raw0;
int sensorPin = A0;    // select the input pin for the potentiometer

void setup()
{
  Serial.begin(115200);
  raw0 = analogRead(sensorPin); 
}

void loop()
{

  raw = analogRead(A2);
  raw /=4;
  raw1 = analogRead(A0);
  if(raw1 > 500){
    button1 = true;
  }
  else{
    button1 = false;
  }
  raw2 = analogRead(A1);
  if(raw2 > 500){
    button2 = true;
  }
  else{
    button2 = false;
  }
  raw3 = analogRead(A4);
  if(raw3 > 500){
    button3 = true;
  }
  else{
    button3 = false;
  }
  raw4 = analogRead(A5);
  if(raw4 > 500){
    button4 = true;
  }
  else{
    button4 = false;
  }

  Serial.print(button1);
  Serial.print(button2);
  Serial.print(button3);
  Serial.println(button4);
  if(button1 && !button2 && !button3 && !button4){
      analogWrite(pin2,0);
      analogWrite(pin3,0);
      analogWrite(pin4,0);
      analogWrite(pin1,raw);
  }
  if(!button1 && button2 && !button3 && !button4){
      analogWrite(pin1,0);
      analogWrite(pin3,0);
      analogWrite(pin4,0);
      analogWrite(pin2,raw);
  }
  if(!button1 && !button2 && button3 && !button4){
      analogWrite(pin1,0);
      analogWrite(pin2,0);
      analogWrite(pin4,0);
      analogWrite(pin3,raw);
  }
  if(!button1 && !button2 && !button3 && button4){
      analogWrite(pin1,0);
      analogWrite(pin3,0);
      analogWrite(pin2,0);
      analogWrite(pin4,raw);
  }
  Serial.println(raw);
  
  delay(10);
}

