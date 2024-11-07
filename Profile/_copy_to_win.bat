::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Automatically Check & Get Admin Rights V2 elem_admin
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
net session>nul 2>&1
if %errorlevel%==0 goto main
echo CreateObject("Shell.Application").ShellExecute "%~f0", "", "", "runas">"%temp%/elevate.vbs"
"%temp%/elevate.vbs"
del "%temp%/elevate.vbs"
exit

:main
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Automatically Check & Get Admin Rights V2 END
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::


@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
:: ---------------------------------------- 
:: ------------- vars
SET cfd=%~dp0%
SET cfd=%cfd:~0,-1%
ECHO.  ---- cfd    : %cfd%

SET cwd=%cd%
ECHO.  ---- cwd    : %cwd%
CD /d %cfd%
SET cwd=%cd%
ECHO.  ---- cwd    : %cwd%

				ECHO.& ECHO.& PAUSE 
:: ------------- user input


@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION ENABLEEXTENSIONS
:: ---------------------------------------- 


ECHO   %~d0\Windows\System32\WindowsPowerShell\v1.0\
copy   .\Profile.ps1  %~d0\Windows\System32\WindowsPowerShell\v1.0\



:: copy "C:\_etc\win\ps1\Profile\_copy_to_win.bat" C:\Windows\System32\WindowsPowerShell\v1.0\
:: %~d0


ECHO.& PAUSE& EXIT /B










