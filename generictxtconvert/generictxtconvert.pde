

char[] keyRow0 = {'1','2','3','7','0','-','='};
int[] keyAddressRow0 = {0304,0305,0306,0317,0300,0336,0337};
char[] keyRow1 = {'q','w','e','r','t','u','i','o','p'};
int[] keyAddressRow1 = {0310,0311,0312,0313,0314,0370,0371,0360,0361};
char[] keyRow2 = {'a','s','d','f','g','h','j','k','l',';'};
int[] keyAddressRow2 = {0330,0331,0332,0333,0334,0335,0350,0351,0352,0353};
char[] keyRow3 = {'z','x','c','v','b','n','m',','};
int[] keyAddressRow3 = {0340,0341,0342,0343,0344,0345,0346,0347};
char[] keyRow4 = {'!','@','#','$','%','^','&','*','Q','W','E','R','T','Y','U','I'};
int[] keyAddressRow4 = {0200,0201,0202,0203,0204,0205,0206,0207,0210,0211,0212,0213,0214,0215,0216,0217};

void setup(){
  
  println(string2octal("1--m,ggm,hca---axs===s-scahaaaah===cfca"));
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