
int sensorPin = A2;
int sensorValue = 0;
void setup() {
    Serial.begin(9600);
}

void loop() {
  // read the value from the sensor:
  sensorValue = analogRead(sensorPin);
  Serial.println(sensorValue);
  delay(100);
}
