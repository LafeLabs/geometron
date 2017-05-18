import math

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

class geometron:
    def __init__(self,hyperCubeFile,x0,y0,unit):
        self.hyperCubeFile = hyperCubeFile
        self.hyperCube = []
        self.x0 = x0
        self.y0 = y0
        self.x = x0
        self.y = y0
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
        self.loadCube()
        self.currentString = ""
        self.mode = "text" #modes: text [6],draw [3]

    def loadCube(self):
        f = open(self.hyperCubeFile, 'r')
        hypercubestring = f.read()
        f.close()
        for index in range(1024):
            self.hyperCube.append("")        
        inputarray = hypercubestring.split("\n")
        for index in range(len(inputarray)):
            if len(inputarray[index]) > 0:
                foo = inputarray[index].split(":")
                address = int(foo[0],8)
                bytecode = foo[1]
                self.hyperCube[address] = foo[1]

    def drawGlyph(self,localGlyph):
        glyphArray =  localGlyph.split(",")
        for index in range(len(glyphArray)):
            if len(glyphArray[index]) > 0:
                self.doTheThing(int(glyphArray[index],8))
    
    def printGlyph(self,localGlyph):
        self.currentString = ""
        self.drawGlyph(localGlyph)
        print self.currentString
        
    def makeDoc(self):
        for page in range(0100):
            if len(self.hyperCube[0400 + page]) > 0:
                self.printGlyph(self.hyperCube[0400 + page])

    def doTheThing(self,localCommand):
        if localCommand == 03:
            self.mode = "draw"
            self.currentWord = ""
        if localCommand == 06:
            self.mode = "text"
        if localCommand >= 0200 and localCommand <= 0277:
            if len(self.hyperCube[localCommand]) > 0:
                self.drawGlyph(self.hyperCube[localCommand])
        if localCommand >= 040 and localCommand <= 0176:
            if self.mode == "text":
                self.currentString += chr(localCommand)
            if self.mode == "draw":
                self.currentWord += chr(localCommand)
        if localCommand == 011 or localCommand == 012:
            self.currentString += chr(localCommand)
        if localCommand >= 0500 and localCommand <= 0677:
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
            localString = ""
            localString += "<circle cx=\""
            localString += str(round(self.x))
            localString += "\" cy = \""
            localString += str(round(self.y))
            localString += "\" r = \"3\" stroke = \"" + self.stroke + "\" stroke-width = \"2\" "
            localString += "fill = \"" + self.stroke + "\" />\n"
            self.currentString +=  localString
        if localCommand == 0341: #circle of radius side
            localString = ""
            localString += "    <circle cx=\""
            localString += str(round(self.x))
            localString += "\" cy = \""
            localString += str(round(self.y))
            localString += "\" r = \"" + str(round(self.side)) + "\" stroke = \"" + self.stroke + "\" stroke-width = \"2\" "
            localString += "fill = \"none\" />\n"
            self.currentString +=  localString
        if localCommand == 0342:
            localString = ""
            localString += "    <line x1=\"" + str(round(self.x))
            localString += "\" y1=\"" + str(round(self.y))
            x2 = round(self.x + self.side*math.cos(self.theta))
            y2 = round(self.y + self.side*math.sin(self.theta))            
            localString += "\" x2=\"" + str(x2)
            localString += "\" y2=\"" + str(y2)
            localString += "\" style=\"stroke:" + self.stroke + ";stroke-width:"+self.lineWidth+"\" />\n"
            self.currentString +=  localString
        if localCommand == 0343:
            localString = ""
            localString += "  <path d=\"M"
            localString += str(self.x + self.side*math.cos(self.theta - self.thetaStep)) + " "
            localString += str(self.y + self.side*math.sin(self.theta - self.thetaStep))
            localString += "       A"
            localString += str(self.side) + " " + str(self.side) + " 0 0 1 "
            localString += str(self.x + self.side*math.cos(self.theta + self.thetaStep)) + " "
            localString += str(self.y + self.side*math.sin(self.theta + self.thetaStep)) + " "
            localString += "\" fill = \"none\" stroke = \"black\" stroke-width = \"2\" />\n"
            self.currentString +=  localString
        if localCommand == 0344:
            localString = ""
            x2 = round(self.x + self.side*math.cos(self.theta))
            y2 = round(self.y + self.side*math.sin(self.theta))            
            localString += "L" + x2 + " " + y2 + " "
            self.currentString +=  localString
        if localCommand == 0347:
            localString = ""
            localString += "    <circle cx=\""
            localString += str(round(self.x))
            localString += "\" cy = \""
            localString += str(round(self.y))
            localString += "\" r = \"" + str(round(self.side)) + "\" stroke = \"" + self.stroke + "\" stroke-width = \"2\" "
            localString += "fill = \"" + self.fill + "\" />\n"
            self.currentString +=  localString
        if localCommand == 0350:
            self.thetaStep /= 2
        if localCommand == 0351:
            self.thetaStep *= 2
        if localCommand == 0352:
            self.thetaStep /= 3
        if localCommand == 0354:
            self.thetaStep *= 3
        if localCommand == 0362:
            localString = ""
            localString += "	<path d = \"M"
            localString += str(round(self.x)) + " "
            localString += str(round(self.y)) + " "
            self.currentString +=  localString
        if localCommand == 0363:
            localString = ""
            localString += "Z\""+ " stroke = \"" + self.stroke + "\" stroke-width = \"" + self.lineWidth + "\" fill = \"" + "none" + "\" "+"/>"
            self.currentString +=  localString
        if localCommand == 0364:
            localString = ""
            localString += "Z\""+ " stroke = \"" + self.stroke + "\" stroke-width = \"" + self.lineWidth + "\" fill = \"" + self.fill + "\" "+"/>"
            self.currentString +=  localString
        if localCommand == 0365:
            localString = ""
            localString += "    <text x=\"" + str(round(self.x))
            localString += "\" y = \"" + str(round(self.y))
            localString += "\" fill = \"" + self.stroke + "\""
            localString += " font-size = \""
            localString += str(round(self.side)) + "px\""
            localString += " font-family = \"futura\">"
            localString += self.currentWord
            localString += "</text>\n"
            self.currentString +=  localString
        if localCommand == 0366:
            localString = ""
            cpx1 = round(self.x + self.side*math.cos(self.theta))
            cpy1 = round(self.y + self.side*math.sin(self.theta))
            localString += "<path    d = \"M"
            localString += str(round(self.x)) + ","
            localString += str(round(self.y)) + " C"
            localString += str(cpx1) + "," + str(cpy1) + " "
            self.currentString +=  localString
        if localCommand == 0367:
            localString = ""
            x2 = round(self.x)
            y2 = round(self.y)
            cpx2 = round(self.x + self.side*math.cos(self.theta))
            cpy2 = round(self.y + self.side*math.sin(self.theta))
            localString += str(cpx2) + "," + str(cpy2) + " "
            localString += str(x2) + "," + str(y2)           
            localString += "\" fill = \"none\" stroke-width = \"2\" stroke = \"" + self.stroke + "\" />"
            self.currentString +=  localString

unit = 50
x0 = 200
y0 = 200
g = geometron("hypercube.txt",x0,y0,unit)
g.makeDoc()

"""inkscape -D -z --file=/Users/lafespietz/Desktop/geometron/python/foo.svg --export-pdf=/Users
/lafespietz/Desktop/geometron/python/foo2.pdf --export-latex
"""