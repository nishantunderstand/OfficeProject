@echo off



cscript //nologo "LaunchChatGPT.vbs" 
cscript //nologo "LaunchXodo.vbs"
cscript //nologo "LaunchAlarm.vbs"


start "" /max "C:\Program Files\Beeftext\Beeftext.exe"
start "" "C:\Program Files\LGHUB\system_tray\lghub_system_tray.exe"
start "" /max "C:\Program Files (x86)\Everything\Everything.exe"
start "" /max "C:\Users\User\AppData\Roaming\Spotify\Spotify.exe"

start "" explorer.exe "D:\Spring_2025"

start "" "C:\Users\User\AppData\Local\Postman\Postman.exe"

start "" /max "C:\Program Files\Google\Chrome\Application\chrome.exe" "https://chat.openai.com"

start "" /max "C:\Program Files\Google\Chrome\Application\chrome.exe" "http://localhost:8080/"

start "" explorer.exe "C:\Users\User\eclipse-workspace\springrest"

start "" /max "C:\Program Files\Google\Chrome\Application\chrome.exe" "https://tcsglobal.udemy.com/learning-paths/6830272/"

start "" "C:\Users\User\eclipse\jee-2021-12\eclipse\eclipe.exe"
exit
