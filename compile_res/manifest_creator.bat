@echo off
chcp 1251 >nul
set verfile=MANIFEST.MF
echo Manifest-Version: 1.0>>%verfile%
set str1=""
>nul chcp 866& set /p str1=������� ��� ������: 
chcp 1251 >nul
>nul chcp 866& set /p str2=������� ��� �������� ������: 
if %str1%=="" (
	echo Main-Class: %str2%>>%verfile%
) else (
	echo Main-Class: %str1%.%str2%>>%verfile%
)
(echo Program-Version: 0)>>%verfile%
chcp 1251 >nul
>nul chcp 866& set /p str3=������� ��� �����������: 
echo Created-By: %str3%>>%verfile%
