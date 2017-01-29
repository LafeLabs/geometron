




void setup() {
  analogWrite(5,0);
  analogWrite(7,0);
  
  analogWrite(9,0);
  analogWrite(11,0);
}

void loop() {
  analogWrite(5,255);
  delay(1000);
  analogWrite(5,0);
  analogWrite(7,255);
  delay(200);
  analogWrite(7,0);
  //analogWrite(9,255);
  delay(1000);
  analogWrite(9,0);
  //analogWrite(11,255);
  delay(200);
  analogWrite(11,0);
}
