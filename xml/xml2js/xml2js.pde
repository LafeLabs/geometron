
  
  XML fontXML;  
  XML commandSymbolsXML;
  XML shapeActionsXML;
  XML shapeSymbolsXML;

  String[] jsfileoutput = {};

void setup(){
   fontXML = loadXML("fontfromjs.xml");  
   commandSymbolsXML = loadXML("commandSymbolsfromjs.xml");
   shapeActionsXML = loadXML("shapeActionsfromjs.xml");
   shapeSymbolsXML = loadXML("shapeSymbolsfromjs.xml");
   jsfileoutput = xml2js0(fontXML,"font");
   
   
  exit();
}

String[] xml2js0(XML xmlGlyphTable,String tableName){
  String[] jsGlyphTable = {tableName + " = [];"};  
  XML[] glyphs = xmlGlyphTable.getChildren("glyph");
  for(int index = 0;index < glyphs.length;index++){
    String code = glyphs[index].getChild("action").getChild("code").getContent(); 
    String address = glyphs[index].getChild("address").getContent(); 
    String localString = "    " + tableName + ".push(\"" + address + ":" + trim(code) + "\");";
    jsGlyphTable = append(jsGlyphTable,localString);
    println(localString); 
}
  
  return jsGlyphTable;
}