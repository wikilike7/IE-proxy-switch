@echo off
title IE Proxy Switch Tool
rem COLOR 97
echo 1. HK Proxy 
echo 2. China Proxy
echo 3. No Proxy

rem Get user choose and jump to corresponding code
set /p user_choose=Enter the corresponding number and press Enter to complete switch:  
if "%user_choose%"=="1" goto hk_proxy
if "%user_choose%"=="2" goto china_proxy
if "%user_choose%"=="3" goto no_proxy

:hk_proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "172.29.225.90:8080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "172.*;rechwebportal;<local>" /f
exit

:china_proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "172.28.15.24:8080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "172.*;rechwebportal;<local>" /f
exit

:no_proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
exit