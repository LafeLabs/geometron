//rootMagic code 0000 the genesis glyph
//glyph of glyphs
//creator of all
//alpha and omega

String[] jsfont = {};
String[] xmlfont = {};

String[] jscommandSymbols = {};
String[] xmlcommandSymbols = {};

String[] jsshapeActions = {};
String[] xmlshapeActions = {};

String[] jsshapeSymbols = {};
String[] xmlshapeSymbols = {};

void setup(){
  jsfont = loadStrings("jsfont.js");
  xmlfont = append(xmlfont,"<glyphTable>");
  xmlfont = append(xmlfont,"    <type>font</type>");

  for(int index = 0;index < jsfont.length;index++){
     String[] tempArray = split(jsfont[index],'(');
     jsfont[index] = tempArray[1];
     tempArray = split(jsfont[index],')');
     jsfont[index] = tempArray[0];
     tempArray = split(jsfont[index],'\"');
     jsfont[index] = tempArray[1];
     tempArray = split(jsfont[index],':');
     String address = tempArray[0];
     String command = tempArray[1];

     xmlfont = append(xmlfont,"    <glyph>");
     xmlfont = append(xmlfont,"        <address>" + address + "</address>");
     xmlfont = append(xmlfont,"        <description>letter</description>");
     xmlfont = append(xmlfont,"        <action>");
     xmlfont = append(xmlfont,"            <language>geometron</language>");
     xmlfont = append(xmlfont,"            <encoding>string</encoding>");
     xmlfont = append(xmlfont,"            <code>");
     xmlfont = append(xmlfont,"                " + command);
     xmlfont = append(xmlfont,"            </code>");
     xmlfont = append(xmlfont,"        </action>");
     xmlfont = append(xmlfont,"     </glyph>");
  }
  xmlfont = append(xmlfont,"</glyphTable>");
  saveStrings("fontfromjs.xml",xmlfont);

  jscommandSymbols = loadStrings("jscommandSymbols.js");
  xmlcommandSymbols = append(xmlcommandSymbols,"<glyphTable>");
  xmlcommandSymbols = append(xmlcommandSymbols,"    <type>commandSymbols</type>");

  for(int index = 0;index < jscommandSymbols.length;index++){
     String[] tempArray = split(jscommandSymbols[index],'(');
     jscommandSymbols[index] = tempArray[1];
     tempArray = split(jscommandSymbols[index],')');
     jscommandSymbols[index] = tempArray[0];
     tempArray = split(jscommandSymbols[index],'\"');
     jscommandSymbols[index] = tempArray[1];
     tempArray = split(jscommandSymbols[index],':');
     String address = tempArray[0];
     String command = tempArray[1];

     xmlcommandSymbols = append(xmlcommandSymbols,"    <glyph>");
     xmlcommandSymbols = append(xmlcommandSymbols,"        <address>" + address + "</address>");
     xmlcommandSymbols = append(xmlcommandSymbols,"        <description>" + "command symbol" +"</description>");
     xmlcommandSymbols = append(xmlcommandSymbols,"        <action>");
     xmlcommandSymbols = append(xmlcommandSymbols,"            <language>geometron</language>");
     xmlcommandSymbols = append(xmlcommandSymbols,"            <encoding>string</encoding>");
     xmlcommandSymbols = append(xmlcommandSymbols,"            <code>");
     xmlcommandSymbols = append(xmlcommandSymbols,"                " + command);
     xmlcommandSymbols = append(xmlcommandSymbols,"            </code>");
     xmlcommandSymbols = append(xmlcommandSymbols,"        </action>");
     xmlcommandSymbols = append(xmlcommandSymbols,"     </glyph>");
  }
  xmlcommandSymbols = append(xmlcommandSymbols,"</glyphTable>");
  saveStrings("commandSymbolsfromjs.xml",xmlcommandSymbols);

  jsshapeSymbols = loadStrings("jsshapeSymbols.js");
  xmlshapeSymbols = append(xmlshapeSymbols,"<glyphTable>");
  xmlshapeSymbols = append(xmlshapeSymbols,"    <type>shapeSymbols</type>");

  for(int index = 0;index < jsshapeSymbols.length;index++){
     String[] tempArray = split(jsshapeSymbols[index],'(');
     jsshapeSymbols[index] = tempArray[1];
     tempArray = split(jsshapeSymbols[index],')');
     jsshapeSymbols[index] = tempArray[0];
     tempArray = split(jsshapeSymbols[index],'\"');
     jsshapeSymbols[index] = tempArray[1];
     tempArray = split(jsshapeSymbols[index],':');
     String address = tempArray[0];
     String command = tempArray[1];

     xmlshapeSymbols = append(xmlshapeSymbols,"    <glyph>");
     xmlshapeSymbols = append(xmlshapeSymbols,"        <address>" + address + "</address>");
     xmlshapeSymbols = append(xmlshapeSymbols,"        <description>" + "shape symbol" +"</description>");
     xmlshapeSymbols = append(xmlshapeSymbols,"        <action>");
     xmlshapeSymbols = append(xmlshapeSymbols,"            <language>geometron</language>");
     xmlshapeSymbols = append(xmlshapeSymbols,"            <encoding>string</encoding>");
     xmlshapeSymbols = append(xmlshapeSymbols,"            <code>");
     xmlshapeSymbols = append(xmlshapeSymbols,"                " + command);
     xmlshapeSymbols = append(xmlshapeSymbols,"            </code>");
     xmlshapeSymbols = append(xmlshapeSymbols,"        </action>");
     xmlshapeSymbols = append(xmlshapeSymbols,"     </glyph>");
  }
  xmlshapeSymbols = append(xmlshapeSymbols,"</glyphTable>");
  saveStrings("shapeSymbolsfromjs.xml",xmlshapeSymbols);

  
  jsshapeActions = loadStrings("jsshapeActions.js");
  xmlshapeActions = append(xmlshapeActions,"<glyphTable>");
  xmlshapeActions = append(xmlshapeActions,"    <type>shapeActions</type>");
  for(int index = 0;index < jsshapeActions.length;index++){
     String[] tempArray = split(jsshapeActions[index],'(');
     jsshapeActions[index] = tempArray[1];
     tempArray = split(jsshapeActions[index],')');
     jsshapeActions[index] = tempArray[0];
     tempArray = split(jsshapeActions[index],'\"');
     jsshapeActions[index] = tempArray[1];
     tempArray = split(jsshapeActions[index],':');
     String address = tempArray[0];
     String command = tempArray[1];

     xmlshapeActions = append(xmlshapeActions,"    <glyph>");
     xmlshapeActions = append(xmlshapeActions,"        <address>" + address + "</address>");
     xmlshapeActions = append(xmlshapeActions,"        <description>" + "shape action" +"</description>");
     xmlshapeActions = append(xmlshapeActions,"        <action>");
     xmlshapeActions = append(xmlshapeActions,"            <language>geometron</language>");
     xmlshapeActions = append(xmlshapeActions,"            <encoding>string</encoding>");
     xmlshapeActions = append(xmlshapeActions,"            <code>");
     xmlshapeActions = append(xmlshapeActions,"                " + command);
     xmlshapeActions = append(xmlshapeActions,"            </code>");
     xmlshapeActions = append(xmlshapeActions,"        </action>");
     xmlshapeActions = append(xmlshapeActions,"     </glyph>");
  }
  xmlshapeActions = append(xmlshapeActions,"</glyphTable>");
  saveStrings("shapeActionsfromjs.xml",xmlshapeActions);
  
  exit();
}