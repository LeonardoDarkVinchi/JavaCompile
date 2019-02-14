echo off
cls
echo Compiler version: 4.1.4
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

rem Список изменений
rem 4.1.4
rem Исправленна ошибка из-за которой echo off игнорировался
rem 4.1.3
rem Фикс с русскими символами. Конвертированы файлы compiler.bat
rem и make_package.bat в UTF-8
rem 4.1.2
rem Фикс удаления файлов классов. Теперь прежде чем удалить, 
rem сначала проверяет их наличие. 
rem 4.1.1
rem Небольшое изменение списка изменений. Теперь в обратном порядке!
rem 4.1
rem Убрана лишняя проверка из updater.bat
rem Исправлена ошибка, связанная с компиляцией классов
rem Теперь, если главный класс не скомпилирован, то сборка проекта 
rem не продолжится, а произойдет откат до предыдущей рабочей версии
rem (готовых решений, исходники никак не затрагиваются)
rem 4.0
rem Глобальное улучшение производительности. 
rem Выделен модуль tmp_class_name_finder который находит имя пакета и 
rem главного класса из метафайла, а затем выносит каждый в отдельный файл. 
rem Также модуль удаляет эти временные файлы, если его вызвать с параметром 2.
rem Переработаны все остальные модули под нововведение. 
rem 3.6
rem Улучшен make_package.bat и jar_creator.bat
rem В них добавлены функции позволяющие собирать ресурсы из корня директории
rem там же где лежат и исходники.
rem олсо добавлена проверка на пустые папки img и audio
rem 3.5 
rem исправлен updater.bat (не копировал файлы из папки compile_res)
rem 3.4 
rem Улучшен updater.bat (добавлена защита от копирования в папки без
rem исходников)
rem 3.3
rem Добавлен updater.bat для массового копирования новой версии
rem компилятора в папки проектов. Для этого папки проектов должны быть
rem на уровне папки компилятора. 
rem 3.2
rem добавлены обработчики для папок img и audio
rem чтобы при сборке jar не возникало уведомлений. 
rem 3.1
rem Доработан make_package (ресурсы теперь загружаются правильно)
rem Соответственно доработан архиватор (также по теме ресурсов)
rem 3.0
rem Полностью переработан компилятор
rem Теперь он учитывает пакетирование 1-ой итерации
rem 2.1
rem Добавлено изготовление стартера
rem 2.0 
rem Добавление сохранения для ранее скомпилированных классов 
rem в случае некорректного кода. 
rem 1.2
rem Добавлен создатель manifest 
rem Переработан архиатор jar
rem 1.1
rem Добавлена функция архивирования в jar
rem 1.0 
rem первый простой компилятор.