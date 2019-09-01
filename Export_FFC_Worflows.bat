::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
:: FreeFlow Core Backup Script
::
:: Note:
:: You may need to run this script as Administrator
:: Configure the backup directory
:: Automate this script by setting it as the target of a Windows Scheduled Task
::
:: @copyright     Copyright FujiXeroxAustralia Professional Services
:: @link          https://github.com/fxaps/FreeFlowCoreScripts
:: @version       1.0.1
:: @author        Andrew.Rajcany@aus.fujixerox.com
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::



@echo off
echo About to Backup FFC Workflows...
echo.
echo.

REM DEFINE THE FILE PATH FOR THE BACKUP
set backupfilepath=c:\tmp\

REM CREATE UNIQUE DATETIME STRING IN FORMAT YYYYMMDD-HHMMSS
FOR /f %%a IN ('WMIC OS GET LocalDateTime ^| FIND "."') DO SET DTS=%%a
SET DateTime=%DTS:~0,8%_%DTS:~8,6%

REM DEFINE THE FILE NAME FOR THE BACKUP
set backupfilename=%DateTime%_FreeFlowCore_Backup.ffc
set backupfullpath=%backupfilepath%%backupfilename%

REM PERFORM THE BACKUP
echo %backupfullpath%
"%FF_CORE_HOME%CoreExchange.exe" /e "%backupfullpath%" /clone /r 2>&1 "%backupfullpath%.txt"
echo.
echo.

