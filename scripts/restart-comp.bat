@echo off
ECHO no argument = local, 1 argument = remote
ECHO:

ping -n 1 "%1" | findstr /r /c:"[0-9] *ms"

if %errorlevel% == 0 (
    echo Ping ok.
	wmic /node:"%1" computersystem get name,model
	query user /server:"%1"
	query user /server:"%1" | findstr /r /c:"USERNAME"
	if %errorlevel% == 0 (
		echo ---A user is logged in!---
	) else (
		echo no user logged in.
	)
	SET /P CONFIRMshutdown="Shutdown (Y/[N])?"
	if %CONFIRMshutdown% NEQ "Y" (
		SET /P SHUTDOWNmessage="Shutdown Message:"
		shutdown /r /m \\%1 /c "%SHUTDOWNmessage%"
	)
) else (
    echo Fail'ed to ping.
)


