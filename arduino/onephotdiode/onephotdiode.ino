int x1;
void setup() {
   Serial.begin(115200);
   pinMode(5,OUTPUT);
   
}

void loop() {
  x1 = 1023 - analogRead(A5);
  Serial.println(x1);
  if(x1 > 500){
    digitalWrite(5,HIGH);
  }
  else{
    digitalWrite(5,LOW);
  }
}
