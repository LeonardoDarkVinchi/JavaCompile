@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set file=starter.bat
set manifest=MANIFEST.MF
for /f "tokens=1,2 delims=:" %%i in (%manifest%) do (
	if %%i==Main-Class (
		(echo java %%j)>>%file%
	)
)

