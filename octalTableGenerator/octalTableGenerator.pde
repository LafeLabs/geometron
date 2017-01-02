import processing.pdf.*;

int side = 20;

void setup(){
// size(800,400); 
 size(400,600,PDF,"octalTable.pdf"); 
 noFill();
 textSize(30);
}

void draw(){
  background(255);
  for(int yindex = 0;yindex  < 8;yindex++){
     for(int xindex = 0;xindex < 8;xindex++){
         rect(side + xindex*side,2*side + yindex*side,side,side);
         fill(0);
         textSize(6);
         String localString = "00";
         localString += char(yindex + 060);
         localString += char(xindex + 060);
         text(localString,side + (xindex + 0.1)*side,2*side + (yindex+0.3)*side);
         text(xindex + 8*yindex,side + (xindex + 0.1)*side,2*side + (yindex+0.7)*side);
         noFill(); 
    }
  }
  for(int yindex = 0;yindex  < 8;yindex++){
     for(int xindex = 0;xindex < 8;xindex++){
         rect(side + 9*side + xindex*side,2*side + yindex*side,side,side);
         fill(0);
         textSize(6);
         String localString = "01";
         localString += char(yindex + 060);
         localString += char(xindex + 060);
         text(localString,side + 9*side + (xindex + 0.1)*side,2*side + (yindex+0.3)*side);
         text(64+xindex + 9*yindex,side + 9*side + (xindex + 0.1)*side,2*side + (yindex+0.7)*side);
         noFill(); 
    }
  }
  for(int yindex = 0;yindex  < 8;yindex++){
     for(int xindex = 0;xindex < 8;xindex++){
         rect(side + xindex*side,2*side + 9*side + yindex*side,side,side);
         fill(0);
         textSize(6);
         String localString = "02";
         localString += char(yindex + 060);
         localString += char(xindex + 060);
         text(localString,side + (xindex + 0.1)*side,2*side + 9*side + (yindex+0.3)*side);
         text(128 + xindex + 8*yindex,side + (xindex + 0.1)*side,2*side + 9*side + (yindex+0.7)*side);
         noFill(); 
    }
  }
  for(int yindex = 0;yindex  < 8;yindex++){
     for(int xindex = 0;xindex < 8;xindex++){
         rect(side + 9*side + xindex*side,2*side + 9*side + yindex*side,side,side);
         fill(0);
         textSize(6);
         String localString = "03";
         localString += char(yindex + 060);
         localString += char(xindex + 060);
         text(localString,side + 9*side + (xindex + 0.1)*side,2*side + 9*side + (yindex+0.3)*side);
         text(192+xindex + 9*yindex,side + 9*side + (xindex + 0.1)*side,2*side + 9*side + (yindex+0.7)*side);
         noFill(); 
    }
  }
  for(int yindex = 0;yindex  < 8;yindex++){
     for(int xindex = 0;xindex < 8;xindex++){
         rect(side + xindex*side,2*side + 18*side + yindex*side,side,side);
         fill(0);
         textSize(6);
         String localString = "04";
         localString += char(yindex + 060);
         localString += char(xindex + 060);
         text(localString,side + (xindex + 0.1)*side,2*side + 18*side + (yindex+0.3)*side);
         text(256 + xindex + 8*yindex,side + (xindex + 0.1)*side,2*side + 18*side + (yindex+0.7)*side);
         noFill(); 
    }
  }
  for(int yindex = 0;yindex  < 8;yindex++){
     for(int xindex = 0;xindex < 8;xindex++){
         rect(side + 9*side + xindex*side,2*side + 18*side + yindex*side,side,side);
         fill(0);
         textSize(6);
         String localString = "05";
         localString += char(yindex + 060);
         localString += char(xindex + 060);
         text(localString,side + 9*side + (xindex + 0.1)*side,2*side + 18*side + (yindex+0.3)*side);
         text(320 + xindex + 9*yindex,side + 9*side + (xindex + 0.1)*side,2*side + 18*side + (yindex+0.7)*side);
         noFill(); 
    }
  }
   

  exit();
}