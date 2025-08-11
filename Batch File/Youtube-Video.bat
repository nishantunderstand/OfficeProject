@echo off
:: ==============================
:: Set Working Directory
:: ==============================
cd /d "C:\Users\User\Videos\4K Video Downloader"

:: ==============================
:: Prompt for YouTube URL
:: ==============================
set /p URL=Enter the YouTube video URL: 
if "%URL%"=="" ( echo No URL entered. Exiting. & exit /b 1 )

echo.
echo !!!=================== STARTED ============!!!
echo.

:: ==============================
:: Download Video with yt-dlp
:: ==============================
yt-dlp ^
  -f "bv*[height<=1080]+ba/best" ^
  --merge-output-format mp4 ^
  -o "%%(title)s.%%(ext)s" ^
  "%URL%"

:: ==============================
:: Check Exit Status
:: ==============================
if %errorlevel% equ 0 (
    echo Download completed successfully.
) else (
    echo ERROR: Download failed.
)

echo.
echo !!!==================== ENDED ============!!!

start "" "C:\Users\User\Videos\4K Video Downloader" 

::pause
exit

