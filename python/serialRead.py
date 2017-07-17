#!/usr/bin/env python
import serial
ser = serial.Serial('/dev/cu.usbmodemFD111')  # open serial port
ser.baudrate = 115200
rawdata = ser.readlines(3100)
stringout = ""
for index in range(len(rawdata)):
    rawdata[index] = rawdata[index].strip()
    stringout += rawdata[index] + ","

derp = stringout.split(",")
stringout = ""
for index in range(600):
    stringout += derp[index] + ","
print stringout + "\n"