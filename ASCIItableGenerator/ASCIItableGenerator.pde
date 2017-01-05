import processing.pdf.*;

float side = 50;
float roctalSide = 16;

float x,y;

void setup(){
// size(400,600); 
 size(400,600,PDF,"ASCIIwhole.pdf"); 
 noFill();
 textSize(30);
 strokeWeight(0.25);
}

void draw(){
  background(255);
  for(int yindex = 4;yindex  < 8;yindex++){
     for(int xindex = 0;xindex < 8;xindex++){
         rect(xindex*side,(yindex-4)*side,side,side);
         x = xindex*side + 0.6*side;
         y = (yindex-4)*side + 0.6*side;
         drawRoctal(xindex + 8*yindex);
         fill(0);
         textSize(10);
         String localString = "00";
         localString += char(yindex + 060);
         localString += char(xindex + 060);
         text(localString,(xindex + 0.1)*side,(yindex-3.8)*side);
         textSize(30);
         text(char(xindex + 8*yindex),(xindex + 0.1)*side,(yindex-3.1)*side);
         noFill(); 
    }
  }
    for(int yindex = 0;yindex  < 8;yindex++){
     for(int xindex = 0;xindex < 8;xindex++){
         rect(xindex*side,(yindex+4)*side,side,side);
         x = xindex*side + 0.6*side;
         y = (yindex+4)*side + 0.6*side;
         drawRoctal(0100 + xindex + 8*yindex);
         fill(0);
         textSize(10);
         String localString = "01";
         localString += char(yindex + 060);
         localString += char(xindex + 060);
         text(localString,(xindex + 0.1)*side,4*side + (yindex + 0.2)*side);
         textSize(30);
         if(!(xindex == 7 && yindex ==7)){
             text(char(0100 + xindex + 8*yindex),(xindex + 0.1)*side, 4*side + (yindex + 0.8)*side);       
         }
         noFill(); 
    }
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