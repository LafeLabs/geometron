
int delayTime = 30;

void setup() {
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);

  pinMode(4,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);
  pinMode(7,OUTPUT);
  
  digitalWrite(10,LOW);
  digitalWrite(11,LOW);
  digitalWrite(12,LOW);
  digitalWrite(13,LOW);

  digitalWrite(4,LOW);
  digitalWrite(5,LOW);
  digitalWrite(6,LOW);
  digitalWrite(7,LOW);

}

void loop() {
/*
  digitalWrite(10,HIGH);
  delay(delayTime);
  digitalWrite(10,LOW);
  digitalWrite(11,HIGH);
 delay(delayTime);
  digitalWrite(11,LOW);
 digitalWrite(12,HIGH);
 delay(delayTime);
 digitalWrite(12,LOW);
  digitalWrite(13,HIGH);
  delay(delayTime);
  digitalWrite(13,LOW);
*/
  digitalWrite(4,HIGH);
  delay(delayTime);
  digitalWrite(4,LOW);
  digitalWrite(5,HIGH);
  delay(delayTime);
  digitalWrite(5,LOW);
  digitalWrite(6,HIGH);
  delay(delayTime);
  digitalWrite(6,LOW);
  digitalWrite(7,HIGH);
  delay(delayTime);
  digitalWrite(7,LOW);

 
}
