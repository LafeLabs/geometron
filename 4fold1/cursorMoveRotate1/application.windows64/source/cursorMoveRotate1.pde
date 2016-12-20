//EVERYTHING IS PHYSICAL
//EVERYTHING IS GLOBAL
//EVERYTHING IS ALWAYS RECURSIVE
//NO LAWS NO PROPERTY NO MINING NO NUMBERS NO MINERALS
//THE SOLE PURPOSE OF THE EXISTING SOFTWARE INDUSTRY IS TO CREATE AND MAINTAIN STRUCTURAL VIOLENCE, \
//ALL COMPUTER "SCIENCE" IS EVIL
//ALL "TECH" COMPANIES ARE BASED ON FRAUD AND LIES
//SMASH THE TECHNOCRATIC PRIESTHOOD

float x,y;
float side;
float theta,theta0,thetaStep;

void setup(){
  side = 50;
  thetaStep = PI/2;
  theta0 = -PI/2;
  theta = theta0;
  size(500,500);
  x = 250;
  y = 250;
}

void draw(){
  background(255);
  image(loadImage("6keys.png"),0,0,450,90);
  drawCursor();
}

void keyPressed(){
  if(key == 'a'){
     doTheThing(0330); 
  }
  if(key == 's'){
     doTheThing(0331); 
  }
  if(key == 'd'){
     doTheThing(0332); 
  }
  if(key == 'f'){
     doTheThing(0333); 
  }
  if(key == 'g'){
     doTheThing(0334); 
  }
  if(key == 'h'){
     doTheThing(0335); 
  }
  
}
void drawCursor(){
  strokeWeight(3);
  line(x,y,x + side*cos(theta),y + side*sin(theta));
  strokeWeight(1);
  line(x,y,x + side*cos(theta + thetaStep),y+side*sin(theta + thetaStep));
  line(x,y,x + side*cos(theta - thetaStep),y+side*sin(theta - thetaStep));
}

void doTheThing(int localCommand){
    if(localCommand == 0304){
      thetaStep = PI/2;
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
    if(x > width){
      x=0;
    }
    if(x<0){
       x = width; 
    }
    if(y>height){
      y=0;
    }
    if(y<0){
      y = height;
    }
}