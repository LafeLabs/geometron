

float roctalSide = 63;

float x,y;
PImage baseImage;
PImage bitImage;

color oneColor;
color zeroColor;

void setup(){
  noFill();
  size(1081,595);
  baseImage = loadImage("laminatedcode.png");
}
void draw(){
  image(baseImage,0,0);
  rect(mouseX - roctalSide,mouseY,roctalSide,roctalSide);
  rect(mouseX - roctalSide,mouseY - roctalSide,roctalSide,roctalSide);
  rect(mouseX,mouseY,8*roctalSide,4*roctalSide);
  calibrate(); 
  String localString = "";
  for(int yIndex = 0;yIndex < 4;yIndex++){
     for(int xIndex = 0;xIndex < 8;xIndex++){
       x = mouseX + xIndex*int(roctalSide) + int(roctalSide/4);
       y = mouseY + int(roctalSide/4) + yIndex*int(roctalSide) ; 
       int localInt = readRoctal();
       if(localInt >= 040 && localInt <=0177){
         localString += char(localInt);
       }
     }
  }
 println(localString);
}

void keyPressed(){
 if(key == '-'){
    roctalSide /= 1.01; 
    println(roctalSide);
 }
 if(key == '='){
    roctalSide *= 1.01;
    println(roctalSide);
 }
}

void mouseClicked(){
 calibrate(); 
 String localString = "";
  for(int yIndex = 0;yIndex < 4;yIndex++){
     for(int xIndex = 0;xIndex < 8;xIndex++){
       x = mouseX + xIndex*int(roctalSide) + int(roctalSide/4);
       y = mouseY + int(roctalSide/4) + yIndex*int(roctalSide) ; 
       int localInt = readRoctal();
       if(localInt >= 040 && localInt <=0177){
         localString += char(localInt);
       }
     }
  }
 println(localString);
 String[] localStringArray = {localString};
 saveStrings("currentlink.txt",localStringArray);

}


int readRoctal(){
  int returnByte = 0;
  for(int bitIndex = 0;bitIndex < 9;bitIndex++){
      int currentBit = 0;
      bitImage = get(int(x + (bitIndex%3)*roctalSide/4),int(y + (bitIndex/3)*roctalSide/4),int(roctalSide/4),int(roctalSide/4));
      bitImage.loadPixels();
    
      int localRed = 0;
      int localGreen = 0;
      int localBlue = 0;
      for(int index = 0;index < bitImage.pixels.length;index++){
        localRed += red(bitImage.pixels[index]);
        localGreen += green(bitImage.pixels[index]);
        localBlue += blue(bitImage.pixels[index]);
      }
      localRed /= bitImage.pixels.length;
      localGreen /= bitImage.pixels.length;
      localBlue /= bitImage.pixels.length;
      int oneness = (int(localRed) - int(red(oneColor)))*(int(localRed) - int(red(oneColor)));
      oneness += (int(localGreen) - int(green(oneColor)))*(int(localGreen) - int(green(oneColor)));
      oneness += (int(localBlue) - int(blue(oneColor)))*(int(localBlue) - int(blue(oneColor)));
      
      int zeroness = (int(localRed) - int(red(zeroColor)))*(int(localRed) - int(red(zeroColor)));
      zeroness += (int(localGreen) - int(green(zeroColor)))*(int(localGreen) - int(green(zeroColor)));
      zeroness += (int(localBlue) - int(blue(zeroColor)))*(int(localBlue) - int(blue(zeroColor)));
    
      if(zeroness >= oneness){
        currentBit = 1;
      }
      else{
        currentBit = 0;
      }
      returnByte += currentBit << (8 - bitIndex);
  }
  return returnByte;
}

void calibrate(){
  bitImage = get(mouseX - int(roctalSide),mouseY - int(roctalSide),int(roctalSide),int(roctalSide));
  bitImage.loadPixels();
  int localRed = 0;
  int localGreen = 0;
  int localBlue = 0;
  for(int index = 0;index < bitImage.pixels.length;index++){
    localRed += red(bitImage.pixels[index]);
    localGreen += green(bitImage.pixels[index]);
    localBlue += blue(bitImage.pixels[index]);
  }
  localRed /= bitImage.pixels.length;
  localGreen /= bitImage.pixels.length;
  localBlue /= bitImage.pixels.length;
  zeroColor = color(localRed,localGreen,localBlue);
  bitImage = get(mouseX - int(roctalSide),mouseY,int(roctalSide),int(roctalSide));
  bitImage.loadPixels();
  localRed = 0;
  localGreen = 0;
  localBlue = 0;
  for(int index = 0;index < bitImage.pixels.length;index++){
    localRed += red(bitImage.pixels[index]);
    localGreen += green(bitImage.pixels[index]);
    localBlue += blue(bitImage.pixels[index]);
  }
  localRed /= bitImage.pixels.length;
  localGreen /= bitImage.pixels.length;
  localBlue /= bitImage.pixels.length;
  oneColor = color(localRed,localGreen,localBlue);
  
}