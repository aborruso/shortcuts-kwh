@echo off
REM ================================================================
REM Compile AutoHotkey script to executable
REM ================================================================
REM This script compiles start@aborruso.ahk to start@aborruso.exe
REM 
REM Requirements:
REM - AutoHotkey installed (https://www.autohotkey.com/)
REM - Ahk2Exe.exe in PATH or default installation location
REM ================================================================

setlocal

REM Define paths
set SCRIPT_NAME=start@aborruso.ahk
set EXE_NAME=start@aborruso.exe
set ICON_PATH=resources\00C8-500x500.ico

REM Try to find Ahk2Exe.exe in common locations
set AHK2EXE=

if exist "C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe" (
    set "AHK2EXE=C:\Program Files\AutoHotkey\Compiler\Ahk2Exe.exe"
)

if exist "C:\Program Files (x86)\AutoHotkey\Compiler\Ahk2Exe.exe" (
    set "AHK2EXE=C:\Program Files (x86)\AutoHotkey\Compiler\Ahk2Exe.exe"
)

if "%AHK2EXE%"=="" (
    echo ERROR: Ahk2Exe.exe not found!
    echo Please install AutoHotkey from https://www.autohotkey.com/
    echo Or add Ahk2Exe.exe to your PATH
    pause
    exit /b 1
)

echo Using compiler: %AHK2EXE%
echo.

REM Compile the script
echo Compiling %SCRIPT_NAME% to %EXE_NAME%...
"%AHK2EXE%" /in "%SCRIPT_NAME%" /out "%EXE_NAME%" /icon "%ICON_PATH%"

if %errorlevel% equ 0 (
    echo.
    echo ============================================
    echo SUCCESS! Executable created: %EXE_NAME%
    echo ============================================
    pause
) else (
    echo.
    echo ============================================
    echo ERROR: Compilation failed!
    echo ============================================
    pause
    exit /b 1
)

endlocal
