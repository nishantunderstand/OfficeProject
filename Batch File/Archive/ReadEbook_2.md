@echo off
echo Launching Read Ebook Environment...

REM ✅ Start Google Drive (File Stream)
start "" /max "C:\Program Files\Google\Drive File Stream\109.0.3.0\GoogleDriveFS.exe"
cscript //nologo "LaunchGDrive.vbs"

REM ⏱️ Wait a bit to prevent launch overlap
timeout /t 2 >nul

REM ✅ Start Resilio Sync
start "" /max "C:\Users\User\AppData\Roaming\Resilio Sync\Resilio Sync.exe"

REM ⏱️ Wait a bit to prevent launch overlap
timeout /t 2 >nul


REM ✅ Launch Xodo using explorer (safe for UWP)
REM start "" "shell:AppsFolder\5E8FC25E.XODODOCS_3v3sf0k6w2rec!App"

REM Approach 2
REM powershell -windowstyle hidden -command "Start-Process 'shell:AppsFolder\5E8FC25E.XODODOCS_3v3sf0k6w2rec!App'"


powershell -windowstyle hidden -command "Start-Process explorer 'shell:AppsFolder\5E8FC25E.XODODOCS_3v3sf0k6w2rec!App'"



exit /b
