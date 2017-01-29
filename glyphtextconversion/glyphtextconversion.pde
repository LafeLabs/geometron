

String font[] = loadStrings("font.txt");
String commandSymbolGlyphTable[] = loadStrings("commandSymbolGlyphTable.txt");
String shapeActions[] = loadStrings("shapeActions.txt");
String manuscriptActions[] = loadStrings("manuscriptActions.txt");

String stringArray[] = {};
String stringArray2[] = {};
String stringArray3[] = {};
String stringArray4[] = {};


for(int index = 0;index < font.length;index++){
  stringArray = append(stringArray,"    font.push(\""+ font[index] + "\");"); 
}

for(int index = 0;index < commandSymbolGlyphTable.length;index++){
  stringArray2 = append(stringArray2,"    commandSymbolGlyphTable.push(\""+ commandSymbolGlyphTable[index] + "\");"); 
}

for(int index = 0;index < shapeActions.length;index++){
  stringArray3 = append(stringArray3,"    shapeActions.push(\""+ shapeActions[index] + "\");"); 
}

for(int index = 0;index < manuscriptActions.length;index++){
  stringArray4 = append(stringArray4,"    manuscriptActions.push(\""+ manuscriptActions[index] + "\");"); 
}

saveStrings("manuscriptactionsjs.txt",stringArray4);