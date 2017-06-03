import math
import urllib2
def string2byteCode(inputstring):
    outbytes = ""
    for index in range(len(inputstring)):
        thisbyte = ord(inputstring[index])
        thisbyte = oct(thisbyte)
        if thisbyte[1] == "o":
            outbytes += "0o" + thisbyte.lstrip("0") + ","
        else:
            outbytes += thisbyte + ","
    return outbytes

def byteCode2string(inputcode):
    inputarray = inputcode.split(",")
    outputstring = ""
    for index in range(len(inputarray)):
        if len(inputarray[index]) > 0:
            #print chr(int(inputarray[index],8))
            outputstring += chr(int(inputarray[index],8))
    return outputstring

def gCube2jsCube(cubeURL):#convert pastebin hypercube in geometron format into .js library in github folder
    response = urllib2.urlopen(cubeURL)
    hypercubestring = response.read()
    inputarray = hypercubestring.split("\n")
    jsCodeOut = "newCube = [];\n"
    jsCodeOut += "for(var index = 0;index < 02000;index++){\n   newCube.push(\"\");\n }\n"
    for index in range(len(inputarray)):
        if len(inputarray[index]) > 0:
            foo = inputarray[index].split(":")
            address = int(foo[0],8)
            bytecode = foo[1]
            jsCodeOut += "newCube[" + foo[0] + "] = \"" + foo[1].rstrip("\r") + "\";\n"
    return jsCodeOut


def extractDoTheThing(jslibURL):#convert js library to  hypercube
    response = urllib2.urlopen(jslibURL)
    jsString = response.read()
    linesOfCode = jsString.split("\n")
    outputString = ""
    inDoTheThing = False
    for index in range(len(linesOfCode)):
        if "function localRoot(localCommand)" in linesOfCode[index]:
            inDoTheThing = False
        if inDoTheThing:
            outputString += linesOfCode[index].rstrip("\r")
            outputString += "\n"    
        if linesOfCode[index] == "function doTheThing(localCommand){":
            inDoTheThing = True

    return outputString

def doTheThing2cube(doTheThingString):
    thingArray = doTheThingString.split("if(localCommand == ")
    outputCube = ""
    for index in range(len(thingArray)):
        address = thingArray[index].partition(")")[0]  
        address = address.lstrip()
        address = address.lstrip("\r")
        address = address.lstrip("\n")
        address = address.lstrip()
        code = thingArray[index].partition(")")[2] 
        code =  code.lstrip("{")
        code =  code.lstrip()
        code = code.rpartition("}")[0]
        code = code.rstrip()
        if len(code) > 0:
            outputCube += address + ":" + string2byteCode(code) + "\n"
    outputCube =  "0500:" + outputCube.partition("0500:")[2]
    print outputCube

#print gCube2jsCube("https://pastebin.com/raw/fCABR3RA")
#print gCube2jsCube("https://pastebin.com/raw/qD7UUYc5")

foo =  extractDoTheThing("https://lafelabs.github.io/cube3.html")
doTheThing2cube(foo)

