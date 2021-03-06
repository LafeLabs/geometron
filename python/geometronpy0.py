
import math

jsBytes = "0330,0200,0331,0340,,0332,0400,,,"



def jsb2pb(inbytes):#convert JavaScript bytecode to Python 3(not 2) bytecode
    jsByteArray = inbytes.split(',')
    outbytes = ""
    for index in range(len(jsByteArray)):
        if len(jsByteArray[index]) > 0:
            thisByte = jsByteArray[index]
            thisByte = thisByte.lstrip("0")
            thisByte = "0o" + thisByte
            outbytes += thisByte + ","
    return outbytes

def pb2jsb(inbytes):# convert from python 3 octal to js
    pByteArray = inbytes.split(',')
    outbytes = ""
    for index in range(len(pByteArray)):
        if len(pByteArray[index]) > 0:
            thisByte = pByteArray[index]
            thisByte = thisByte.lstrip("0o")
            thisByte = "0" + thisByte
            outbytes += thisByte + ","
    return outbytes

def string2byteCode(inputstring):
    outbytes = ""
    for index in range(len(inputstring)):
        thisbyte = ord(inputstring[index])
        thisbyte = oct(thisbyte)
        if thisbyte[1] == "o":
            outbytes += "0o" + thisbyte.lstrip("0") + ","
        else:
            outbytes += thisbyte + ","
    print outbytes

def byteCode2string(inputcode):
    inputarray = inputcode.split(",")
    outputstring = ""
    for index in range(len(inputarray)):
        if len(inputarray[index]) > 0:
            #print chr(int(inputarray[index],8))
            outputstring += chr(int(inputarray[index],8))
    return outputstring


class geometronstate:
    def __init__(self,hyperCube,x,y,x0,y0,unit):
        self.hyperCube = hyperCube
        self.x = x
        self.y = y
        self.x0 = x0
        self.y0 = y0
        self.unit = unit
        self.side = self.unit
        self.theta0 = -math.pi/2
        self.scaleFactor = 2
        self.thetaStep = math.pi/2
        self.theta = self.theta0
        self.svg = "<svg width=\"400\" height=\"400\" viewbox = \"0 0 400 400\"  xmlns=\"http://www.w3.org/2000/svg\" style = \"border:solid;\">\n"		
        self.stroke = "black"
        self.fill = "none"
        self.lineWidth = "2"

        self.currentWord = "word" #actions in the 0600s manipulate these with tags and constants
        self.textContainer = ""
        self.currentString = ""
        self.currentAtom = ""
        self.currentDocument = ""
        self.currentSVG = ""
        self.wordStack = []

        self.width = 400 #these globals can get manipulated by 05xx actions
        self.height = 400


    def drawGlyph(self,localGlyph):
        glyphArray =  localGlyph.split(",")
        for index in range(len(glyphArray)):
            if len(glyphArray[index]) > 0:
                self.doTheThing(int(glyphArray[index],8))
    def printSVG(self):
        print self.svg + "</svg>"

    def printString(self):
        print self.currentString

    def doTheThing(self,localCommand):
        if localCommand == 03:
            self.currentString = ""
        if localCommand >= 040 and localCommand <= 0277:
            if localCommand >= 040 and localCommand <= 0176:
                self.currentString += chr(localCommand)
            self.drawGlyph(self.hyperCube[localCommand])
        if localCommand == 011 or localCommand == 012:
            self.currentString += chr(localCommand)
        if localCommand >= 0600 and localCommand <= 0677:
            if len(self.hyperCube[localCommand]) > 0:
                self.drawGlyph(self.hyperCube[localCommand]) 
        if localCommand >= 01000 and localCommand <= 01777:
            if len(self.hyperCube[localCommand]) > 0:
                self.drawGlyph(self.hyperCube[localCommand]) 
        if localCommand >= 0400 and localCommand <= 0477:
            if len(self.hyperCube[localCommand]) > 0:
                self.drawGlyph(self.hyperCube[localCommand]) 
        if localCommand == 0300:
            self.x=self.x0
            self.y=self.y0
            self.theta = self.theta0
            self.thetaStep = math.pi/2
            self.scaleFactor = 2
        if localCommand == 0304:
            self.thetaStep = math.pi/2
        if localCommand == 0305:
            self.thetaStep = 2*math.pi/5
        if localCommand == 0306:
            self.thetaStep = math.pi/3
        if localCommand == 0310:
            self.scaleFactor = math.sqrt(2)
        if localCommand == 0311:
            self.scaleFactor = (1 + math.sqrt(5))/2
        if localCommand == 0312:
            self.scaleFactor = math.sqrt(3)
        if localCommand == 0313:
            self.scaleFactor = 2
        if localCommand == 0314:
            self.scaleFactor = 3
        if localCommand == 0315:
            self.scaleFactor = math.pi
        if localCommand == 0316:
            self.scaleFactor = 5
        if localCommand == 0317:
            self.side = self.unit
        if localCommand == 0320:
            self.fill = "black"
            self.stroke = "black"
        if localCommand == 0321:
            self.fill = "yellow"
            self.stroke = "yellow"
        if localCommand == 0322:
            self.fill = "orange"
            self.stroke = "orange"
        if localCommand == 0323:
            self.fill = "white"
            self.stroke = "white"
        if localCommand == 0324:
            self.fill = "red"
            self.stroke = "red"
        if localCommand == 0325:
            self.fill = "green"
            self.stroke = "green"
        if localCommand == 0326:
            self.fill = "purple"
            self.stroke = "purple"
        if localCommand == 0327:
            self.fill = "blue"
            self.stroke = "blue"
        if localCommand == 0330:
            self.x += self.side*math.cos(self.theta)
            self.y += self.side*math.sin(self.theta)
        if localCommand == 0331:
            self.x -= self.side*math.cos(self.theta)
            self.y -= self.side*math.sin(self.theta)
        if localCommand == 0332:
            self.x += self.side*math.cos(self.theta - self.thetaStep)
            self.y += self.side*math.sin(self.theta - self.thetaStep)
        if localCommand == 0333:
            self.x += self.side*math.cos(self.theta + self.thetaStep)
            self.y += self.side*math.sin(self.theta + self.thetaStep)
        if localCommand == 0334:
            self.theta -= self.thetaStep
        if localCommand == 0335:
            self.theta += self.thetaStep
        if localCommand == 0336:
            self.side /= self.scaleFactor
        if localCommand == 0337:
            self.side *= self.scaleFactor
        if localCommand == 0340: #point
            self.svg += "<circle cx=\""
            self.svg += str(round(self.x))
            self.svg += "\" cy = \""
            self.svg += str(round(self.y))
            self.svg += "\" r = \"3\" stroke = \"" + self.stroke + "\" stroke-width = \"2\" "
            self.svg += "fill = \"" + self.stroke + "\" />\n"
        if localCommand == 0341: #circle of radius side
            self.svg += "    <circle cx=\""
            self.svg += str(round(self.x))
            self.svg += "\" cy = \""
            self.svg += str(round(self.y))
            self.svg += "\" r = \"" + str(round(self.side)) + "\" stroke = \"" + self.stroke + "\" stroke-width = \"2\" "
            self.svg += "fill = \"none\" />\n"
        if localCommand == 0342:
            self.svg += "    <line x1=\"" + str(round(self.x))
            self.svg += "\" y1=\"" + str(round(self.y))
            x2 = round(self.x + self.side*math.cos(self.theta))
            y2 = round(self.y + self.side*math.sin(self.theta))            
            self.svg += "\" x2=\"" + str(x2)
            self.svg += "\" y2=\"" + str(y2)
            self.svg += "\" style=\"stroke:" + self.stroke + ";stroke-width:"+self.lineWidth+"\" />\n"
        if localCommand == 0343:
            self.svg += "  <path d=\"M"
            self.svg += str(self.x + self.side*math.cos(self.theta - self.thetaStep)) + " "
            self.svg += str(self.y + self.side*math.sin(self.theta - self.thetaStep))
            self.svg += "       A"
            self.svg += str(self.side) + " " + str(self.side) + " 0 0 1 "
            self.svg += str(self.x + self.side*math.cos(self.theta + self.thetaStep)) + " "
            self.svg += str(self.y + self.side*math.sin(self.theta + self.thetaStep)) + " "
            self.svg += "\" fill = \"none\" stroke = \"black\" stroke-width = \"2\" />\n"
        if localCommand == 0344:
            x2 = round(self.x + self.side*math.cos(self.theta))
            y2 = round(self.y + self.side*math.sin(self.theta))            
            self.svg += "L" + x2 + " " + y2 + " "
        if localCommand == 0347:
            self.svg += "    <circle cx=\""
            self.svg += str(round(self.x))
            self.svg += "\" cy = \""
            self.svg += str(round(self.y))
            self.svg += "\" r = \"" + str(round(self.side)) + "\" stroke = \"" + self.stroke + "\" stroke-width = \"2\" "
            self.svg += "fill = \"" + self.fill + "\" />\n"
        if localCommand == 0350:
            self.thetaStep /= 2
        if localCommand == 0351:
            self.thetaStep *= 2
        if localCommand == 0352:
            self.thetaStep /= 3
        if localCommand == 0354:
            self.thetaStep *= 3
        if localCommand == 0362:
            self.svg += "	<path d = \"M"
            self.svg += str(round(self.x)) + " "
            self.svg += str(round(self.y)) + " "
        if localCommand == 0363:
            self.svg += "Z\""+ " stroke = \"" + self.stroke + "\" stroke-width = \"" + self.lineWidth + "\" fill = \"" + "none" + "\" "+"/>"
        if localCommand == 0364:
            self.svg += "Z\""+ " stroke = \"" + self.stroke + "\" stroke-width = \"" + self.lineWidth + "\" fill = \"" + self.fill + "\" "+"/>"
        if localCommand == 0365:
            self.svg += "    <text x=\"" + str(round(self.x))
            self.svg += "\" y = \"" + str(round(self.y))
            self.svg += "\" fill = \"" + self.stroke + "\""
            self.svg += " font-size = \""
            self.svg += str(round(self.side)) + "px\""
            self.svg += " font-family = \"futura\">"
            self.svg += self.currentWord
            self.svg += "</text>\n"
        if localCommand == 0366:
            cpx1 = round(self.x + self.side*math.cos(self.theta))
            cpy1 = round(self.y + self.side*math.sin(self.theta))
            self.svg += "<path    d = \"M"
            self.svg += str(round(self.x)) + ","
            self.svg += str(round(self.y)) + " C"
            self.svg += str(cpx1) + "," + str(cpy1) + " "
        if localCommand == 0367:
            x2 = round(self.x)
            y2 = round(self.y)
            cpx2 = round(self.x + self.side*math.cos(self.theta))
            cpy2 = round(self.y + self.side*math.sin(self.theta))
            self.svg += str(cpx2) + "," + str(cpy2) + " "
            self.svg += str(x2) + "," + str(y2)           
            self.svg += "\" fill = \"none\" stroke-width = \"2\" stroke = \"" + self.stroke + "\" />"
        


f = open('hypercube.txt', 'r')
hypercubestring = f.read()
f.close()

hyperCube = []
for index in range(1024):
    hyperCube.append("")

inputarray = hypercubestring.split("\n")

for index in range(len(inputarray)):
    if len(inputarray[index]) > 0:
        foo = inputarray[index].split(":")
        address = int(foo[0],8)
        bytecode = foo[1]
        hyperCube[address] = foo[1]


unit = 50
x0 = 200
y0 = 200
x = x0
y = y0
g = geometronstate(hyperCube,x,y,x0,y0,unit)

#g.drawGlyph("0330,0330,0332,0332,0332,0336,0336,0310,0337,0313,0147,0145,0157,0155,0145,0164,0162,0157,0156,0350,0350,0335,0304,040,0151,0156,040,0331,0331,0350,0350,0350,0334,0334,0334,0334,0304,0160,0171,0164,0150,0157,0156,041,0300,0337,0337,0337,0336,0332,0337,0341,0340,0333,0340,0341,0334,0306,0334,0330,0340,0341,")
#g.printSVG()
#g.drawGlyph("0600,0101,0102,0103,0601,0602,0105,075,0155,0143,0136,062,0603")
#g.drawGlyph("0337,0337,0401")
#g.drawGlyph("0332,0336,01600,01601")
#g.printSVG()
g.drawGlyph("040,0601")
g.printString()

"""inkscape -D -z --file=/Users/lafespietz/Desktop/geometron/python/foo.svg --export-pdf=/Users
/lafespietz/Desktop/geometron/python/foo2.pdf --export-latex

"""