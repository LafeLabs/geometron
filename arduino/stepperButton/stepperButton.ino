
int a,b,c,d;
int pwmLevel = 255;
int deltat = 10;
void setup() {
  pinMode(2,INPUT);
  pinMode(3,INPUT);
  pinMode(12,INPUT);
  pinMode(13,INPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  
  Serial.begin(115200);
  a = 0;
  b = 0;
  c = 0;
  d = 0;
  
}

void loop() {
  a = digitalRead(2);
  b = digitalRead(3);
  c = digitalRead(12);
  d = digitalRead(13);
  Serial.print(a);
  Serial.print(b);
  Serial.print(c);
  Serial.print(d);
  Serial.println();

  if(b == 1 && a == 0){
    analogWrite(5,pwmLevel);
    delay(deltat);
    analogWrite(5,0);
    analogWrite(9,pwmLevel);
    delay(deltat);
    analogWrite(9,0);
    analogWrite(6,pwmLevel);
    delay(deltat);
    analogWrite(6,0);
    analogWrite(10,pwmLevel);
    delay(deltat);
    analogWrite(10,0);
  }
  else{
    analogWrite(5,0);
    analogWrite(6,0);
    analogWrite(9,0);
    analogWrite(10,0);  
  }  
  if(c == 1 && d ==0){
    analogWrite(5,pwmLevel);
    delay(deltat);
    analogWrite(5,0);
    analogWrite(10,pwmLevel);
    delay(deltat);
    analogWrite(10,0);
    analogWrite(6,pwmLevel);
    delay(deltat);
    analogWrite(6,0);
    analogWrite(9,pwmLevel);
    delay(deltat);
    analogWrite(9,0);
  }
  else{
    analogWrite(5,0);
    analogWrite(6,0);
    analogWrite(9,0);
    analogWrite(10,0);  
  }
  
}
