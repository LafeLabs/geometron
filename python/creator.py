#!/usr/bin/env python
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

def create(cubeURL,outputFile):
    response = urllib2.urlopen(cubeURL)
    hypercubestring = response.read()
    hyperCube = []    
    for index in range(1024):
        hyperCube.append("")
    inputarray = hypercubestring.split("\n")
    tableString = ""
    for index in range(len(inputarray)):
        if len(inputarray[index]) > 0:
            foo = inputarray[index].split(":")
            address = int(foo[0],8)
            bytecode = foo[1].rstrip()
            hyperCube[address] = bytecode
            tableString += foo[0] + ":" + bytecode + "\n"
    htmlOUT = ""
    htmlOUT += byteCode2string(hyperCube[01])
    htmlOUT += tableString
    htmlOUT += byteCode2string(hyperCube[02])
#    htmlOUT += byteCode2string(hyperCube[03])
    htmlOUT += byteCode2string(hyperCube[04])    
    htmlOUT += byteCode2string(hyperCube[05])
    f = open(outputFile, 'w')
    f.write(htmlOUT)
    f.close()

def create2(basecube,diffcube,outputFile):
    response1 = urllib2.urlopen(basecube)
    hypercubestring = response1.read()
    response1.close()
    response2 = urllib2.urlopen(diffcube)
    hypercubestring += "\n"
    hypercubestring += response2.read()
    response2.close()
    hyperCube = []    
    for index in range(1024):
        hyperCube.append("")
    inputarray = hypercubestring.split("\n")
    tableString = ""
    for index in range(len(inputarray)):
        if len(inputarray[index]) > 0:
            foo = inputarray[index].split(":")
            address = int(foo[0],8)
            bytecode = foo[1].rstrip()
            hyperCube[address] = bytecode
            tableString += foo[0] + ":" + bytecode + "\n"
    
    htmlOUT = ""
    htmlOUT += byteCode2string(hyperCube[01])
    htmlOUT += tableString
    htmlOUT += byteCode2string(hyperCube[02])
    htmlOUT += byteCode2string(hyperCube[04])    
    htmlOUT += byteCode2string(hyperCube[05])
    f = open(outputFile, 'w')
    f.write(htmlOUT)
    f.close()
    


cubeURL1 =  'https://pastebin.com/raw/R5mBtfAs'
#basecube = "https://pastebin.com/raw/R5mBtfAs"
#diffcube = "https://pastebin.com/raw/yyydhaZS"
#create(cubeURL1,outputFile)


f = open("basecube.txt", 'r')
basecube = f.read()
f.close()
f = open("diffcube.txt", 'r')
diffcube = f.read()
f.close()
outputFile = 'index.html'
create2(basecube,diffcube,outputFile)

