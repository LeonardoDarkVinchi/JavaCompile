@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set verfile=MANIFEST.MF
set tmpfile=MANIFEST.tmp
if exist %tmpfile% del /q %tmpfile%
for /f "tokens=1,2 delims=:" %%i in (%verfile%) do (
	if %%i==Program-Version (
	
		set /a k=%%j+1
		echo %%i: !k!>>%tmpfile%
		
	) else (echo %%i:%%j>>%tmpfile%)
)
copy /y %tmpfile% %verfile%>nul
del /f /q %tmpfile%