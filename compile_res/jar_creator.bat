@echo off
SETLOCAL ENABLEDELAYEDEXPANSION

set packagefile=packagename.tmp
set /p class=< classname.tmp

if not exist %packagefile% (
	if exist img (
		set varimg=img
	) else (
		set varimg= 
	)
	
	if exist *.jpg (
		set varimg=!varimg! *.jpg 
	)
	
	if exist *.png (
		set varimg=!varimg! *.png
	)
	
	if exist *.gif (
		set varimg=!varimg! *.gif
	)
	
	if exist audio (
		set varaudio=audio 
	) else (
		set varaudio= 
	)
	
	if exist *.mp3 (
		set varaudio=!varaudio! *.mp3
	)
	
	jar cfm !class!.jar MANIFEST.MF *.class !varimg! !varaudio!
) else (
	set /p package=< %packagefile%
	jar cfm !class!.jar MANIFEST.MF !package!
)