@echo off
cd /d "%~dp0"

echo Starting Background Apps...
start "" /max "C:\Program Files\LGHUB\system_tray\lghub_system_tray.exe"
start "" /max "C:\Program Files\Beeftext\Beeftext.exe"
start ms-settings:bluetooth

echo.

:: =============================
:: === Launch Chrome URLs ===
:: =============================

set "chromePath=C:\Program Files\Google\Chrome\Application\chrome.exe"

:: Check if Chrome exists
if not exist "%chromePath%" (
    echo Chrome not found at %chromePath%
    pause
    exit /b
)

:: Check if URL file exists
if not exist "urls_scaler.txt" (
    echo File not found: urls_scaler.txt
    pause
    exit /b
)

echo Opening URLs from: urls_scaler.txt
for /f "usebackq delims=" %%U in ("urls_scaler.txt") do (
    start "" /max "%chromePath%" "%%U"
)

echo.








exit


:: =============================
:: === Launch SQL Tools ===
:: =============================

echo Starting SQL Tools...
start "" /max "C:\Program Files\MySQL\MySQL Workbench 8.0\MySQLWorkbench.exe"
timeout /t 20 >nul
start "" /max "C:\Program Files\DBeaver\dbeaver.exe"
