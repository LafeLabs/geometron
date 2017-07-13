int inputPin = A1;
int outputPin = 5;
int x = 0;
int x0 = 377;
int x1 = 647;

void setup() {
    Serial.begin(115200);
    pinMode(outputPin, OUTPUT);
}

void loop() {
  x = analogRead(inputPin);
  if(x > x1){
      digitalWrite(outputPin,LOW);
  }
  if(x < x0){
      digitalWrite(outputPin,HIGH);
  }
  Serial.println(x);
  delay(10);

}
