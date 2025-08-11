@echo off
cd /d "C:\Users\User\Videos\4K Video Downloader" || exit /b 1

set "URL="
set /p "URL=Enter the YouTube video URL: "
if "%URL%"=="" ( echo No URL entered. Exiting. & exit /b 1 )

echo.
echo !!!=================== STARTED ============!!!
echo.

yt-dlp ^
  -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" ^
  --merge-output-format mp4 ^
  --retries 10 ^
  --fragment-retries 10 ^
  --no-check-certificate ^
  --extractor-args youtube:player-client=android ^
  -o "%%(title)s.%%(ext)s" ^
  "%URL%"

if %errorlevel% equ 0 (
    echo Download completed successfully.
    set "latest="
    for /f "delims=" %%F in ('dir /b /a:-d /o:-d *.mp4 2^>nul') do (
        set "latest=%%F"
        goto :found
    )
    :found
    if defined latest (
        echo Opening latest file: %latest%
        start "" "C:\Program Files\VideoLAN\VLC\vlc.exe" "%latest%"
    ) else (
        echo No MP4 files found in folder.
    )
) else (
    echo ERROR: Download failed with error code %errorlevel%.
)

echo.
echo !!!==================== ENDED ============!!!
pause
exit /b 0