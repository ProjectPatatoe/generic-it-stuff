@echo off
ECHO no argument = local, 1 argument = remote
ECHO:

wmic /node:"%1" computersystem get name,model
wmic /node:"%1" bios get serialnumber
wmic /node:"%1" nicconfig get Caption,MACAddress,ipaddress
wmic /node:"%1" os get caption,buildnumber,osarchitecture,LastBootUpTime

query user /server:"%1"