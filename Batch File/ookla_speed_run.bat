@echo off
cd /d "%~dp0"

echo ============================
echo Running Ookla Speed Test...
echo ============================

:: Call Python script
python ookla_speed_run.py

echo ----------------------------
echo Done! Result saved in CSV.
echo ----------------------------

REM --- Open in Notepad++ ---
start "" /max "C:\Program Files (x86)\Notepad++\notepad++.exe" "C:\Users\User\Desktop\Batch File\ookla_speed_results.csv"

exit

