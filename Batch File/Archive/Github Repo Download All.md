@echo off
setlocal enabledelayedexpansion

REM Set destination to Downloads folder
set "destination=%USERPROFILE%\Downloads"

REM Base GitHub URL
set "baseUrl=https://github.com/nishantunderstand"

REM List of repositories
set repos=GFG2Github HibernateBasicExample LeetCode-LeetHub nishantunderstand ObsidianGithub ScalerAcademy springbootjpa springcore springjdbc springmvc springorm springrest studywithme studywithme_Java8 SumitMalikLeetCode SumitMalikPepCodingL1 SumitMalikPepCodingL2 SumitMalikPepCodingL3

REM Loop through and clone each repo
for %%R in (%repos%) do (
    echo =====================================
    echo Cloning %%R into %destination%\%%R
    echo =====================================
    if not exist "%destination%\%%R" (
        git clone %baseUrl%/%%R.git "%destination%\%%R"
    ) else (
        echo Skipping %%R - already exists in Downloads.
    )
    echo.
)

echo ✅ All repositories processed.
pause
