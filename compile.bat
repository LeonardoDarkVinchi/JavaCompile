@echo off
cls
echo Compiler version: 4.0
md tmp >nul
if exist *.class move *.class tmp\ >nul
javac *.java
if exist *.class (
	if not exist MANIFEST.MF call compile_res\manifest_creator.bat
	call compile_res\tmp_class_name_finder.bat 1
	if not exist starter.bat call compile_res\starter_creator.bat
	call compile_res\version_changer.bat
	call compile_res\make_package.bat
	call compile_res\jar_creator.bat
	call compile_res\tmp_class_name_finder.bat 2
	echo Work is done
) else (
	echo You do it wrong. You`re awful man!
	move tmp\*.* .\ >nul
)
del /S /F /Q tmp\ >nul
rd tmp >nul

rem ������ ���������
rem 1.0 
rem ������ ������� ����������
rem 1.1
rem ��������� ������� ������������� � jar
rem 1.2
rem �������� ��������� manifest 
rem ����������� �������� jar
rem 2.0 
rem ���������� ���������� ��� ����� ���������������� ������� 
rem � ������ ������������� ����. 
rem 2.1
rem ��������� ������������ ��������
rem 3.0
rem ��������� ����������� ����������
rem ������ �� ��������� ������������� 1-�� ��������
rem 3.1
rem ��������� make_package (������� ������ ����������� ���������)
rem �������������� ��������� ��������� (����� �� ���� ��������)
rem 3.2
rem ��������� ����������� ��� ����� img � audio
rem ����� ��� ������ jar �� ��������� �����������. 
rem 3.3
rem �������� updater.bat ��� ��������� ����������� ����� ������
rem ����������� � ����� ��������. ��� ����� ����� �������� ������ ����
rem �� ������ ����� �����������. 
rem 3.4 
rem ������� updater.bat (��������� ������ �� ����������� � ����� ���
rem ����������)
rem 3.5 
rem ��������� updater.bat (�� ��������� ����� �� ����� compile_res)
rem 3.6
rem ������� make_package.bat � jar_creator.bat
rem � ��� ��������� ������� ����������� �������� ������� �� ����� ����������
rem ��� �� ��� ����� � ���������.
rem ���� ��������� �������� �� ������ ����� img � audio
rem 4.0
rem ���������� ��������� ������������������. 
rem ������� ������ tmp_class_name_finder ������� ������� ��� ������ � 
rem �������� ������ �� ���������, � ����� ������� ������ � ��������� ����. 
rem ����� ������ ������� ��� ��������� �����, ���� ��� ������� � ���������� 2.
rem ������������ ��� ��������� ������ ��� ������������. 
rem 
rem 
rem 