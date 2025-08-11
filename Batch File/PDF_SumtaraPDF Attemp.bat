@echo off
:: Open Default Apps by File Type page
start ms-settings:defaultapps

:: Wait for the Settings window to open
timeout /t 2 >nul

:: Send ".pdf" as keystrokes
powershell -NoProfile -Command "Add-Type -AssemblyName System.Windows.Forms; [System.Windows.Forms.SendKeys]::SendWait('.pdf')"