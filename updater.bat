@echo off
cls
echo Updater version: 0.5.1
for /d %%B in (..\*) do (
	if exist %%B\*.java (
		if not exist "%%B\compile_res" md "%%B\compile_res"
		copy /y .\* "%%B\" >nul
		copy /y .\compile_res "%%B\compile_res" >nul
		del "%%B\updater.bat"
		del "%%B\JCchangelog.txt"
		echo %%B updated!
	)
)
