@echo off
setlocal enabledelayedexpansion

:: Display menu
cls
echo ===============================
echo        Batch File Launcher
echo ===============================
echo 0  - Close All Windows
echo 1  - FAQ
echo 2  - Active And Working
echo 3  - Clean Folder
echo 4  - Notion And Study
echo 5  - Programming 1 Java
echo 6  - Programming 2 Scaler
echo 7  - Programming 3 Spring
echo 8  - Read Ebook
echo 9  - Entertainment
echo 10 - Sync Everything
echo 11 - YouTube Download And Play
echo 12 - Clean Photos
echo 13 - Disconnect Wifi
echo 14 - Obsidian Github Sync
echo 15 - Open Text File
echo 16 - Shallow Work-1
echo 17 - Shallow Work-2
echo 18 - WhatsApp Automation

echo ===============================

:: Get user input
set /p choice="Enter your choice: "
echo.

:: Run corresponding task or show error
goto choice_%choice% 2>nul || goto default


:: =============================
:: DEFAULT / ERROR HANDLING
:: =============================
:default
echo Invalid choice or file not found.
timeout /t 2 >nul
exit /b


:: =============================
:: MENU CHOICE HANDLERS
:: =============================

:: [0] Close all open windows
:choice_0
cscript //nologo CloseWindows.vbs
echo Closed all windows.
timeout /t 2 >nul
exit /b


:: [1] FAQ Tools
:choice_1
echo Launching FAQ Environment...
cscript //nologo "C:\Users\User\Desktop\Batch File\LaunchChatGPT.vbs"
start "" /max "C:\Users\User\AppData\Local\Programs\Perplexity\Perplexity.exe"
cscript //nologo "C:\Users\User\Desktop\Batch File\LaunchAlarm.vbs"
start "" /max "C:\Program Files\Beeftext\Beeftext.exe"
start "" /max "C:\Program Files\LGHUB\system_tray\lghub_system_tray.exe"
echo FAQ tools launched.
timeout /t 2 >nul
exit /b


:: [2] Active And Working
:choice_2
echo Launching Active And Working Environment...
start "" /max "C:\Program Files\Google\Chrome\Application\chrome.exe"
cscript //nologo "C:\Users\User\Desktop\Batch File\LaunchChatGPT.vbs"
start "" /max "C:\Users\User\AppData\Local\Programs\Perplexity\Perplexity.exe"
start "" /max "C:\Users\User\eclipse\jee-2021-12\eclipse\eclipse.exe"
echo Development environment started.
timeout /t 2 >nul
exit /b


:: [3] Clean Folder
:choice_3
echo Cleaning up files in folder...
call "Clean Folder.bat"
echo Folder cleanup complete.
timeout /t 2 >nul
exit /b


:: [4] Notion And Study
:choice_4
echo Launching Notion & Study Tools...
::cscript //nologo "C:\Users\User\Desktop\Batch File\LaunchChatGPT.vbs"	 
::cscript //nologo "C:\Users\User\Desktop\Batch File\LaunchXodo.vbs"
start "" /max "C:\Program Files\Beeftext\Beeftext.exe"
start "" /max "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
start "" /max "C:\Program Files\Microsoft VS Code\Code.exe"
echo Study tools opened.
timeout /t 2 >nul
exit /b


:: [5] Programming 1 Java
:choice_5
echo Launching Java Programming Environment...
call "Programming 1 Java.bat"
echo Java setup complete.
timeout /t 2 >nul
exit /b


:: [6] Programming 2 Scaler
:choice_6
echo Launching Scaler Programming Environment...
call "Programming 2 Scaler.bat"
echo Scaler session started.
timeout /t 2 >nul
exit /b


:: [7] Programming 3 Spring
:choice_7
echo Launching Spring Programming Environment...
call "Programming 3 Spring.bat"
echo Spring tools launched.
timeout /t 2 >nul
exit /b


:: [8] Read Ebook
:choice_8
echo Opening Ebook Reader...
call "ReadEbookNew.bat"
echo Ebook ready.
timeout /t 2 >nul
exit /b


:: [9] Entertainment
:choice_9
echo Launching Entertainment Mode...
call "Entertainment.bat"
echo Entertainment apps started.
timeout /t 2 >nul
exit /b


:: [10] Sync Everything
:choice_10
echo Syncing Everything...
call "Sync Everything.bat"
echo All systems synchronized.
timeout /t 2 >nul
exit /b


:: [11] YouTube Download And Play
:choice_11
echo Downloading and Playing YouTube Video...
call "Youtube-Video.bat"
echo Video playback complete.
timeout /t 2 >nul
exit /b


:: [12] Clean Photos
:choice_12
echo Cleaning Photos folder...
call "Clean Photos.bat"
echo Photos organized.
timeout /t 2 >nul
exit /b


:: [13] Disconnect Wifi
:choice_13
echo Disconnecting WiFi...
call "Disconnect Wifi.bat"
echo WiFi disconnected.
timeout /t 2 >nul
exit /b


:: [14] Obsidian Github Sync
:choice_14
echo Syncing Obsidian with GitHub...
call "Obsidian Github Sync.bat"
echo GitHub sync complete.
timeout /t 2 >nul
exit /b


:: [15] Open Text File
:choice_15
echo Opening Text File...
call "Open Text File.bat"
echo Text file opened.
timeout /t 2 >nul
exit /b


:: [16] Shallow Work-1
:choice_16
echo Starting Shallow Work Session 1...
call "Shallow Work-1.bat"
echo Shallow Work-1 completed.
timeout /t 2 >nul
exit /b


:: [17] Shallow Work-2
:choice_17
echo Starting Shallow Work Session 2...
call "Shallow Work-2.bat"
echo Shallow Work-2 completed.
timeout /t 2 >nul
exit /b


:: [18] WhatsApp Automation
:choice_18
echo Starting WhatsApp Automation...
call "WhatsAppByScript.bat"
echo WhatsApp Automation completed.
timeout /t 2 >nul
exit /b
