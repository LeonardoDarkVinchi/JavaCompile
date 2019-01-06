@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set packagefile=packagename.tmp
set classfile=classname.tmp
set manifest=MANIFEST.MF

set sParam1=%1
if not defined sParam1 goto first
if %1==1 goto first
if %1==2 goto second

:first
for /f "tokens=1,2 delims=:" %%i in (%manifest%) do (
	if %%i==Main-Class (
		for /f "tokens=1,2 delims=." %%k in ("%%j") do (
			set str=%%k
			set str=!str:~1!
			if "%%l"=="" (
				(echo !str!)>>%classfile%
			) else (
				(echo %%l)>>%classfile%
				(echo !str!)>>%packagefile%
			)
		)
	)
)
goto end

:second
if exist %classfile% del /S /F /Q %classfile% >nul
if exist %packagefile% del /S /F /Q %packagefile% >nul

:end