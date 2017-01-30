
String[] font;
String[] commandSymbols;
String[] shapeActions;
String[] shapeSymbols;
String[] manuscriptActions;
String[] manuscriptSymbols;
String[] imageLocations;

String[] jsfileoutput = {};

void setup(){
 font = loadStrings("font.txt");
 commandSymbols = loadStrings("commandSymbols.txt");
 shapeActions = loadStrings("shapeActions.txt");
 shapeSymbols = loadStrings("shapeSymbols.txt");

//symbols have 01000 added to them relative to the action they represent
//so I'm moving the 03xx commands up to 013xx and 03xx will mean natve code without ambiguity and everything can live in one table, which is one big string array made with a long series of push commsnds in js, and made from multiple txt commands in processing genesis function
 for(int index = 0;index < commandSymbols.length;index++){
    commandSymbols[index] = "01" + commandSymbols[index].substring(1,commandSymbols[index].length());  
 }
// for(int index = 0;index < shapeSymbols.length;index++){
  //  shapeSymbols[index] = "01" + shapeSymbols[index].substring(1,shapeSymbols[index].length());  
// }
 
 jsfileoutput = append(jsfileoutput,"   currentTable = [];");

  for(int index = 0;index < font.length;index++){
    String localString = "    currentTable.push(\"";  
    localString += font[index];
    localString += "\");";
    jsfileoutput = append(jsfileoutput,localString);
  }
  for(int index = 0;index < commandSymbols.length;index++){
    String localString = "    currentTable.push(\"";  
    localString += commandSymbols[index];
    localString += "\");";
    jsfileoutput = append(jsfileoutput,localString);
  }
  for(int index = 0;index < shapeSymbols.length;index++){
    String localString = "    currentTable.push(\"";  
    localString += shapeSymbols[index];
    localString += "\");";
    jsfileoutput = append(jsfileoutput,localString);
  }
  for(int index = 0;index < shapeActions.length;index++){
    String localString = "    currentTable.push(\"";  
    localString += shapeActions[index];
    localString += "\");";
    jsfileoutput = append(jsfileoutput,localString);
  }
 
   saveStrings("tableinput.js",jsfileoutput);
// saveStrings("commandSymbolsUP.txt",commandSymbols);
// manuscriptActions = loadStrings("manuscriptActions.txt");
// manuscriptSymbols = loadStrings("manuscriptSymbols.txt");

 exit(); 
}