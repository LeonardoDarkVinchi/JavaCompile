@echo off
cls
echo Updater version: 0.3
for /d %%B in (..\*) do (
	if not %%B==..\JavaCompile (
		if exist %%B\*.java (
			copy .\* "%%B\" >nul
			del %%B\updater.bat
			echo %%B updated!
		)
	)
)
