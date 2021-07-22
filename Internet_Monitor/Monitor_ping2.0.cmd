@echo off
ECHO =========================================>>D:\internet_log.txt
ECHO Iniciando em  %DATE%  as  %TIME%>>D:\internet_log.txt
ECHO =========================================>>D:\internet_log.txt

:PARAMETROS
SET CONTADOR = 1
SET ERRO = 0

:BEGIN
PING -n 1 www.google.com

IF %ERRORLEVEL%==0 ECHO " %DATE% %TIME% | 1 = Sucesso " >> D:\internet_log.txt

IF %ERRORLEVEL%==1 (
ECHO " %DATE% %TIME% | 0 = Falha " >> D:\internet_log.txt
SET /A ERRO=%ERRO%+1 )

SET /A CONTADOR=%CONTADOR%+1
ECHO %CONTADOR%
ECHO %ERRO%
GOTO BEGIN