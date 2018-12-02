@echo off
cls
echo Compiler version: 3.3
md tmp >nul
if exist *.class move *.class tmp\ >nul
javac *.java
if exist *.class (
	if not exist MANIFEST.MF call compile_res\manifest_creator.bat
	if not exist starter.bat call compile_res\starter_creator.bat
	call compile_res\version_changer.bat
	call compile_res\make_package.bat
	call compile_res\jar_creator.bat
	echo Work is done
) else (
	echo You do it wrong. You`re awful man!
	move tmp\*.* .\ >nul
)
del /S /F /Q tmp\ >nul
rd tmp >nul

rem Список изменений
rem 1.0 
rem первый простой компилятор
rem 1.1
rem Добавлена функция архивирования в jar
rem 1.2
rem Добавлен создатель manifest 
rem Переработан архиатор jar
rem 2.0 
rem Добавление сохранения для ранее скомпилированных классов 
rem в случае некорректного кода. 
rem 2.1
rem Добавлено изготовление стартера
rem 3.0
rem Полностью переработан компилятор
rem Теперь он учитывает пакетирование 1-ой итерации
rem 3.1
rem Доработан make_package (ресурсы теперь загружаются правильно)
rem Соответственно доработан архиватор (также по теме ресурсов)
rem 3.2
rem добавлены обработчики для папок img и audio
rem чтобы при сборке jar не возникало уведомлений. 
rem 3.3
rem Добавлен updater.bat для массового копирования новой версии
rem компилятора в папки проектов. Для этого папки проектов должны быть
rem на уровне папки компилятора. 
rem  
rem  
rem  
rem  
rem  
rem  
rem  
rem  