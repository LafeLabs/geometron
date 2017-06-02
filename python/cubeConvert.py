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
    print outbytes

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


def jsCube2gCube(jslibURL):#convert pastebin hypercube in geometron format into .js library in github folder
    response = urllib2.urlopen(jslibURL)
    jsString = response.read()
    linesOfCode = hypercubestring.split("\n")
    gCubeOut = ""
    for index in range(len(linesOfCode)):
        if len(inputarray[index]) > 0:
    return gCubeOut


#print gCube2jsCube("https://pastebin.com/raw/fCABR3RA")
print gCube2jsCube("https://pastebin.com/raw/qD7UUYc5")


