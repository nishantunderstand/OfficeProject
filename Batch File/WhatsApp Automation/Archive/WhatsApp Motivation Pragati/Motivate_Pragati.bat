@echo off
setlocal

:: Set file paths
set "outputFile=%~dp0Motivation.txt"
set "tempFile=%~dp0tmp_quote.json"

:: Fetch quote from API
curl -s https://zenquotes.io/api/random > "%tempFile%"

:: Extract quote and overwrite Motivation.txt
powershell -NoProfile -Command ^
  "$q = Get-Content -Raw '%tempFile%' | ConvertFrom-Json; Set-Content -Path '%outputFile%' -Value $q[0].q"

:: Clean up
del "%tempFile%"

echo Quote saved (previous content cleared) to %outputFile%

:: Open the file in VS Code
:: start "" "C:\Users\User\AppData\Local\Programs\Microsoft VS Code\Code.exe" "%outputFile%"


:: Wait for 10 seconds
:: timeout /t 10 /nobreak >nul

echo ============================
echo Running WhatsApp Message Automation
echo ============================

:: Run the Python automation script
python MotivatePragati.py

exit