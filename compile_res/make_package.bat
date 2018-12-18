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
				rmdir /S/Q !str! >nul
				if not exist !str! md !str! >nul
				move /Y *.class .\!str!\ >nul
				if exist img (
					if not exist .\!str!\img md .\!str!\img >nul
					dir .\img\ /a-d >nul 2>nul
					if not errorlevel 1 (
						copy /Y img\ .\!str!\img\ >nul
					)
				)
				
				if exist *.jpg (
					copy /Y *.jpg .\!str!\ >nul
				)
				
				if exist *.png (
					copy /Y *.png .\!str!\ >nul
				)
				
				if exist *.gif (
					copy /Y *.gif .\!str!\ >nul
				)
				
				if exist audio (
					if not exist .\!str!\audio\ md .\!str!\audio\ >nul
					dir .\audio\ /a-d >nul 2>nul
					if not errorlevel 1 (
						copy /Y audio\ .\!str!\audio\ >nul
					)
				)
				
				if exist *.mp3 (
					copy /Y *.mp3 .\!str!\ >nul
				)
				
			)
		)
	)
)


