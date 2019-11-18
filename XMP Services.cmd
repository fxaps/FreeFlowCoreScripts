@echo off
setlocal


echo Please select an Action...
echo 1. Stop All XMPie Services
echo 2. Start All XMPie Services
echo 3. Restart All XMPie Services
echo 4. ---NA---
echo 5. ---NA---
echo 6. ---NA---
echo 7. ---NA---
echo 8. ---NA---
echo 9. ---NA---


@CHOICE /C:123456789 /N /M "Press a number..."
IF ERRORLEVEL 9 GOTO end
IF ERRORLEVEL 8 GOTO end
IF ERRORLEVEL 7 GOTO end
IF ERRORLEVEL 6 GOTO end
IF ERRORLEVEL 5 GOTO end
IF ERRORLEVEL 4 GOTO end
IF ERRORLEVEL 3 GOTO restart
IF ERRORLEVEL 2 GOTO start
IF ERRORLEVEL 1 GOTO stop
GOTO end


:stop
echo Stopping Services...
NET STOP "XMPServiceCloudGateway" /y
NET STOP "XMPServiceCOPY" /y
NET STOP "XMPServiceDSTL" /y
NET STOP "XMPServiceEmail" /y
NET STOP "XMPServiceFTP" /y
NET STOP "XMPServiceHTML" /y
NET STOP "XMPServiceICP" /y
NET STOP "XMPServiceICPAsynch" /y
NET STOP "XMPServiceIMPOS" /y
NET STOP "XMPServiceJDF" /y
NET STOP "XMPServiceJOBREPORT" /y
NET STOP "XMPServicePRINT" /y
NET STOP "XMPServicePROOFSET" /y
NET STOP "XMPServiceQueueMgr" /y
NET STOP "XMPServiceRIP2Image" /y
NET STOP "XMPServiceSCHEDULER" /y
NET STOP "XMPServiceTRACKING" /y
NET STOP "XMPServiceTracking2Cloud" /y
NET STOP "XMPServiceVIPP" /y
NET STOP "XMPServiceXLIM" /y
NET STOP "XMPServiceZIP" /y
NET STOP "uStore.TaskScheduler" /y
NET STOP "uStore.OfficeService" /y
NET STOP "uStore.AceService" /y
GOTO end

:start
NET START "XMPServiceCloudGateway" /y
NET START "XMPServiceCOPY" /y
NET START "XMPServiceDSTL" /y
NET START "XMPServiceEmail" /y
NET START "XMPServiceFTP" /y
NET START "XMPServiceHTML" /y
NET START "XMPServiceICP" /y
NET START "XMPServiceICPAsynch" /y
NET START "XMPServiceIMPOS" /y
NET START "XMPServiceJDF" /y
NET START "XMPServiceJOBREPORT" /y
NET START "XMPServicePRINT" /y
NET START "XMPServicePROOFSET" /y
NET START "XMPServiceQueueMgr" /y
NET START "XMPServiceRIP2Image" /y
NET START "XMPServiceSCHEDULER" /y
NET START "XMPServiceTRACKING" /y
NET START "XMPServiceTracking2Cloud" /y
NET START "XMPServiceVIPP" /y
NET START "XMPServiceXLIM" /y
NET START "XMPServiceZIP" /y
NET START "uStore.TaskScheduler" /y
NET START "uStore.OfficeService" /y
NET START "uStore.AceService" /y
GOTO end

:restart
echo Stopping Services...
NET STOP "XMPServiceCloudGateway" /y
NET STOP "XMPServiceCOPY" /y
NET STOP "XMPServiceDSTL" /y
NET STOP "XMPServiceEmail" /y
NET STOP "XMPServiceFTP" /y
NET STOP "XMPServiceHTML" /y
NET STOP "XMPServiceICP" /y
NET STOP "XMPServiceICPAsynch" /y
NET STOP "XMPServiceIMPOS" /y
NET STOP "XMPServiceJDF" /y
NET STOP "XMPServiceJOBREPORT" /y
NET STOP "XMPServicePRINT" /y
NET STOP "XMPServicePROOFSET" /y
NET STOP "XMPServiceQueueMgr" /y
NET STOP "XMPServiceRIP2Image" /y
NET STOP "XMPServiceSCHEDULER" /y
NET STOP "XMPServiceTRACKING" /y
NET STOP "XMPServiceTracking2Cloud" /y
NET STOP "XMPServiceVIPP" /y
NET STOP "XMPServiceXLIM" /y
NET STOP "XMPServiceZIP" /y
NET STOP "uStore.TaskScheduler" /y
NET STOP "uStore.OfficeService" /y
NET STOP "uStore.AceService" /y

echo Starting Services...
NET START "XMPServiceCloudGateway" /y
NET START "XMPServiceCOPY" /y
NET START "XMPServiceDSTL" /y
NET START "XMPServiceEmail" /y
NET START "XMPServiceFTP" /y
NET START "XMPServiceHTML" /y
NET START "XMPServiceICP" /y
NET START "XMPServiceICPAsynch" /y
NET START "XMPServiceIMPOS" /y
NET START "XMPServiceJDF" /y
NET START "XMPServiceJOBREPORT" /y
NET START "XMPServicePRINT" /y
NET START "XMPServicePROOFSET" /y
NET START "XMPServiceQueueMgr" /y
NET START "XMPServiceRIP2Image" /y
NET START "XMPServiceSCHEDULER" /y
NET START "XMPServiceTRACKING" /y
NET START "XMPServiceTracking2Cloud" /y
NET START "XMPServiceVIPP" /y
NET START "XMPServiceXLIM" /y
NET START "XMPServiceZIP" /y
NET START "uStore.TaskScheduler" /y
NET START "uStore.OfficeService" /y
NET START "uStore.AceService" /y
GOTO end

:four
GOTO end

:five
GOTO end

:six
GOTO end

:seven
GOTO end

:eight
GOTO end

:nine
GOTO end

:end
echo Done!
pause
