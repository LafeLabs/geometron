## Full Function List
	
	void setup()
	void draw()
	void drawCursor()
	void doString(String localString)
	int[] string2glyph(String localString)
	int key2command(char localChar)
	void drawGlyph(int[] localGlyph)
	void spellGlyph(int[] localGlyph)
	void keyPressed()
	void rootMagic(int localCommand)
	void doTheThing(int localCommand)
	q
	
## Global Variable Declarations:

	boolean ASCIImode = false;
	boolean backgroundOn = false;
	boolean glyphSpellingOn = false;
	float x,y,x0,y0;
	float triangleX,triangleY,squareX,squareY,pentagonX,pentagonY,hexagonX,hexagonY;
	float spellX,spellY;
	float spellSide;
	float side;
	float scaleFactor, unit;
	float theta,theta0,thetaStep;
	int currentGlyphIndex = 0;
	int currentTableIndex = 0;
	String[] currentGlyphTable = {};
	int currentGlyphAddress = 0;

	int tableMode = 4;  
	//1: font
	//2: shape symbols
	//16(0020): shape actions
	//3: command symbols	
	//4: manuscript actions 
	//5: manuscript symbols

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
	char[] keyRow4 = {'!','@','#','$','%','^','&'};
	int[] keyAddressRow4 = {0200,0201,0202,0203,0204,0205,0206};

	PImage baseImage;//always the background, gets cycled thru image table, always 
                  //use resize method of PImage to fit to width, height of window
	PImage myImage;

