@echo off
title VaakDoot AI — Setup & Launch
color 0A
cls
echo.
echo  ============================================
echo     VaakDoot AI - Election Intelligence
echo     Setup and Launch Script
echo  ============================================
echo.

:: Check Python
where python >nul 2>nul
if %errorlevel% neq 0 (
    echo  [ERROR] Python not found!
    echo  Please install Python from python.org
    echo.
    pause
    exit /b
)

echo  [OK] Python found
echo  [..] Starting local server on port 5500...
echo.
echo  =============================================
echo   URL:  http://localhost:5500
echo   Stop: Press Ctrl+C
echo  =============================================
echo.

:: Open browser after 2 second delay
start "" /b cmd /c "timeout /t 2 /nobreak >nul & start http://localhost:5500"

:: Start server
cd /d "%~dp0"
python -m http.server 5500

pause
