@echo off
cscript //nologo "LaunchGDrive.vbs"
start "" /max "C:\Users\User\AppData\Roaming\Resilio Sync\Resilio Sync.exe"
cscript //nologo "LaunchXodo.vbs"
exit /b
