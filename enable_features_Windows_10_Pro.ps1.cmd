@echo off

SET lib=%~dp0
SET drive=%~d0

powershell.exe -noexit  -executionpolicy bypass "& '%lib%enable_features_Windows_10_Pro.ps1'"

pause
