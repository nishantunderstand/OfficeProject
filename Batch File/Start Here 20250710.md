@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ===============================
echo        Batch File Launcher
echo ===============================
echo 0 - Close All Windows
echo 1 - Active And Working
echo 2 - Clean Folder
echo 3 - Clean Photos
echo 4 - Disconnect Wifi
echo 5 - Obsidian Github Sync
echo 6 - Open Text File
echo 7 - Programming 1 Java
echo 8 - Programming 2 Scaler
echo 9 - Programming 3 Spring
echo 10 - Shallow Work-1
echo 11 - Shallow Work-2
echo 12 - Sync Everything
echo 13 - Read Ebook
echo 14 - Entertainment
echo 15 - Youtubde Download And Play
echo 16 - Notion And Study
echo ===============================

set /p choice="Enter your choice: "
echo.

goto choice_%choice% 2>nul || goto default

:default
echo Invalid choice or file not found.
pause
goto menu

:choice_0
cscript //nologo CloseWindows.vbs
exit


:choice_1
start "" /max "C:\Program Files\Google\Chrome\Application\chrome.exe"
cscript //nologo "C:\Users\User\Desktop\Batch File\LaunchChatGPT.vbs"
start "" /max "C:\Users\User\AppData\Local\Programs\Perplexity\Perplexity.exe"
start "" /max "C:\Users\User\eclipse\jee-2021-12\eclipse\eclipse.exe"
goto menu

:choice_2
call "Clean Folder.bat"
goto menu

:choice_3
call "Clean Photos.bat"
goto menu

:choice_4
call "Disconnect Wifi.bat"
goto menu

:choice_5
call "Obsidian Github Sync.bat"
goto menu

:choice_6
call "Open Text File.bat"
goto menu

:choice_7
call "Programming 1 Java.bat"
goto menu

:choice_8
call "Programming 2 Scaler.bat"
goto menu

:choice_9
call "Programming 3 Spring.bat"
goto menu

:choice_10
call "Shallow Work-1.bat"
goto menu

:choice_11
call "Shallow Work-2.bat"
goto menu

:choice_12
call "Sync Everything.bat"
goto menu

:choice_13
call "ReadEbookNew.bat"
goto menu

:choice_14
call "Entertainment.bat"
goto menu

:choice_15
call "Youtube-Video.bat"
goto menu


:choice_16
cscript //nologo "C:\Users\User\Desktop\Batch File\LaunchChatGPT.vbs"	 
cscript //nologo "C:\Users\User\Desktop\Batch File\LaunchXodo.vbs"
start "" /max "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"


