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
int currentGlyphIndex = 0;
int currentTableIndex = 0;
String[] currentGlyphTable = {};
int currentGlyphAddress = 0;

String currentGlyphString = "";

String[] commandSymbolGlyphTable = {};
String[] font = {};
String[] shapeActions = {};
String[] shapeGlyphs = {};

char[] keyRow0 = {'0','-','='};
int[] keyAddressRow0 = {0300,0336,0337};
char[] keyRow1 = {'q','r',']','[','p'};
int[] keyAddressRow1 = {0310,0313,0010,0011,0014};
char[] keyRow2 = {'a','s','d','f','g','h','j','k','l',';'};
int[] keyAddressRow2 = {0330,0331,0332,0333,0334,0335,0350,0351,0352,0353};
char[] keyRow3 = {'z','x','c','v'};
int[] keyAddressRow3 = {0340,0341,0342,0343};
char[] keyRow4 = {'!','@','#'};
int[] keyAddressRow4 = {0200,0201,0202};

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
  commandSymbolGlyphTable = loadStrings("commandSymbolGlyphTable.txt");
  font = loadStrings("font.txt");
  doTheThing(0);
}

void draw(){
 background(255);
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

void doString(String localString){
  for(int index = 0;index < localString.length();index++){
    doTheThing(key2command(localString.charAt(index)));
  }
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
  int currentCommand = key2command(key);
  if(currentCommand != -1 && currentCommand >= 0040){
     currentGlyph = append(currentGlyph,currentCommand); 
       currentGlyphString += key; 
  }
  if(currentCommand < 0040){
     doTheThing(currentCommand); 
  }
    
  if(key == 8){ //delete key
    if(currentGlyph.length != 0){
      currentGlyph = shorten(currentGlyph);
      currentGlyphString = currentGlyphString.substring(0,currentGlyphString.length() - 1);
    }
  }
  //println(currentGlyphString);
  println(currentGlyphTable[currentTableIndex]);
  
}

void drawGlyph(int[] localGlyph){
  for(int index = 0;index < localGlyph.length;index++){
    doTheThing(localGlyph[index]);  
  }  
}

void doTheThing(int localCommand){

  
  /*
move to different glyph table: 

commandSymbolGlyph,font,shapeActionGlyph,shapeSymbolGlyph,manuscriptSymbolGlyph,manuscriptActionGlyph
0000,0001,0002,0003,0004,0005


move cursor forward in current glyph
move cursor backward in current glyph
move to next glyph
move to previous glyph
0010,0011,0012,0013

0014: archive glyphtable 

save and load glyph to from text file
add glyph in table in front of cursor
edit glyph address
delete glyph inside current glyph
delete current glyph
*/
    if(localCommand == 0000){//edit current glyph table
        currentGlyphTable = loadStrings("currentGlyphTable.txt");
        currentTableIndex = 0;
        String[] localStringArray = split(currentGlyphTable[currentTableIndex],':');
        String localString = localStringArray[1];  
        currentGlyphAddress = (int(localStringArray[0].charAt(1))- 060)*64 + (int(localStringArray[0].charAt(2))  - 060)*8 + int(localStringArray[0].charAt(3)) - 060;        
        for(int index = currentGlyph.length - 1;index >= 0;index--){
            currentGlyph = shorten(currentGlyph);
        }
        currentGlyphString = "";
        for(int index = 0;index < localString.length();index++){
          currentGlyph = append(currentGlyph,key2command(localString.charAt(index)));
          currentGlyphString += localString.charAt(index);
        }   
    }

    if(localCommand == 0010){//cursor forward through current glyph
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
        for(int index = currentGlyph.length - 1;index >= 0;index--){
            currentGlyph = shorten(currentGlyph);
        }
        currentGlyphString = "";
        for(int index = 0;index < localString.length();index++){
          currentGlyph = append(currentGlyph,key2command(localString.charAt(index)));
          currentGlyphString += localString.charAt(index);
        }         
    }
    if(localCommand == 0011){//cursor back through current glyph 
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
        for(int index = currentGlyph.length - 1;index >= 0;index--){
            currentGlyph = shorten(currentGlyph);
        }
        currentGlyphString = "";
        for(int index = 0;index < localString.length();index++){
          currentGlyph = append(currentGlyph,key2command(localString.charAt(index)));
          currentGlyphString += localString.charAt(index);
        }         
      
    }
    if(localCommand == 0012){//move to next glyph in table, cursor to end
      
    }
    if(localCommand == 0013){//move to previous glyph in table, cursor to end
      
    }
    if(localCommand == 0014){//archive current glyph table
      saveStrings("currentGlyphTable.txt",currentGlyphTable);
    }

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