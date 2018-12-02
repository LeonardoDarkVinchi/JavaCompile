@echo off
cls
echo Updater version: 0.2
for /d %%B in (..\*) do (
	if not %%B==..\JavaCompile (
		copy .\* "%%B\" >nul
		del %%B\updater.bat
		echo %%B updated!
	)
)
