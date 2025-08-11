@echo off
cd /d "%~dp0"

echo ============================
echo Running WhatsApp Message Automation
echo ============================

:: Call Python script
python B1.py

timeout /t 10
exit