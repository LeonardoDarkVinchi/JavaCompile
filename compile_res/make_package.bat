@echo off
SETLOCAL ENABLEDELAYEDEXPANSION
set packagefile=packagename.tmp

if not exist %packagefile% (
	echo No pack found. Not an error. Just make notice.
) else (
	set /p str=< %packagefile%
	if exist !str! rmdir /S/Q !str! >nul
	md !str! >nul
	move /Y *.class .\!str!\ >nul 2>nul
	if exist img (
		md .\!str!\img >nul
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
		md .\!str!\audio\ >nul
		dir .\audio\ /a-d >nul 2>nul
		if not errorlevel 1 (
			copy /Y audio\ .\!str!\audio\ >nul
		)
	)

	if exist *.mp3 (
		copy /Y *.mp3 .\!str!\ >nul
	)
)
