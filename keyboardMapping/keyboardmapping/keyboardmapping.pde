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

String currentGlyphString = "";
String rightArrow = "f!--ddda-a=chcdcagcsscjhqcacaggcacahkr-ffffsssssss-a====";

String[] commandGlyphs = {"0330:f!--ddda-a=chcdcagcsscjhqcacaggcacahkr-ffffsssssss-a===="};
String[] font = {"a:f--dadxfcadvfsscf==","b:f--dadd==c--faxffss=="};
String[] shapeActions = {};
String[] shapeGlyphs = {};

char[] keyRow0 = {'0','-','='};
int[] keyAddressRow0 = {0300,0336,0337};
char[] keyRow1 = {'q','r'};
int[] keyAddressRow1 = {0310,0313};
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
}

void draw(){
 background(255);
// image(loadImage("root2fullkey.png"),0,0,500,170);
 doTheThing(0300);
 drawGlyph(currentGlyph);
 drawCursor();
// doString(rightArrow);

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

void rootMagic(int localCommand){
  //edit letter, save, next letter, previous letter, switch keyboard mode, delete, move through glyph,
  //push and pop state stack, push and pop glyph stack, push and pop image stack
  
  if(localCommand == 0000){
    
    
  }
  
}

void keyPressed(){
  if(int(key) > 0040 && int(key) < 0177){
     currentGlyphString += key; 
  }
  int currentCommand = key2command(key);
  if(currentCommand != -1){
     currentGlyph = append(currentGlyph,currentCommand); 
  }
  if(key == 8){ //delete key
    if(currentGlyph.length != 0){
      currentGlyph = shorten(currentGlyph);
      currentGlyphString = currentGlyphString.substring(0,currentGlyphString.length() - 1);
    }
  }
  println(currentGlyphString);
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