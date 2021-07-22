@echo off
ECHO =========================================>>D:\internet_log.txt
ECHO Iniciando em  %DATE%  as  %TIME%>>D:\internet_log.txt
ECHO =========================================>>D:\internet_log.txt
:BEGIN
PING -n 5 www.google.com
IF %ERRORLEVEL%==0 ECHO " %DATE% %TIME% | 1 = Sucesso " >> D:\internet_log.txt
IF %ERRORLEVEL%==1 ECHO " %DATE% %TIME% | 0 = Falha " >> D:\internet_log.txt
GOTO BEGIN