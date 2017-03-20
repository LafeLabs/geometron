float unit = 25;
float side = unit;
float scaleFactor = 2;
float theta0 = 0;
float theta = theta0;
float thetaStep  = PI/2;
float x0 = 0;
float y0 = 0;
float stepperX = x0;
float stepperY = y0;
float phi = 0.5*(sqrt(5) + 1);
int delayTime = 20;
float x = x0;
float y = y0;




void setup() {
  pinMode(2,OUTPUT);
  pinMode(8,OUTPUT);
  pinMode(4,OUTPUT);
  pinMode(6,OUTPUT);
  digitalWrite(2,LOW);
  digitalWrite(8,LOW);
  digitalWrite(4,LOW);
  digitalWrite(6,LOW);

  pinMode(10,OUTPUT);
  pinMode(11,OUTPUT);
  pinMode(12,OUTPUT);
  pinMode(13,OUTPUT);
  digitalWrite(10,LOW);
  digitalWrite(11,LOW);
  digitalWrite(12,LOW);
  digitalWrite(13,LOW);

}

void loop() {

   // doTheThing(0330);
   // doTheThing(0340);

    doTheThing(0332);
    doTheThing(0341);
    
   // doTheThing(0331);
  //  doTheThing(0340);

    doTheThing(0333);
    doTheThing(0341);

}

void motorMove(int steps,String motorName){

  if(motorName == "x" && steps > 0){
    for(int index = 0;index < steps;index++){
      digitalWrite(2,HIGH);
      delay(delayTime);
      digitalWrite(2,LOW);
      digitalWrite(4,HIGH);
      delay(delayTime);
      digitalWrite(4,LOW);
      digitalWrite(8,HIGH);
      delay(delayTime);
      digitalWrite(8,LOW);
      digitalWrite(6,HIGH);
      delay(delayTime);
      digitalWrite(6,LOW);
    }
  }
  if(motorName == "x" && steps < 0){
    for(int index = 0;index < -steps;index++){
      digitalWrite(2,HIGH);
      delay(delayTime);
      digitalWrite(2,LOW);
      digitalWrite(6,HIGH);
      delay(delayTime);
      digitalWrite(6,LOW);
      digitalWrite(8,HIGH);
      delay(delayTime);
      digitalWrite(8,LOW);
      digitalWrite(4,HIGH);
      delay(delayTime);
      digitalWrite(4,LOW);
    }
  }
  
  if(motorName == "y" && steps > 0){
    for(int index = 0;index < steps;index++){
      digitalWrite(10,HIGH);
      delay(delayTime);
      digitalWrite(10,LOW);
      digitalWrite(12,HIGH);
      delay(delayTime);
      digitalWrite(12,LOW);
      digitalWrite(11,HIGH);
      delay(delayTime);
      digitalWrite(11,LOW);
      digitalWrite(13,HIGH);
      delay(delayTime);
      digitalWrite(13,LOW);
    }
  }
  if(motorName == "y" && steps < 0){
    for(int index = 0;index < -steps;index++){
      digitalWrite(10,HIGH);
      delay(delayTime);
      digitalWrite(10,LOW);

      digitalWrite(13,HIGH);
      delay(delayTime);
      digitalWrite(13,LOW);

      digitalWrite(11,HIGH);
      delay(delayTime);
      digitalWrite(11,LOW);

      digitalWrite(12,HIGH);
      delay(delayTime);
      digitalWrite(12,LOW);

    }
  }


}
  
void doTheThing(int localCommand){
  if(localCommand == 0300){
    x = x0;
    y = y0;
    side = unit;
    scaleFactor = 2;
    theta = theta0;
    thetaStep  = PI/2;
  }
    if(localCommand == 0304){
      thetaStep = PI/2;
    }
    if(localCommand == 0305){
      thetaStep = 2*PI/5;
    }
    if(localCommand == 0306){
      thetaStep = PI/3;
    }    
    if(localCommand == 0310){
       scaleFactor = sqrt(2); 
    }
    if(localCommand == 0311){
       scaleFactor = phi; //"golden" ratio 
    }
    if(localCommand == 0312){
       scaleFactor = sqrt(3); 
    }
    if(localCommand == 0313){
      scaleFactor = 2;  //2x
    }
    if(localCommand == 0314){
      scaleFactor = 3;  //3x
    }
    if(localCommand == 0317){
       side = unit; 
    }
    if(localCommand == 0330){
      x += side*cos(theta);   
      y += side*sin(theta); 
    }
    if(localCommand == 0331){
      x -= side*cos(theta);   
      y -= side*sin(theta); 
    }
    if(localCommand == 0332){
      x += side*cos(theta - thetaStep);
      y += side*sin(theta - thetaStep);
    }
    if(localCommand == 0333){
      x += side*cos(theta + thetaStep);
      y += side*sin(theta + thetaStep);
    }
    if(localCommand == 0334){
      theta -= thetaStep; // CCW
    }
    if(localCommand == 0335){
      theta += thetaStep; // CW
    }
    if(localCommand == 0336){
      side /= scaleFactor; // -
    }
    if(localCommand == 0337){
      side *= scaleFactor; // +
    }

    if(localCommand == 0340){//move x stepper to x
      motorMove(int(x-stepperX),"x");
      stepperX = x;
    }
    if(localCommand == 0341){//move y stepper to y
      motorMove(int(y-stepperY),"y");
      stepperY = y;
    }

    if(localCommand == 0350){
      thetaStep /= 2;  //angle/2
    }
    if(localCommand == 0351){
      thetaStep *= 2;  //2angle
    }
    if(localCommand == 0352){
      thetaStep /= 3; //angle/3
    }
    if(localCommand == 0353){
      thetaStep *= 3; //3angle
    }
}

