@echo off
@mode con cols=125 lines=13 
title IP logger flooder by baum#9149 and Scream#8781
color 04
:start
::: ___ _______    ___     _______ _______ _______ _______ ______      _______ ___     _______ _______ ______  _______ ______   
:::|   |       |  |   |   |       |       |       |       |    _ |    |       |   |   |       |       |      ||       |    _ |  
:::|   |    _  |  |   |   |   _   |    ___|    ___|    ___|   | ||    |    ___|   |   |   _   |   _   |  _    |    ___|   | ||  
:::|   |   |_| |  |   |   |  | |  |   | __|   | __|   |___|   |_||_   |   |___|   |   |  | |  |  | |  | | |   |   |___|   |_||_ 
:::|   |    ___|  |   |___|  |_|  |   ||  |   ||  |    ___|    __  |  |    ___|   |___|  |_|  |  |_|  | |_|   |    ___|    __  |
:::|   |   |      |       |       |   |_| |   |_| |   |___|   |  | |  |   |   |       |       |       |       |   |___|   |  | |
:::|___|___|      |_______|_______|_______|_______|_______|___|  |_|  |___|   |_______|_______|_______|______||_______|___|  |_|
for /f "delims=: tokens=*" %%A in ('findstr /b ::: "%~f0"') do @echo(%%A
echo.
echo 1) HTTP
echo 2) SOCKS 4
echo 3) SOCKS 5
echo 4) No proxy (Not recommended, spams the IP logger with your IP)
set /p type=Choose: 
set /p link=IP grabber Link: 
cls
if %type% == 1 goto http
if %type% == 2 goto socks4
if %type% == 3 goto socks5
if %type% == 4 goto noproxy
goto start
:http
for /f %%a in (proxys.txt) do curl %link% --proxy %%a --insecure
goto end
:socks4
for /f %%a in (proxys.txt) do curl %link% --socks4 %%a --insecure
goto end
:socks5
for /f %%a in (proxys.txt) do curl %link% --socks5 %%a --insecure
goto end
:noproxy
curl %link%
goto noproxy
:end
echo Successfully flooded
pause