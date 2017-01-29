

String[] jsfont = {};
String[] xmlfont = {};

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
     xmlfont = append(xmlfont,"        <description>" + char(index + 040) +"<description>");
     xmlfont = append(xmlfont,"        <action>");
     xmlfont = append(xmlfont,"            <language>geometron</language>");
     xmlfont = append(xmlfont,"            <encoding>string</encoding>");
     xmlfont = append(xmlfont,"            <code>");
     xmlfont = append(xmlfont,"                " + command);
     xmlfont = append(xmlfont,"            </code>");
     xmlfont = append(xmlfont,"        </action>");
     xmlfont = append(xmlfont,"     </glyph>");
  }
  xmlfont = append(xmlfont,"</glyphtable>");
  saveStrings("fontfromjs.xml",xmlfont);
  exit();
}