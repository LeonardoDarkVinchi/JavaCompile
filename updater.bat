@echo off
cls
echo Updater version: 0.4
for /d %%B in (..\*) do (
	if not %%B==..\JavaCompile (
		if exist %%B\*.java (
			if not exist "%%B\compile_res" md "%%B\compile_res"
			copy /y .\* "%%B\" >nul
			copy /y .\compile_res "%%B\compile_res" >nul
			del "%%B\updater.bat"
			echo "%%B" updated!
		)
	)
)
