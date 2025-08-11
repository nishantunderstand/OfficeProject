@echo off
start "" "C:\Program Files\LGHUB\system_tray\lghub_system_tray.exe"
REM start "" "shell:AppsFolder\5319275A.WhatsAppDesktop_cv1g1gvanyjgm!App"
cscript //nologo "LaunchWhatsApp.vbs"
cscript //nologo "LaunchGDrive.vbs"
start "" /max "C:\Users\User\AppData\Roaming\Resilio Sync\Resilio Sync.exe"
start "" /max "C:\Users\User\AppData\Local\Programs\Anki\anki.exe"
start "" /max "C:\Users\User\AppData\Local\Programs\Notion\Notion.exe"



echo This window will close in 15 Seconds....
timeout /t 15 >nul
exit