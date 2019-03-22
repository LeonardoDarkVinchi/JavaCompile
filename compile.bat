@echo off
cls
echo Compiler version: 4.3
md tmp >nul
if exist *.class move *.class tmp\ >nul
if not exist MANIFEST.MF call compile_res\manifest_creator.bat
call compile_res\tmp_class_name_finder.bat 1
set /p mainclass=< classname.tmp
javac *.java
if exist %mainclass%.class (
	if not exist starter.bat call compile_res\starter_creator.bat
	call compile_res\version_changer.bat
	call compile_res\make_package.bat
	call compile_res\jar_creator.bat
	echo Work is done
) else (
	echo You do it wrong. You`re awful man!
	if exist *.class del /S /F /Q *.class >nul
	move tmp\*.* .\ >nul
)
call compile_res\tmp_class_name_finder.bat 2
del /S /F /Q tmp\ >nul
rd tmp >nul