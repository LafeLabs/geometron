# Keyboard Mapping

We now introduce a dramatic simplification of the relationship between the physical keyboard and the command space. This relationship needs to be infinitely flexible both in shape and _size_, meaning it can be easily pruned down to a minimal instruction set for specific applications, then very quickly re-extended to a more complete instruction set.  

While it may seem unwieldy from a machine programming perspective, we separate all the physical lines on the physical keyboard in order to make it maximally clear to a human user.  Lines begin with 0 for the number row, 1 for qwerty row, 2 for asdfgh row, 3 for zxcvb row, and then for the shift-rows they go back to the top and 4 is !@#$% and 5 is QWERTY row, where these are generally referencing elements of the shape table in the 0200's of octal address space.

To make this maximally human readable, each line gets its own pair of arrays, one of characters and one of integers for the addresses referenced by the characters.  Integers are in base 8 for clarity for humans.  

	char[] keyRow0 = {'0','-','='};
	int[] keyAddressRow0 = {0300,0336,0337};
	char[] keyRow1 = {'q','r'};
	int[] keyAddressRow1 = {0310,0313};
	char[] keyRow2 = {'a','s','d','f','g','h','j','k','l',';'};
	int[] keyAddressRow2 = {0330,0331,0332,0333,0334,0335,0350,0351,0352,0353};
	char[] keyRow3 = {'z','x','c','v'};
	int[] keyAddressRow3 = {0340,0341,0342,0343};
	char[] keyRow4 = {'!','@','#'};
	int[] keyAddressRow4 = {0200,0201,0202};

With this mapping integrated into the code in a clear way, it makes sense to store tables of glyphs in text files which map to and from String arrays using loadStrings() and saveStrings().  

At this point it will be necessary to create a number of commands to deal with interacting with various files and string arrays to edit tables of glyphs, both action glyphs and symbol glyphs, as well as font creation.  These commands will live in what I call the "root magic" section of octal address space, the range of addresses from 0000 to 0037 base 8 or 0 through 31 base 10.  

In its most generic sense the core program of Geometron is simply a glyph editor. The glyphs which can be edited include: command symbol glyphs in the 0300s, shape action glyphs in the 0200s shape symbol glyphs in the 0200s, native code glyphs in the 0300s and 0000s, and the specific manuscript we're working on in the 0400s, which consists of both action glyphs and symbol glyphs(symbols denote sections or chapters or theorems or pages or whatever).  

To summarize:

- 0000s ROOT MAGIC: glyphs(only used in physical implementations)    0000s actions(English descriptions encoded in ASCII)

 - 0040-0177  ASCII: font, action = glyph, but make them redundant and have both for completeness

 - 0200-0277  SHAPE TABLE: shape action glyph table, shape symbol glyph table

 - 0300-0377  COMMAND TABLE: command action glyph table in ASCII, command symbol glyph table(in geometron code arrays)

 - 0400-0477  MANUSCRIPT TABLE: manuscript action glyph table, manuscript symbol glyph table

Note that to get up to 0400 and above we need a 9th bit, making the standard Roctal byte code problematic if we are going to keep both of the calibration bits in the physical implementation.  Thus by the time we get to the 0400s we need to either drop the second calibration bit(the 0) or have a different physical encoding system.  The latter is probably preferable since it means we never drop the concept of a local calibration bit which is important for extremely long term data storage and because it allows for more complex data formats to be defined as needed for each application, including fractal implementations, which are key to the power of the System here. The symmetry group might even be different for the physical manuscript bytes, and there can be a multitude of physical data, including various chemical components which are used as feedstock for physical operations.  

At this point what I need to do to get to the next level is to create a Root Magic action table capable of editing the whole space defined above.  This Root Magic must include self documentation routines that create the tables that enable a human user to always see a reference table of whatever kind they need displayed as a background in the glyph editing workspace.  This will finally eliminate the need to always have a .png file ride along with the executable, since the image will self-generate, making the .app and .exe's be self contained as they should be.  








