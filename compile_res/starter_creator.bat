@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set file=starter.bat
set string=lol

if exist packagename.tmp (
	set /p pn=< packagename.tmp
	set /p cn=< classname.tmp
	set string=!pn!.!cn!
) else (
	set /p string=< classname.tmp
)
(echo java !string!)>>%file%