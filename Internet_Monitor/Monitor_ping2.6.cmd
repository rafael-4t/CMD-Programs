:: Programa para monitorar a estabilidade de internet
@echo off
ECHO =========================================>>D:\internet_log.txt
ECHO Iniciando em  %DATE%  as  %TIME%>>D:\internet_log.txt
ECHO =========================================>>D:\internet_log.txt

ECHO =========================================>> D:\internet_log_Hora.txt

:PARAMETROS
ECHO " De  %DATE% %TIME% :" >> D:\internet_log_Hora.txt
SET /A CONTADOR=0
SET /A ERRO=0

:BEGIN
PING -n 1 www.google.com

::Retire os "::" do inicio da linha seginte para armazenar os sucessos em conecção
::IF %ERRORLEVEL%==0 ECHO " %DATE% %TIME% | 1 = Sucesso " >> D:\internet_log.txt

IF %ERRORLEVEL%==1 (
ECHO " %DATE% %TIME% | 0 = Falha " >> D:\internet_log.txt
SET /A ERRO=%ERRO%+1 )

SET /A CONTADOR=%CONTADOR%+1
IF %CONTADOR%==30 (GOTO STATUS_HORA )

GOTO BEGIN

:STATUS_HORA
IF %ERRO%==0 (ECHO " Ate %DATE% %TIME% | Sem erros # ">> D:\internet_log_Hora.txt) ELSE (
ECHO " Ate %DATE% %TIME% | %ERRO% erros de %CONTADOR% ">> D:\internet_log_Hora.txt) 
GOTO PARAMETROS