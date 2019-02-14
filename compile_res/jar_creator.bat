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
	
	if exist docs (
		set vardoc=docs
	) else (
		set vardoc=
	)
	
	if exist resource (
		set vardoc=!vardoc! resource
	)

	if exist *.txt (
		set vardoc=!vardoc! *.txt
	)

	if exist *.cfg (
		set vardoc=!vardoc! *.cfg
	)
	
	jar cfm !class!.jar MANIFEST.MF *.class !vardoc! !varimg! !varaudio!
) else (
	set /p package=< %packagefile%
	jar cfm !class!.jar MANIFEST.MF !package!
)