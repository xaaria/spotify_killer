@echo off

:: if 5, Active untill 04:59
SET /A endh=6 
SET /A delaysecs=30
SET /A hournow=9999

ECHO Welcome to Spotify Killer
ECHO Active between hours (00:00 - %endh%:00). Now (h): %time:~0,2% 

:main
FOR /L %%X IN (1,1,100000) DO (
	
	GOTO settime
	ECHO %hournow%

	:checktime
	IF %hournow% LSS %endh% (
		ECHO Trying to kill Spotify
		TASKKILL /IM Spotify.exe /F > NUL
	) ELSE (
		ECHO Checking again in %delaysecs% seconds...
	)
	
	TIMEOUT /T %delaysecs% /nobreak > NUL
)

:settime
SET /A hournow=%time:~0,2%
GOTO :checktime

pause