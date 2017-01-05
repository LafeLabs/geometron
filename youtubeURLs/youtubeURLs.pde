//https://youtu.be/Hd054bdCnuc

import processing.pdf.*;

float side = 50;
float roctalSide = 50;

float x,y;

//String fullUrl = "https://youtu.be/Hd054bdCnuc";
String fullUrl = "https://youtu.be/";

void setup(){
// size(600,600); 
 size(600,600,PDF,"youtubeURL.pdf"); 
 noFill();
 textSize(30);
 strokeWeight(0.25);
}

void draw(){
  background(255);
  fill(0);
  rect(2*roctalSide,roctalSide,roctalSide,roctalSide);
  rect(roctalSide,2*roctalSide,roctalSide,roctalSide);  
  rect(10*roctalSide,10*roctalSide,roctalSide,roctalSide);

  noFill();
  rect(2*roctalSide,2*roctalSide,8*roctalSide,8*roctalSide);
  for(int index = 0;index < fullUrl.length();index++){
    x = 2*roctalSide + (index%8)*roctalSide;
    y = 2*roctalSide + (index/8)*roctalSide;
    drawRoctal(fullUrl.charAt(index));
    fill(0);
    textSize(14);
    text(fullUrl.charAt(index),x + roctalSide/4,y + roctalSide/4);
  }
  for(int index = fullUrl.length();index < 64;index++){
    x = 2*roctalSide + (index%8)*roctalSide;
    y = 2*roctalSide + (index/8)*roctalSide;
    drawRoctal(0);
  }
  
  exit();
}
void drawRoctal(int localByte){
 noFill();
 rect(x,y,roctalSide,roctalSide);
 fill(0);
 rect(x,y,roctalSide/8,roctalSide/8);
 rect(x + roctalSide/8,y + roctalSide/8,roctalSide/8,roctalSide/8);
 fill(255);
 rect(x + roctalSide/8,y,roctalSide/8,roctalSide/8);
 rect(x,y + roctalSide/8,roctalSide/8,roctalSide/8);
 for(int rowIndex = 0;rowIndex < 3;rowIndex++){
  for(int columnIndex = 0;columnIndex < 3;columnIndex++){
     int bitIndex = 3*(2 - rowIndex) + (2 - columnIndex);
     if((1 & (localByte >> bitIndex)) == 1){
       fill(0);
     }
     else{
        fill(255); 
     }
     rect(x + (roctalSide/4) + columnIndex*(roctalSide/4),y + (roctalSide/4) + (roctalSide/4)*rowIndex,roctalSide/4,roctalSide/4); 
  }
 }
}