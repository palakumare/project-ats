@echo off
title Recruitment and Applicant Tracking System
color 0A

echo ===============================================================================
echo        RECRUITMENT AND APPLICANT TRACKING SYSTEM WITH ATS SCORE DETECTOR       
echo ===============================================================================
echo.
echo  Starting Full Stack Platform:
echo   - Backend: Spring Boot Server (Port 8080)
echo   - Integrated ATS Parser: PDFBox 3.0.2 + Apache POI
echo   - Dynamic Scoring: 0-100 Weighted ATS Detector
echo   - Frontend: Modern React 18 SPA (Vite / Unified Static)
echo.
echo ===============================================================================

:: Check for Java
where java >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Java 21 or later is required to run the backend.
    echo Please install JDK 21 and ensure 'java' is added to PATH.
    pause
    exit /b 1
)

:: Check for Node.js
where node >nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js is required to run the frontend dev server.
    echo Please install Node.js 18+ and ensure 'node' and 'npm' are added to PATH.
    pause
    exit /b 1
)

echo [1/3] Checking Frontend Dependencies...
if not exist "frontend\node_modules" (
    echo Installing frontend npm packages...
    cd frontend
    call npm install
    cd ..
)

echo [2/3] Launching Spring Boot Backend...
start "Recruitment ATS Backend (Port 8080)" cmd /k "cd backend && mvn spring-boot:run"

echo [3/3] Launching React Frontend (Port 5173)...
timeout /t 5 >nul
start "Recruitment ATS Frontend (Port 5173)" cmd /k "cd frontend && npm run dev"

timeout /t 3 >nul
echo.
echo Opening Application in default browser...
start http://localhost:5173/

echo.
echo ===============================================================================
echo System is starting up!
echo   - Frontend URL:  http://localhost:5173
echo   - Backend REST:  http://localhost:8080/api
echo   - Swagger / Test Accounts:
echo       * Admin:      admin / admin123
echo       * HR Pune:    hr_priya / hr123
echo       * Candidate:  aarav_m / user123
echo ===============================================================================
echo Keep the backend and frontend command windows open while using the application.
pause
