@echo off
chcp 65001>nul
title net-reset-extended
setlocal

set "arg=%1"
if "%arg%" == "admin" (
    echo ! Restarted with admin rights
) else (
    powershell -Command "Start-Process 'cmd.exe' -ArgumentList '/k \"\"%~f0\" admin\"' -Verb RunAs"
    exit
)
echo.

:: base reset
echo NETSH WINSOCK RESET
netsh winsock reset
echo NETSH INT IP RESET
netsh int ip reset
echo IPCONFIG IPV4
ipconfig /release
ipconfig /renew

:: extended reset
echo RENEW EL
ipconfig /renew EL
echo IPCONFIG IPV6
ipconfig /release6
ipconfig /renew6

:: dns reset
echo IPCONFIG FLUSHDNS
ipconfig /flushdns
echo IPCONFIG REGDNS
ipconfig /registerdns

echo.&echo All operations has complete !
echo Press any key to exit . . .
timeout /t 2 &endlocal&exit
