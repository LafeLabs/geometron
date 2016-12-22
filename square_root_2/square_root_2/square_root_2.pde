//EVERYTHING IS PHYSICAL
//EVERYTHING IS GLOBAL
//EVERYTHING IS ALWAYS RECURSIVE
//NO LAWS NO PROPERTY NO MINING NO NUMBERS NO MINERALS
//THE SOLE PURPOSE OF THE EXISTING SOFTWARE INDUSTRY IS TO CREATE AND MAINTAIN STRUCTURAL VIOLENCE, \
//ALL COMPUTER "SCIENCE" IS EVIL
//ALL "TECH" COMPANIES ARE BASED ON FRAUD AND LIES
//SMASH THE TECHNOCRATIC PRIESTHOOD

float x,y,x0,y0;
float side;
float scaleFactor, unit;
float theta,theta0,thetaStep;
int[] currentGlyph = {};

void setup(){
  ellipseMode(CENTER);
  noFill();
  strokeWeight(1);
  unit = 50;
  scaleFactor = 2;
  side = 50;
  thetaStep = PI/2;
  theta0 = -PI/2; 
  theta = theta0;
  size(500,500);
  x0 = 250;
  y0 = 250;
  x = x0;
  y = y0;
}

void draw(){
 background(255);
 image(loadImage("root2fullkey.png"),0,0,500,170);
 doTheThing(0300);
 drawGlyph(currentGlyph);
 drawCursor();
}

void drawCursor(){
  stroke(color(255,0,0));
  line(x,y,x + scaleFactor*side*cos(theta),y+scaleFactor*side*sin(theta));
  strokeWeight(3);
  stroke(0);
  line(x,y,x + side*cos(theta),y + side*sin(theta));
  stroke(color(0,0,255));
  strokeWeight(4);
  line(x,y,x + (side/scaleFactor)*cos(theta),y+(side/scaleFactor)*sin(theta));
  strokeWeight(1);
  stroke(0);
  line(x,y,x + side*cos(theta + thetaStep),y+side*sin(theta + thetaStep));
  line(x,y,x + side*cos(theta - thetaStep),y+side*sin(theta - thetaStep));
}

void keyPressed(){
   if(key == 'a'){
     currentGlyph = append(currentGlyph,0330);
  }
  if(key == 's'){
     currentGlyph = append(currentGlyph,0331);
  }
  if(key == 'd'){
     currentGlyph = append(currentGlyph,0332);
  }
  if(key == 'f'){
     currentGlyph = append(currentGlyph,0333);
  }
  if(key == 'g'){
     currentGlyph = append(currentGlyph,0334);
  }
  if(key == 'h'){
     currentGlyph = append(currentGlyph,0335);
  }
  if(key == 'z'){
     currentGlyph = append(currentGlyph,0340);
  }
  if(key == 'x'){
     currentGlyph = append(currentGlyph,0341);
  }
  if(key == 'c'){
     currentGlyph = append(currentGlyph,0342);
  }
  if(key == '0'){
     currentGlyph = append(currentGlyph,0300);   
  }
  if(key == 'v'){
     currentGlyph = append(currentGlyph,0200);         
  }
   if(key == '-'){
     currentGlyph = append(currentGlyph,0336);               
  }
  if(key == '='){
     currentGlyph = append(currentGlyph,0337);               
  }
  if(key == 'j'){
     currentGlyph = append(currentGlyph,0350);                   
  }
  if(key == 'k'){
     currentGlyph = append(currentGlyph,0351);                   
  }
  if(key == 'l'){
     currentGlyph = append(currentGlyph,0352);                   
  }
  if(key == ';'){
     currentGlyph = append(currentGlyph,0353);                   
  }
  if(key == 'r'){
     currentGlyph = append(currentGlyph,0313);                   
  }
  if(key == 'q'){
     currentGlyph = append(currentGlyph,0310);                   
  }
  if(key == 'b'){
     currentGlyph = append(currentGlyph,0343);                   
  }
  if(key == 'n'){
     currentGlyph = append(currentGlyph,0201); 
  }
  
  if(key == '!'){
    currentGlyph = append(currentGlyph,0200);
  }
  if(key == '@'){
     currentGlyph = append(currentGlyph,0201); 
  }
  if(key == '#'){
     currentGlyph = append(currentGlyph,0202); 
  }
  if(key == 8){ //delete key
    if(currentGlyph.length != 0){
      currentGlyph = shorten(currentGlyph);
    }
  }
}

void drawGlyph(int[] localGlyph){
  for(int index = 0;index < localGlyph.length;index++){
    doTheThing(localGlyph[index]);  
  }  
}

void doTheThing(int localCommand){
    if(localCommand == 0300){
      x = x0;
      y = y0;
      theta = theta0;
      side = unit;
      thetaStep = PI/2;
      scaleFactor = 2;
    }
    if(localCommand == 0304){
      thetaStep = PI/2;
    }
    if(localCommand == 0310){
       scaleFactor = sqrt(2); 
    }
    if(localCommand == 0313){
      scaleFactor = 2;  //2x
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
    if(localCommand == 0340){
      strokeWeight(5);
      point(x,y);
      strokeWeight(1);//point
    }
    if(localCommand == 0341){
      ellipse(x,y,2*side,2*side);//circle
    }
    if(localCommand == 0342){
      line(x,y,x + side*cos(theta),y + side*sin(theta));//line
    }
    if(localCommand == 0343){
        arc(x,y,2*side,2*side,theta - thetaStep,theta + thetaStep);//arc
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
    if(localCommand == 0200){
       int[] localGlyph = {0304,0342,0330,0334,0342,0330,0334,0342,0330,0334,0342,0330,0334}; 
       drawGlyph(localGlyph);
    }
    if(localCommand == 0201){
       int[] localGlyph = {0313,0336,0330,0350,0334,0310,0337,0200}; 
       drawGlyph(localGlyph);
    }
    if(localCommand == 0202){
       int[] localGlyph = {0350,0335,0336,0200};
       drawGlyph(localGlyph);
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