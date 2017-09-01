
int a,b,c,d;
int pwmLevel = 255;
int deltat = 10;
void setup() {
  pinMode(2,INPUT);
  pinMode(3,INPUT);
  pinMode(4,INPUT);
  pinMode(5,INPUT);

  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
  pinMode(8,OUTPUT);
  pinMode(9,OUTPUT);
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);
  
  Serial.begin(115200);
  a = 0;
  b = 0;
  c = 0;
  d = 0;
  
}

void loop() {
  a = digitalRead(2);
  b = digitalRead(3);
  c = digitalRead(4);
  d = digitalRead(5);
  Serial.print(a);
  Serial.print(b);
  Serial.print(c);
  Serial.print(d);
  Serial.println();

  if(a == 1){
    analogWrite(6,pwmLevel);
    delay(deltat);
    analogWrite(6,0);
    analogWrite(8,pwmLevel);
    delay(deltat);
    analogWrite(8,0);
    analogWrite(7,pwmLevel);
    delay(deltat);
    analogWrite(7,0);
    analogWrite(9,pwmLevel);
    delay(deltat);
    analogWrite(9,0);
  }
  if(b == 1){
    analogWrite(6,pwmLevel);
    delay(deltat);
    analogWrite(6,0);
    analogWrite(9,pwmLevel);
    delay(deltat);
    analogWrite(9,0);
    analogWrite(7,pwmLevel);
    delay(deltat);
    analogWrite(7,0);
    analogWrite(8,pwmLevel);
    delay(deltat);
    analogWrite(8,0);
  }
  if(c == 1){
    analogWrite(10,pwmLevel);
    delay(deltat);
    analogWrite(10,0);
    analogWrite(12,pwmLevel);
    delay(deltat);
    analogWrite(12,0);
    analogWrite(11,pwmLevel);
    delay(deltat);
    analogWrite(11,0);
    analogWrite(13,pwmLevel);
    delay(deltat);
    analogWrite(13,0);
  }
  if(d == 1){
    analogWrite(10,pwmLevel);
    delay(deltat);
    analogWrite(10,0);
    analogWrite(13,pwmLevel);
    delay(deltat);
    analogWrite(13,0);
    analogWrite(11,pwmLevel);
    delay(deltat);
    analogWrite(11,0);
    analogWrite(12,pwmLevel);
    delay(deltat);
    analogWrite(12,0);
  }
}
