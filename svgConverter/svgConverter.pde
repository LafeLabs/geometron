//EVERYTHING IS PHYSICAL
//EVERYTHING IS ALWAYS RECURSIVE
//NO LAWS NO PROPERTY NO MINING NO NUMBERS
//THE SOLE PURPOSE OF THE EXISTING SOFTWARE INDUSTRY IS TO CREATE AND MAINTAIN STRUCTURAL VIOLENCE
//ALL COMPUTER "SCIENCE" IS AN EVIL RELIGION
//ALL "TECH" COMPANIES ARE BASED ON FRAUD AND LIES
//SMASH THE TECHNOCRATIC PRIESTHOOD

boolean backgroundOn = false;
boolean glyphSpellingOn = true;
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
char[] keyRow0 = {'1','2','3','7','0','-','='};
int[] keyAddressRow0 = {0304,0305,0306,0317,0300,0336,0337};
char[] keyRow1 = {'q','w','e','r','t','u','i','o','p'};
int[] keyAddressRow1 = {0310,0311,0312,0313,0314,0370,0371,0360,0361};
char[] keyRow2 = {'a','s','d','f','g','h','j','k','l',';'};
int[] keyAddressRow2 = {0330,0331,0332,0333,0334,0335,0350,0351,0352,0353};
char[] keyRow3 = {'z','x','c','v'};
int[] keyAddressRow3 = {0340,0341,0342,0343};
char[] keyRow4 = {'!','@','#','$','%','^','&','*','Q','W','E','R','T','Y','U','I'};
int[] keyAddressRow4 = {0200,0201,0202,0203,0204,0205,0206,0207,0210,0211,0212,0213,0214,0215,0216,0217};

String[] svgFile = {};

void setup(){

   svgFile = append(svgFile,"<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>");    
   svgFile = append(svgFile,"<svg xmlns=\"http://www.w3.org/2000/svg\" version=\"1.1\"");
   svgFile = append(svgFile,"viewBox=\"0 0 600 600\" width=\"600\" height=\"600\" id=\"starter_svg\">");     
  
    ellipseMode(CENTER);
  noFill();
  strokeWeight(1);
  unit = 100;
  scaleFactor = 2;
  side = unit;
  thetaStep = PI/2;
  theta0 = -PI/2; 
  theta = theta0;
  size(500,500);
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
   
}

void draw(){

//  svgFile = append(svgFile,"  <circle cx=\"300\" cy=\"300\" r=\"40\" stroke=\"black\" stroke-width=\"3\" fill=\"none\" />");     

  doString("03kcagcagcag0-%%%%%");
  svgFile = append(svgFile,"</svg>");     
  saveStrings("mySvg1.svg",svgFile);
  exit();
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

void spellGlyph(){
}
void spellRoctalGlyph(){
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
    if(localCommand == 0317){
       side = unit; 
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
    if(localCommand == 0340){ //draw a "point"      
      String localString = "  <circle cx=\"";
      localString += str(x);
      localString += "\" cy=\"";
      localString += str(y);
      localString += "\" r=\"4\" stroke=\"black\" stroke-width=\"3\" fill=\"black\" />";
      svgFile = append(svgFile,localString);     
    }
    if(localCommand == 0341){//circle
      String localString = "  <circle cx=\"";
      localString += str(x);
      localString += "\" cy=\"";
      localString += str(y);
      localString += "\" r=\"";
      localString += str(side);    
      localString +=  "\" stroke=\"black\" stroke-width=\"3\" fill=\"none\" />";
      svgFile = append(svgFile,localString);         
    }
    if(localCommand == 0342){      
      svgFile = append(svgFile,"  <line x1=\"" +str(x)+"\" y1=\"" +str(y)+"\" x2=\"" +str(x + side*cos(theta))+"\" y2=\"" +str(y + side*sin(theta))+"\" style=\"stroke:black;stroke-width:2\" />");
    }
    if(localCommand == 0343){
      svgFile = append(svgFile,"  <path d=\"M" + str(x + side*cos(theta - thetaStep)) + " " + str(y + side*sin(theta - thetaStep))); 
      svgFile = append(svgFile,"           A" + str(side)+ " " + str(side) + " 0 0 1 " + str(x + side*cos(theta + thetaStep))+" "+ str(y + side*sin(theta + thetaStep)) +"\"");         
      svgFile = append(svgFile,"stroke=\"black\"");
      svgFile = append(svgFile,"stroke-width=\"3\" fill=\"none\" />");
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
        
}