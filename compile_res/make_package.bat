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
				echo No pack found. Not an error. Just make notice.
			) else (
				if not exist !str! md !str! >nul
				move /Y *.class .\!str!\ >nul
				if exist img (
					if not exist .\!str!\img md .\!str!\img >nul
					copy /Y img\ .\!str!\img\ >nul
				)
				if exist audio (
					if not exist .\!str!\audio\ md .\!str!\audio\ >nul
					copy /Y audio\ .\!str!\audio\ >nul
				)
			)
		)
	)
)


