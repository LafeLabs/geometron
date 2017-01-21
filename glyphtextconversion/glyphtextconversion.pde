

String font[] = loadStrings("font.txt");
String commandSymbolGlyphTable[] = loadStrings("commandSymbolGlyphTable.txt");
String shapeActions[] = loadStrings("shapeActions.txt");

String stringArray[] = {};
String stringArray2[] = {};
String stringArray3[] = {};

for(int index = 0;index < font.length;index++){
  stringArray = append(stringArray,"    font.push(\""+ font[index] + "\");"); 
}

for(int index = 0;index < commandSymbolGlyphTable.length;index++){
  stringArray2 = append(stringArray2,"    commandSymbolGlyphTable.push(\""+ commandSymbolGlyphTable[index] + "\");"); 
}

for(int index = 0;index < shapeActions.length;index++){
  stringArray3 = append(stringArray3,"    shapeActions.push(\""+ shapeActions[index] + "\");"); 
}

saveStrings("shapeactionsjs.txt",stringArray3);