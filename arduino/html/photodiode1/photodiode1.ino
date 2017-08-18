float raw0;
float raw;
float y;
int sensorPin = A0;    // select the input pin for the potentiometer

void setup()
{
  Serial.begin(115200);
  raw0 = analogRead(sensorPin); 
  pinMode(9, OUTPUT);
  
}

void loop()
{

  raw = 0;
  for(int index = 0;index < 50;index++){
      raw += analogRead(A0);
  }
  raw /= 50;
  y = 8*abs(raw - raw0);
  Serial.println(y);
  if(y > 100){
    digitalWrite(9,HIGH);    
  }
  else{
    digitalWrite(9,LOW);    
  }

}

