@echo off
title 代理切换工具
echo 1 == 香港代理
echo 2 == 大陆代理
echo 3 == 无代理

set /p user_choose=请选择对应的数字： 
if "%user_choose%"=="1" goto hk_proxy
if "%user_choose%"=="2" goto china_proxy
if "%user_choose%"=="3" goto no_proxy

:hk_proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "172.29.225.90:8080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "172.*;rechwebportal;<local>" /f
pause
exit

:china_proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyServer /t REG_SZ /d "172.28.15.24:8080" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyOverride /t REG_SZ /d "172.*;rechwebportal;<local>" /f
pause
exit

:no_proxy
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Internet Settings" /v ProxyEnable /t REG_DWORD /d 0 /f
pause
exit