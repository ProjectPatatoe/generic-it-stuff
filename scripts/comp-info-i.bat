@echo off
ECHO no argument = local, 1 argument = remote
IF NOT [%1] == [] goto hnameset
set /p hnameset="hostname:"
:hnameset
set /p uname="Username:"
set /p passw="password:"
ECHO:

wmic /node:"%hnameset%" /user:"%uname%" /password:"%passw%" computersystem get name,model
wmic /node:"%hnameset%" /user:"%uname%" /password:"%passw%" bios get serialnumber
wmic /node:"%hnameset%" /user:"%uname%" /password:"%passw%" nicconfig get Caption,MACAddress,ipaddress
wmic /node:"%hnameset%" /user:"%uname%" /password:"%passw%" os get name,osarchitecture

query user /server:"%hnameset%"