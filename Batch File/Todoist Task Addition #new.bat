@echo off
title Add Todoist Task with Natural Input

REM === Set your Todoist API token ===
set "TOKEN=14d930334443e3035b4604a43ea5dbfe09ab398b"

REM === Ask for input ===
set /p INPUT=Enter task and time (e.g., Interview tomorrow 9pm): 

REM === Extract task content (first word only) ===
for /f "tokens=1,* delims= " %%a in ("%INPUT%") do (
    set "TASK=%%a"
    set "DUE_STRING=%%b"
)

REM === Confirm parsed values ===
echo.
echo Task: %TASK%
echo When: %DUE_STRING%
echo.

REM === Send to Todoist ===
curl -X POST https://api.todoist.com/rest/v2/tasks ^
  -H "Authorization: Bearer %TOKEN%" ^
  -H "Content-Type: application/json" ^
  -d "{\"content\": \"%TASK%\", \"due_string\": \"%DUE_STRING%\"}"

echo.
echo ✅ Task added to Todoist!
pause
exit
