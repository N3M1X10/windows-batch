@echo off
chcp 65001>nul
setlocal

:: Restart with Admin Rights
set "arg=%1"
if "%arg%" == "admin" (
    echo ! Restarted with admin rights
) else (
    powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/k \"\"%~f0\" admin\"' -Verb RunAs"
    exit
)

set reg_bash=HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
set key_name=EnableLUA
set value=1

:uac_check
reg query "%reg_bash%" /v "%key_name%" | findstr /c:"0x0">nul || set hasEnabled=1
if "%hasEnabled%"=="1" goto :already_set
goto :uac_reg_apply

:already_set
echo.&echo [93mUAC Already Enabled
goto :end

:uac_reg_apply
echo.&REG ADD %reg_bash% /v %key_name% /t REG_DWORD /d %value% /f
IF %ERRORLEVEL% NEQ 0 (echo [31mSomething went wrong & goto end) else (echo [92mUser Account Control has restored!)

echo [0m&echo Registry bash: "%reg_bash%"
echo Registry key "%key_name%" is set on "%value%"

echo.&echo [33mNow you need to restart the system![0m

:restart
echo.&choice /C 10 /M "[93m[ Restart System ] Are you sure ?"
if errorlevel 2 goto :end
>nul shutdown -r -t 1
endlocal&exit

:end
echo.&echo [96mNo more action will be taken
echo Press any key to exit[0m
endlocal&pause>nul&exit
