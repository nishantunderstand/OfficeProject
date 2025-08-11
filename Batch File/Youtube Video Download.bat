@echo off
set /p URL=Enter the YouTube video URL: 

echo !!!=================== STARTED ============!!!

yt-dlp -f "bestvideo[height<=1080]+bestaudio/best[height<=1080]" ^
-o "C:\Users\User\Videos\4K Video Downloader+\%%(title)s.%%(ext)s" %URL%

echo !!!==================== ENDED ============!!!

pause
exit
