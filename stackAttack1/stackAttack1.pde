//EVERYTHING IS PHYSICAL
//EVERYTHING IS ALWAYS RECURSIVE
//NO LAWS NO PROPERTY NO MINING NO NUMBERS
//THE SOLE PURPOSE OF THE EXISTING SOFTWARE INDUSTRY IS TO CREATE AND MAINTAIN STRUCTURAL VIOLENCE
//ALL COMPUTER "SCIENCE" IS AN EVIL RELIGION
//ALL "TECH" COMPANIES ARE BASED ON FRAUD AND LIES
//SMASH THE TECHNOCRATIC PRIESTHOOD

import processing.pdf.*;

boolean ASCIImode = false;
boolean backgroundOn = true;
boolean glyphSpellingOn = false;
float x,y,x0,y0;
float spellX,spellY;
float spellSide;
float side;
float scaleFactor, unit;
float theta,theta0,thetaStep;
int currentGlyphIndex = 0;
int currentTableIndex = 0;
String[] currentGlyphTable = {};
int currentGlyphAddress = 0;

int tableMode = 4;  
//1: font
//2: shape symbols
//16(0020): shape actions
//3: command symbols
//4: manuscript actions 
//5: manuscript symbols

float phi = 0.5*(sqrt(5) + 1);

String currentGlyphString = "";

String[] font = {}; //mode 1
String[] shapeSymbols = {}; //mode 2
String[] shapeActions = {}; //mode 16
String[] commandSymbolGlyphTable = {}; //mode 3
String[] manuscriptActions = {}; //mode 4
String[] manuscriptSymbols = {}; //mode 5

String[] backgroundFileTable = {};
int backgroundIndex = 0;

//"~" is 0176 in octal and switches between ASCIImode true and false, should not go here
char[] keyRow0 = {'1','2','3','0','-','='};
int[] keyAddressRow0 = {0304,0305,0306,0300,0336,0337};
char[] keyRow1 = {'q','w','e','r','t','u','i','o','p'};
int[] keyAddressRow1 = {0310,0311,0312,0313,0314,0370,0371,0360,0361};
char[] keyRow2 = {'a','s','d','f','g','h','j','k','l',';'};
int[] keyAddressRow2 = {0330,0331,0332,0333,0334,0335,0350,0351,0352,0353};
char[] keyRow3 = {'z','x','c','v','/'};
int[] keyAddressRow3 = {0340,0341,0342,0343,0020};
char[] keyRow4 = {'!','@','#','$','%','^','&'};
int[] keyAddressRow4 = {0200,0201,0202,0203,0204,0205,0206};

int[] testGlyph = {0336,0332,0332,0330,0330,0337,0337,0340,0341,0342,0336,0336,0330,0330,0162,0333,0333,0333,0143}; 
String testGlyphString = "-ddaa==zxc--aa~r~fff~cmn";

PImage baseImage;//always the background, gets cycled thru image table, always 
                  //use resize method of PImage to fit to width, height of window
PImage myImage;

int imageStackIndex = 0;
float[] xStack = {};
float[] yStack = {};


void setup(){
  ellipseMode(CENTER);
  noFill();
  strokeWeight(1);
  unit = 75;
  scaleFactor = 2;
  side = 50;
  thetaStep = PI/2;
  theta0 = -PI/2; 
  theta = theta0;
  size(500,500);
 // size(500, 500, PDF, "filename.pdf");
  x0 = 250;
  y0 = 250;
  x = x0;
  y = y0;
  spellX = 10;
  spellY = height - 100;
  spellSide = 20;

  commandSymbolGlyphTable = loadStrings("geometronfiles/text/commandSymbolGlyphTable.txt");
  font = loadStrings("geometronfiles/text/font.txt");
  shapeActions = loadStrings("geometronfiles/text/shapeActions.txt");
  shapeSymbols = loadStrings("geometronfiles/text/shapeSymbols.txt");
  manuscriptActions = loadStrings("geometronfiles/text/manuscriptActions.txt"); //mode 4
  manuscriptSymbols = loadStrings("geometronfiles/text/manuscriptSymbols.txt"); //mode 5
 
  backgroundFileTable = loadStrings("geometronfiles/text/backgroundTable.txt");
  
  String currentBackground = backgroundFileTable[backgroundIndex];
  String[] tempStringArray = split(currentBackground,':');
  String fileName = "geometronfiles/images/" + tempStringArray[1];
  rootMagic(4);//Root Magic: invoke Manuscript Action Table
  baseImage = loadImage(fileName);
  baseImage.resize(width,height);
}

void draw(){
 background(255);
 if(backgroundOn){
   image(baseImage,0,0);
 }
 doTheThing(0300);
 drawGlyph(string2glyph(currentGlyphString));
 if(currentGlyphIndex == 0){
   drawCursor();
 }
 if(glyphSpellingOn){
    doTheThing(0300);
    spellGlyph(string2glyph(currentGlyphString));
 }
 /*
  PGraphicsPDF pdf = (PGraphicsPDF) g;  // Get the renderer
  //When finished drawing, quit and save the file
  if (frameCount == 11) {
    exit();
  } else {
    pdf.nextPage();  // Tell it to go to the next page 
  }
  doTheThing(0015);
*/


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

void doString(String localString){
  for(int index = 0;index < localString.length();index++){
    doTheThing(key2command(localString.charAt(index)));
  }
}

int[] string2glyph(String localString){
  int[] localGlyph = {};
  boolean localASCII = false;
  for(int index = 0;index < localString.length();index++){
    if(localString.charAt(index) != '~'){  //anything BUT ~
      if(!localASCII){ //command mode
          localGlyph = append(localGlyph,key2command(localString.charAt(index)));
      }
      else{    //literal ascii mode
          localGlyph = append(localGlyph,int(localString.charAt(index)));
      }
    }
    else{   //if tilde switch local key mode to other mode, whatever that is
       localASCII = !localASCII; 
    }
  }
  return localGlyph;
}

void grabImage(){
  myImage = get(int(x),int(y),int(side),int(side));
}
void dropImage(){
  image(myImage,x,y,int(side),int(side));
}


int key2command(char localChar){
    int localInt = -1;
    
    for(int index = 0;index < keyRow0.length; index++){
     if(localChar == keyRow0[index]){
         localInt = keyAddressRow0[index];
     }
  }
  for(int index = 0;index < keyRow1.length; index++){
     if(localChar == keyRow1[index]){
         localInt = keyAddressRow1[index];
     }
  }
  for(int index = 0;index < keyRow2.length; index++){
     if(localChar == keyRow2[index]){
         localInt = keyAddressRow2[index];
     }
  }
  for(int index = 0;index < keyRow3.length; index++){
     if(localChar == keyRow3[index]){
         localInt = keyAddressRow3[index];
     }
  }
  for(int index = 0;index < keyRow4.length; index++){
     if(localChar == keyRow4[index]){
         localInt = keyAddressRow4[index];
     }
  }
  return localInt;
}

void keyPressed(){
  if(key == '~'){
    ASCIImode = !ASCIImode;
  }
  
  if(key == 8){ //delete key
    if(currentGlyphString.length() != 0){
      if(currentGlyphIndex == 0){
        currentGlyphString = currentGlyphString.substring(0,currentGlyphString.length() - 1);
      }
      else{
         String tempString = "";
         for(int index = 0;index < currentGlyphString.length();index++){
           if(index != currentGlyphIndex){
             tempString += currentGlyphString.charAt(index);
           }
         }
         currentGlyphString = tempString;
      }
    }
  }
  else{ //anything but DEL goes here:
//     int currentCommand = key2command(key);
     if(int(key) < 0040 && int(key) > 0){
        rootMagic(int(key)); 
     }
     else{
        if(key >= ' ' && key <= '~'){
          currentGlyphString += key;
        }
     }
  }

  println(currentGlyphString);

      String localOctalAddress = "0";
      localOctalAddress += str(currentGlyphAddress >> 6);
      localOctalAddress += str((currentGlyphAddress >> 3)&7);
      localOctalAddress += str((currentGlyphAddress)&7);
      currentGlyphTable[currentTableIndex] = localOctalAddress + ":" + currentGlyphString;
}

void drawGlyph(int[] localGlyph){
  for(int index = 0;index < localGlyph.length;index++){
    doTheThing(localGlyph[index]);  
    if(currentGlyphIndex == index && currentGlyphIndex !=0){
       drawCursor();
    }
  }  
}

void spellGlyph(int[] localGlyph){
  x = spellX;
  y = spellY;
  float tempInt = side;
  side = spellSide;
  for(int index = 0;index < localGlyph.length;index++){
     for(int searchIndex = 0;searchIndex <  commandSymbolGlyphTable.length; searchIndex++){
        String[] localStringArray = split(commandSymbolGlyphTable[searchIndex],':');
        String localString = localStringArray[1];  
        int tempAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        if(tempAddress == localGlyph[index]){
           doString(localString); 
        } 
     }
       textSize(12);
  fill(0);
  text(currentGlyphString.charAt(index),x - 0.7*spellSide,y + 0.6*spellSide);
  noFill();

    if(x > width - 20){
      x = spellX;
      y += 2*spellSide;
    }
  }
  side = tempInt;
}

void rootMagic(int localCommand){
 if(localCommand == 1){
        currentTableIndex = 0;
        String[] localStringArray = split(shapeActions[currentTableIndex],':');
        String localString = localStringArray[1];  
        currentGlyphAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        currentGlyphString = "";
       for(int index = 0;index < localString.length();index++){
          currentGlyphString += localString.charAt(index);
        }  
        tableMode = 0020;
        currentGlyphTable = shapeActions;
 }
 if(localCommand == 2){
        currentTableIndex = 0;
        String[] localStringArray = split(shapeSymbols[currentTableIndex],':');
        String localString = localStringArray[1];  
        currentGlyphAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        currentGlyphString = "";
       for(int index = 0;index < localString.length();index++){
          currentGlyphString += localString.charAt(index);
        }  
        tableMode = 0002;
        currentGlyphTable = shapeSymbols;
 }
 if(localCommand == 3){//control-c command glyph symbols
         currentTableIndex = 0;
        String[] localStringArray = split(commandSymbolGlyphTable[currentTableIndex],':');
        String localString = localStringArray[1];  
        currentGlyphAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        currentGlyphString = "";
       for(int index = 0;index < localString.length();index++){
          currentGlyphString += localString.charAt(index);
        }  
        tableMode = 0003;
        currentGlyphTable = commandSymbolGlyphTable;
 }
 if(localCommand == 4){//control-d
        currentTableIndex = 0;
        String[] localStringArray = split(manuscriptActions[currentTableIndex],':');
        String localString = localStringArray[1];  
        currentGlyphAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        currentGlyphString = "";
       for(int index = 0;index < localString.length();index++){
          currentGlyphString += localString.charAt(index);
        }  
        tableMode = 0004;
        currentGlyphTable = manuscriptActions; 
 }
 if(localCommand == 5){//control-e
        currentTableIndex = 0;
        String[] localStringArray = split(manuscriptSymbols[currentTableIndex],':');
        String localString = localStringArray[1];  
        currentGlyphAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        currentGlyphString = "";
       for(int index = 0;index < localString.length();index++){
          currentGlyphString += localString.charAt(index);
        }  
        tableMode = 0005;
        currentGlyphTable = manuscriptSymbols;
 }
 if(localCommand == 6){//control-f =  font!
        currentTableIndex = 0;
        String[] localStringArray = split(font[currentTableIndex],':');
        String localString = localStringArray[1];  
        currentGlyphAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        currentGlyphString = "";
       for(int index = 0;index < localString.length();index++){
          currentGlyphString += localString.charAt(index);
        }  
        tableMode = 0001;
        currentGlyphTable = font;  
 }
 if(localCommand == 7){//control-g, toggle spelling on/off
     glyphSpellingOn = !glyphSpellingOn;
 }
    if(localCommand == 0023){ //control-s
    if(tableMode == 1){
       saveStrings("geometronfiles/text/font.txt",currentGlyphTable); 
    }
    if(tableMode == 2){
       saveStrings("geometronfiles/text/shapeSymbols.txt",currentGlyphTable); 
    }
    if(tableMode == 0020){
       saveStrings("geometronfiles/text/shapeActions.txt",currentGlyphTable);         
    }
    if(tableMode == 3){
       saveStrings("geometronfiles/text/commandSymbolGlyphTable.txt",currentGlyphTable); 
    }
    if(tableMode == 4){
       saveStrings("geometronfiles/text/manuscriptActions.txt",currentGlyphTable); 
 //   saveStrings("manuscriptActions2.txt",currentGlyphTable); 
    }
    if(tableMode == 5){
       saveStrings("geometronfiles/text/manuscriptSymbols.txt",currentGlyphTable); 
    }
    }
  
  if(localCommand == 0011){//9 decimal, control-I, move to previous glyph in table
     print(currentTableIndex);
     print(" --> ");
      String localOctalAddress = "0";
      localOctalAddress += str(currentGlyphAddress >> 6);
      localOctalAddress += str((currentGlyphAddress >> 3)&7);
      localOctalAddress += str((currentGlyphAddress)&7);
      currentGlyphTable[currentTableIndex] = localOctalAddress + ":" + currentGlyphString;
      currentTableIndex--;
      if(currentTableIndex < 0){
        currentTableIndex = currentGlyphTable.length - 1;
      }
        String[] localStringArray = split(currentGlyphTable[currentTableIndex],':');
        String localString = localStringArray[1];  
        currentGlyphAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        currentGlyphString = "";
        for(int index = 0;index < localString.length();index++){
          currentGlyphString += localString.charAt(index);
        }
             println(currentTableIndex);

  }
  if(localCommand == 0015){//13 decimal, control-M move to next glyph in table
      String localOctalAddress = "0";
      localOctalAddress += str(currentGlyphAddress >> 6);
      localOctalAddress += str((currentGlyphAddress >> 3)&7);
      localOctalAddress += str((currentGlyphAddress)&7);
      currentGlyphTable[currentTableIndex] = localOctalAddress + ":" + currentGlyphString;
      currentTableIndex++;
      if(currentTableIndex == currentGlyphTable.length){
        currentTableIndex = 0;
      }
      String[] localStringArray = split(currentGlyphTable[currentTableIndex],':');
      String localString = localStringArray[1];  
      currentGlyphAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
      currentGlyphString = "";
      for(int index = 0;index < localString.length();index++){
          currentGlyphString += localString.charAt(index);
      }         
  }
  if(localCommand == 012){//control-j back arrow in a glyph
       
  }
  if(localCommand == 013){//control-k forward arrow in a glyph
       
  }
  
  if(localCommand == 025){//024 = 20 = control-t: move to next background image file
   backgroundIndex++; 
   if(backgroundIndex >= backgroundFileTable.length){
     backgroundIndex = 0;
   }
  String currentBackground = backgroundFileTable[backgroundIndex];
  String[] tempStringArray = split(currentBackground,':');
  String fileName = "geometronfiles/images/" + tempStringArray[1];
  rootMagic(4);//Root Magic: invoke Manuscript Action Table
  baseImage = loadImage(fileName);
  baseImage.resize(width,height);  
  }
  if(localCommand == 024){//025 = 21 = control-U move to previous background image file
   backgroundIndex--; 
   if(backgroundIndex < 0){
     backgroundIndex = backgroundFileTable.length - 1;
   }
  String currentBackground = backgroundFileTable[backgroundIndex];
  String[] tempStringArray = split(currentBackground,':');
  String fileName = "geometronfiles/images/" + tempStringArray[1];
  rootMagic(4);//Root Magic: invoke Manuscript Action Table
  baseImage = loadImage(fileName);
  baseImage.resize(width,height);  
  }
  if(localCommand == 031){ ////031 = 25 = control-y:toggle background image on/off
    backgroundOn = !backgroundOn;
  }
}

void doTheThing(int localCommand){
    if(localCommand >= 0040 && localCommand < 0176){  //printable ASCII from space to before ~
      for(int searchIndex = 0;searchIndex <  font.length; searchIndex++){
        String[] localStringArray = split(font[searchIndex],':');
        String localString = localStringArray[1];  
        int tempAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        if(tempAddress == localCommand){
           doString(localString);
        }
     }
    }

    if(localCommand >= 0200 && localCommand < 0277){//shapes
      for(int searchIndex = 0;searchIndex <  shapeActions.length; searchIndex++){
        String[] localStringArray = split(shapeActions[searchIndex],':');
        String localString = localStringArray[1];  
        int tempAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        if(tempAddress == localCommand){
           doString(localString);
        }
     }
    }
    //geometric native action commands
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
    if(localCommand == 00360){
      grabImage(); 
    }
    if(localCommand == 00361){
       dropImage(); 
    }
    if(localCommand == 0370){ //push position
        xStack = append(xStack,x);
        yStack = append(yStack,y);
    }
    if(localCommand == 0371){//pop position
      if(xStack.length != 0){
        x = xStack[xStack.length - 1];        
        y = yStack[yStack.length - 1];        
        xStack = shorten(xStack);
        yStack = shorten(yStack);
      }
      else{
        xStack = append(xStack,x); 
        yStack = append(yStack,y); 
      }
    }
    if(localCommand == 0372){//flip position stack upsidedown
      float[] tempArrayX = {};
      float[] tempArrayY = {};
      for(int index = tempArrayX.length - 1;index>=0;index--){
        tempArrayX = append(tempArrayX,xStack[index]); 
        tempArrayY = append(tempArrayY,yStack[index]); 
      }
      xStack = tempArrayX;
      yStack = tempArrayY;
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