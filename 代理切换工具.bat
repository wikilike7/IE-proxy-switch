@echo off
title �����л�����
echo 1 == ��۴���
echo 2 == ��½����
echo 3 == �޴���

set /p user_choose=��ѡ���Ӧ�����֣� 
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