int x1,x2,x3,x4;
bool b1,b2,b3,b4;
int threshold = 25;

void setup()
{
  Serial.begin(115200);
  pinMode(10, OUTPUT);
  pinMode(11, OUTPUT);
  pinMode(12, OUTPUT);
  pinMode(13, OUTPUT);
  b1 = false;
  b2 = false;
  b3 = false;
  b4 = false;
  
  
}

void loop()
{

  x1 = 1023 - analogRead(A0);
  if(x1 > threshold){
    b1 = true;
  }
  else{
    b1 = false;
  }
  x2 = 1023 - analogRead(A1);
  if(x2 > threshold){
    b2 = true;
  }
  else{
    b2 = false;
  }
  x3 = 1023 - analogRead(A2);      
  if(x3 > threshold){
    b3 = true;
  }
  else{
    b3 = false;
  }
  x4 = 1023 - analogRead(A3);
  if(x4 > threshold){
    b4 = true;
  }
  else{
    b4 = false;
  }
  if(!b1 && !b2 && !b3 && !b4){//if all 4 inputs are low, make all outputs low
    digitalWrite(11,LOW);
    digitalWrite(12,LOW);
    digitalWrite(13,LOW);
    digitalWrite(10,LOW);    
  }
  if(b1 && !b2 && !b3 && !b4){
    digitalWrite(11,LOW);
    digitalWrite(12,LOW);
    digitalWrite(13,LOW);
    digitalWrite(10,HIGH);
  }
  if(!b1 && b2 && !b3 && !b4){
    digitalWrite(10,LOW);
    digitalWrite(12,LOW);
    digitalWrite(13,LOW);
    digitalWrite(11,HIGH);
  }
  if(!b1 && !b2 && b3 && !b4){
    digitalWrite(10,LOW);
    digitalWrite(11,LOW);
    digitalWrite(13,LOW);
    digitalWrite(12,HIGH);
  }
  if(!b1 && !b2 && !b3 && b4){
    digitalWrite(10,LOW);
    digitalWrite(11,LOW);
    digitalWrite(12,LOW);
    digitalWrite(13,HIGH);
  }

  
  Serial.print(x1);
  Serial.print(",");
  Serial.print(x2);
  Serial.print(",");
  Serial.print(x3);   
  Serial.print(",");
  Serial.println(x4);

}

