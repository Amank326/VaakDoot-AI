@echo off
title VaakDoot AI — Deploy to Firebase (Google Cloud)
color 0A
cls
echo.
echo  ====================================================
echo     VaakDoot AI — Google Cloud Deployment (Firebase)
echo  ====================================================
echo.

:: Step 1: Check Node.js
where node >nul 2>nul
if %errorlevel% neq 0 (
    echo  [ERROR] Node.js not found!
    echo  Download from: https://nodejs.org/
    echo.
    pause
    exit /b
)
echo  [OK] Node.js found

:: Step 2: Check/Install Firebase CLI
where firebase >nul 2>nul
if %errorlevel% neq 0 (
    echo  [..] Installing Firebase CLI globally...
    npm install -g firebase-tools
    if %errorlevel% neq 0 (
        echo  [ERROR] Failed to install Firebase CLI
        pause
        exit /b
    )
)
echo  [OK] Firebase CLI ready

:: Step 3: Login
echo.
echo  [..] Opening Google login in browser...
echo      (Sign in with your Google account)
echo.
firebase login

:: Step 4: Create/Select Project
echo.
echo  ====================================================
echo   Choose an option:
echo   1. Use existing Firebase project
echo   2. Create new project
echo  ====================================================
set /p choice="  Enter (1 or 2): "

if "%choice%"=="2" (
    echo.
    set /p projid="  Enter project ID (e.g., vaakdoot-ai-2026): "
    firebase projects:create %projid% --display-name "VaakDoot AI"
    firebase use %projid%
) else (
    echo.
    firebase projects:list
    echo.
    set /p projid="  Enter project ID to use: "
    firebase use %projid%
)

:: Step 5: Deploy
echo.
echo  ====================================================
echo   Deploying VaakDoot AI to Firebase Hosting...
echo  ====================================================
echo.
cd /d "%~dp0"
firebase deploy --only hosting

echo.
echo  ====================================================
echo   DEPLOYMENT COMPLETE!
echo   Your site is live at:
echo   https://%projid%.web.app
echo   https://%projid%.firebaseapp.com
echo  ====================================================
echo.
pause
