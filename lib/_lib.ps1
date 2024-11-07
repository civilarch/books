# ---------------------------------------- 
# sf   : C:\_etc\win\ps1\lib\_lib.ps1
# Time : Wednesday July 10, 2024 11:46:39
# ---------------------------------------- 
# ---------------------------------------- 
# ------------------ 1






# ------------------ 2






# ------------------ 3

Windows Registry Editor Version 5.00

[HKEY_CURRENT_USER\Environment]
"Path"=hex(2):25,00,55,00,53,00,45,00,52,00,50,00,52,00,4f,00,46,00,49,00,4c,\
  00,45,00,25,00,5c,00,41,00,70,00,70,00,44,00,61,00,74,00,61,00,5c,00,4c,00,\
  6f,00,63,00,61,00,6c,00,5c,00,4d,00,69,00,63,00,72,00,6f,00,73,00,6f,00,66,\
  00,74,00,5c,00,57,00,69,00,6e,00,64,00,6f,00,77,00,73,00,41,00,70,00,70,00,\
  73,00,3b,00,00,00
"TEMP"=hex(2):25,00,55,00,53,00,45,00,52,00,50,00,52,00,4f,00,46,00,49,00,4c,\
  00,45,00,25,00,5c,00,41,00,70,00,70,00,44,00,61,00,74,00,61,00,5c,00,4c,00,\
  6f,00,63,00,61,00,6c,00,5c,00,54,00,65,00,6d,00,70,00,00,00
"TMP"=hex(2):25,00,55,00,53,00,45,00,52,00,50,00,52,00,4f,00,46,00,49,00,4c,00,\
  45,00,25,00,5c,00,41,00,70,00,70,00,44,00,61,00,74,00,61,00,5c,00,4c,00,6f,\
  00,63,00,61,00,6c,00,5c,00,54,00,65,00,6d,00,70,00,00,00
"sd_posix"="C:\\_usr\\pos"
"CMDER_ROOT"="C:\\_usr\\pos\\cmder"
"GIT_INSTALL_ROOT"="C:\\_usr\\pos\\git"
"MSYS2_ROOT"="C:\\_usr\\pos\\msys64"
"MSYS_ROOT"="C:\\_usr\\pos\\msys64"

New-Item -Path "Registry::HKCU\Environment" -ErrorAction SilentlyContinue | Out-Null
Set-ItemProperty -Path "Registry::HKCU\Environment" -Name "Path" -Type expandstring -Value %USERPROFILE%\AppData\Local\Microsoft\WindowsApps;
Set-ItemProperty -Path "Registry::HKCU\Environment" -Name "TEMP" -Type expandstring -Value %USERPROFILE%\AppData\Local\Temp
Set-ItemProperty -Path "Registry::HKCU\Environment" -Name "TMP" -Type expandstring -Value %USERPROFILE%\AppData\Local\Temp
Set-ItemProperty -Path "Registry::HKCU\Environment" -Name "sd_posix" -Type string -Value "C:\_usr\pos"
Set-ItemProperty -Path "Registry::HKCU\Environment" -Name "CMDER_ROOT" -Type string -Value "C:\_usr\pos\cmder"
Set-ItemProperty -Path "Registry::HKCU\Environment" -Name "GIT_INSTALL_ROOT" -Type string -Value "C:\_usr\pos\git"
Set-ItemProperty -Path "Registry::HKCU\Environment" -Name "MSYS2_ROOT" -Type string -Value "C:\_usr\pos\msys64"
Set-ItemProperty -Path "Registry::HKCU\Environment" -Name "MSYS_ROOT" -Type string -Value "C:\_usr\pos\msys64"


# ------------------ 4






# ------------------ 5





