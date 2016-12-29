import processing.pdf.*;

int side = 50;

void setup(){
// size(800,400); 
 size(400,600,PDF,"ASCIIwhole.pdf"); 
 noFill();
 textSize(30);
}

void draw(){
  background(255);
  for(int yindex = 4;yindex  < 8;yindex++){
     for(int xindex = 0;xindex < 8;xindex++){
         rect(xindex*side,(yindex-4)*side,side,side);
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