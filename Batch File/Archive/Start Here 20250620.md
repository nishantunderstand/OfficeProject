@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ===============================
echo        Batch File Launcher
echo ===============================
echo 0 - Exit
echo 1 - Clean Folder
echo 2 - Clean Photos
echo 3 - Disconnect Wifi
echo 4 - Obsidian Github Sync
echo 5 - Open Text File
echo 6 - Programming 1 Java
echo 7 - Programming 2 Scaler SQL
echo 8 - Programming 3 Spring
echo 9 - Shallow Work-1
echo 10 - Shallow Work-2
echo 11 - Sync Everything
echo 12 - Read Ebook
echo ===============================

set /p choice="Enter your choice: "
echo.

if "%choice%"=="0" exit
if "%choice%"=="1" call "Clean Folder.bat" & goto menu
if "%choice%"=="2" call "Clean Photos.bat" & goto menu
if "%choice%"=="3" call "Disconnect Wifi.bat" & goto menu
if "%choice%"=="4" call "Obsidian Github Sync.bat" & goto menu
if "%choice%"=="5" call "Open Text File.bat" & goto menu
if "%choice%"=="6" call "Programming 1 Java.bat" & goto menu
if "%choice%"=="7" call "Programming 2 Scaler SQL.bat" & goto menu
if "%choice%"=="8" call "Programming 3 Spring.bat" & goto menu
if "%choice%"=="9" call "Shallow Work-1.bat" & goto menu
if "%choice%"=="10" call "Shallow Work-2.bat" & goto menu
if "%choice%"=="11" call "Sync Everything.bat" & goto menu
if "%choice%"=="12" call "Read Ebook.bat" & goto menu

echo Invalid choice or file not found.
pause
goto menu
