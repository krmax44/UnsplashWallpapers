@echo off
title Unsplash Wallpapers

:start

REM Get screen resolution
FOR /f "tokens=1,2" %%a IN ('"wmic desktopmonitor get screenheight, screenwidth"') DO (
    SET /a ScreenHeight=%%a
    SET /a ScreenWidth=%%b
)

REM Download image and set it as wallpaper
wget.exe https://unsplash.it/%ScreenWidth%/%ScreenHeight%?random -O %USERPROFILE%/Pictures/Unsplash.jpg --no-check-certificate
Powershell.exe -executionpolicy remotesigned -File SetWallpaper.ps1

REM Wait for 60s
ping 127.0.0.1 -n 60 > nul
goto start