@echo off


set manifest=MANIFEST.MF
echo Manifest-Version: 1.0>>%manifest%
set str1=""
chcp 65001 >nul
>NUL chcp 866& set /p str1=Введите имя пакета:
chcp 65001 >nul 
>NUL chcp 866& set /p str2=Введите имя главного класса: 

if %str1%=="" (
	echo Main-Class: %str2%>>%manifest%
) else (
	echo Main-Class: %str1%.%str2%>>%manifest%
)
(echo Program-Version: 0)>>%manifest%
chcp 65001 >nul
>NUL chcp 866& set /p str3=Введите имя разрабочика: 
echo Created-By: %str3%>>%manifest%
