@echo off
chcp 1251 >nul
set verfile=MANIFEST.MF
echo Manifest-Version: 1.0>>%verfile%
set str1=""
>nul chcp 866& set /p str1=¬ведите им€ пакета: 
chcp 1251 >nul
>nul chcp 866& set /p str2=¬ведите им€ главного класса: 
if %str1%=="" (
	echo Main-Class: %str2%>>%verfile%
) else (
	echo Main-Class: %str1%.%str2%>>%verfile%
)
(echo Program-Version: 0)>>%verfile%
chcp 1251 >nul
>nul chcp 866& set /p str3=¬ведите им€ разрабочика: 
echo Created-By: %str3%>>%verfile%
