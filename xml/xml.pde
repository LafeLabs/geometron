// convert xml files to javascript file

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


XML fontXML;
XML commandSymbolsXML;
String[] javaScriptFile = {};

void setup() {

  fontXML = loadXML("font.xml");  
  XML[] letters = fontXML.getChildren("letter");
  javaScriptFile = append(javaScriptFile,"function loadFont(){");     
  javaScriptFile = append(javaScriptFile,"  font = [];");   
  for(int index = 0;index < letters.length;index++){
       String localString = "    font.push(\"";  
       localString += trim(letters[index].getChild("address").getContent());
       localString += ":";
       localString += trim(letters[index].getChild("action").getChild("code").getContent());
       localString += "\");";
       javaScriptFile = append(javaScriptFile,localString);       
       //print(trim(letters[index].getChild("address").getContent())); 
       //print(":");
       //println(trim(letters[index].getChild("action").getContent()));  
  }
  javaScriptFile = append(javaScriptFile,"}");     
  
  commandSymbolsXML = loadXML("commandSymbols.xml");
  XML[] commandSymbols = commandSymbolsXML.getChildren("symbol");
  javaScriptFile = append(javaScriptFile,"function loadCommandSymbols(){");     
  javaScriptFile = append(javaScriptFile,"  commandSymbols = [];");   
  for(int index = 0;index < commandSymbols.length;index++){
       String localString = "    commandSymbols.push(\"";  
       localString += trim(commandSymbols[index].getChild("address").getContent());
       localString += ":";
       localString += trim(commandSymbols[index].getChild("action").getContent());
       localString += "\");";
       javaScriptFile = append(javaScriptFile,localString);       
  }
  javaScriptFile = append(javaScriptFile,"}");     
  println(string2octal("f!r--ad-d=cgcahcag-cahjh=q=cahhcahhh-r-cakhssssfff==="));
  saveStrings("loadTables.js",javaScriptFile);
  exit();
}

String string2octal(String inputString){
  String localString = "";
  for(int index = 0;index < inputString.length();index++){
      char localChar = inputString.charAt(index);
      int localCommand = key2command(localChar);
      localString += "0";
      localString += str((localCommand>>6) & 7);      
      localString += str((localCommand>>3) & 7);      
      localString += str((localCommand) & 7);      
      if(index != inputString.length() - 1){
         localString += ","; 
      }
  }
  return localString;
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