@echo off
cd /d "%~dp0"


echo ======= x DAYS =============

echo.
echo !!!=================== STARTED ============!!!
echo.

:: Set and create download directory
set "DOWNLOAD_DIR=C:\Users\User\Videos\4K Video Downloader"
mkdir "%DOWNLOAD_DIR%" >nul 2>&1

:: Define channel list
setlocal enabledelayedexpansion
set CHANNELS[0]=https://www.youtube.com/@comicverseog
set CHANNELS[1]=https://www.youtube.com/@crazy4movie
set CHANNELS[2]=https://www.youtube.com/@Flickverseyt
set CHANNELS[3]=https://www.youtube.com/@SuperSuperOfficial

:: Set loop counter and total channels
set "CHANNEL_COUNT=4"
set "INDEX=0"

:channel_loop
if !INDEX! GEQ %CHANNEL_COUNT% goto end

set "CHANNEL_URL=!CHANNELS[%INDEX%]!"
echo.
echo --- Checking recent videos from: !CHANNEL_URL! ---

:: Download up to 5 recent videos (last 1 days), exit early on old uploads
yt-dlp ^
    --dateafter now-3days ^
    --break-on-reject ^
    --max-downloads 5 ^
    -f "bv*[height<=1080]+ba/best" ^
    --merge-output-format mp4 ^
    -o "%DOWNLOAD_DIR%\%%(channel)s - %%(upload_date)s - %%(title).100s.%%(ext)s" ^
    --no-overwrites ^
    --ignore-errors ^
    "!CHANNEL_URL!/videos"

:: Move to next channel
set /a INDEX+=1
goto channel_loop

:end
echo.
echo !!!==================== ENDED ============!!!
exit