import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class glyphDraw1 extends PApplet {

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
float theta,theta0,thetaStep;
int[] currentGlyph = {};

public void setup(){
  ellipseMode(CENTER);
  noFill();
  strokeWeight(1);
  side = 50;
  thetaStep = PI/2;
  theta0 = -PI/2; 
  theta = theta0;
  
  x0 = 250;
  y0 = 250;
  x = x0;
  y = y0;
}

public void draw(){
 background(255);
 image(loadImage("firstDrawGlyphs.png"),0,0,447,163);
 doTheThing(0300);
 drawGlyph(currentGlyph);
 drawCursor();
}

public void drawCursor(){
  strokeWeight(3);
  line(x,y,x + side*cos(theta),y + side*sin(theta));
  strokeWeight(1);
  line(x,y,x + side*cos(theta + thetaStep),y+side*sin(theta + thetaStep));
  line(x,y,x + side*cos(theta - thetaStep),y+side*sin(theta - thetaStep));
}

public void keyPressed(){
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
  if(key == 8){ //delete key
    if(currentGlyph.length != 0){
      currentGlyph = shorten(currentGlyph);
    }
  }
}

public void drawGlyph(int[] localGlyph){
  for(int index = 0;index < localGlyph.length;index++){
    doTheThing(localGlyph[index]);  
  }  
}

public void doTheThing(int localCommand){
    if(localCommand == 0300){
      x = x0;
      y = y0;
      theta = theta0;
    }
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


  public void settings() {  size(500,500); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "glyphDraw1" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
