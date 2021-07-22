@echo off
ECHO =========================================>>D:\internet_log.txt
ECHO Iniciando em  %DATE%  as  %TIME%>>D:\internet_log.txt
ECHO =========================================>>D:\internet_log.txt

ECHO =========================================>> D:\internet_log_Hora.txt

SET CONTADOR = 1
SET ERRO = 1
SET TOTAL = 1

:PARAMETROS
ECHO " De  %DATE% %TIME% :" >> D:\internet_log_Hora.txt
SET /A CONTADOR=1
SET /A ERRO=1

:BEGIN
PING -n 1 www.google.com

IF %ERRORLEVEL%==0 ECHO " %DATE% %TIME% | 1 = Sucesso " >> D:\internet_log.txt

IF %ERRORLEVEL%==1 (
ECHO " %DATE% %TIME% | 0 = Falha " >> D:\internet_log.txt
SET /A ERRO=%ERRO%+1 )

SET /A CONTADOR=%CONTADOR%+1
ECHO %CONTADOR%
ECHO %TOTAL%
IF %CONTADOR%==10 (
GOTO STATUS_HORA )

GOTO BEGIN

:STATUS_HORA
SET /A TOTAL=%ERRO%/%CONTADOR%
ECHO " Ate %DATE% %TIME% | %TOTAL%% de falhas " >> D:\internet_log_Hora.txt
GOTO PARAMETROS