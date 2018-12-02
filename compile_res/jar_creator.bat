@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set manifest=MANIFEST.MF
for /f "tokens=1,2 delims=:" %%i in (%manifest%) do (
	if %%i==Main-Class (
		set l=""
		for /f "tokens=1,2 delims=." %%k in ("%%j") do (
			set str=%%k
			set str=!str:~1!
			if "%%l"=="" (
				if exist img (
					set varimg=img 
				) else (
					set varimg= 
				)
				if exist audio (
					set varaudio=audio 
				) else (
					set varaudio= 
				)
				jar cfm !str!.jar MANIFEST.MF *.class !varimg! !audio!
			) else (
				jar cfm %%l.jar MANIFEST.MF !str!
			)
		)
	)
)

