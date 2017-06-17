#!/usr/bin/env python
# pylint: disable=C0103
# pylint: disable=C0200
import urllib2
import json

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

f = open("cubetracker.json", 'r')
cubetracker = f.read()
f.close()
parsed_json = json.loads(cubetracker)
hypercubestring = ""
for index in range(len(parsed_json)):
    url = parsed_json[index]["url"]
    response = urllib2.urlopen(url)
    hypercubestring += response.read()
    response.close()
    hypercubestring += "\n"

hyperCube = []
for index in range(1024):
    hyperCube.append("")
hypercubearray = hypercubestring.split("\n")
tableString = ""
for index in range(len(hypercubearray)):
    if len(hypercubearray[index]) > 0:
        foo = hypercubearray[index].split(":")
        address = int(foo[0], 8)
        bytecode = foo[1].rstrip()
        hyperCube[address] = bytecode
        tableString += foo[0] + ":" + bytecode + "\n"

htmlOUT = ""
htmlOUT += byteCode2string(hyperCube[01])
htmlOUT += tableString
htmlOUT += byteCode2string(hyperCube[02])
htmlOUT += byteCode2string(hyperCube[04])
htmlOUT += byteCode2string(hyperCube[05])
f = open("derp.html", 'w')
f.write(htmlOUT)
f.close()
