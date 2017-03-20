
int delayTime = 300;

void setup() {
  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(5,OUTPUT);
  pinMode(6,OUTPUT);

  digitalWrite(10,LOW);
  digitalWrite(11,LOW);
  digitalWrite(5,LOW);
  digitalWrite(6,LOW);

}

void loop() {

  digitalWrite(10,HIGH);
  delay(delayTime);
  digitalWrite(10,LOW);
  digitalWrite(11,HIGH);
 delay(delayTime);
  digitalWrite(11,LOW);
 digitalWrite(5,HIGH);
 delay(delayTime);
 digitalWrite(5,LOW);
  digitalWrite(6,HIGH);
  delay(delayTime);
  digitalWrite(6,LOW);
 
}
