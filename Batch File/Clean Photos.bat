@echo off
echo Killing all instances of Microsoft Photos...

:: Try taskkill
taskkill /F /IM Photos.exe >nul 2>&1

:: Check if Photos.exe still running
tasklist /FI "IMAGENAME eq Photos.exe" | find /I "Photos.exe" >nul
if %ERRORLEVEL%==0 (
    echo Taskkill failed. Attempting PowerShell force stop...

    powershell -Command "Get-Process Photos -ErrorAction SilentlyContinue | Stop-Process -Force"

    :: Re-check
    tasklist /FI "IMAGENAME eq Photos.exe" | find /I "Photos.exe" >nul
    if %ERRORLEVEL%==0 (
        echo ERROR: Unable to kill Microsoft Photos.
    ) else (
        echo Successfully killed Microsoft Photos via PowerShell.
    )
) else (
    echo Successfully killed Microsoft Photos via taskkill.
)

exit
