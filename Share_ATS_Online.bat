@echo off
title Share Recruitment ATS Online (Public HTTPS)
color 0B

echo ===============================================================================
echo     SHARE RECRUITMENT ATS ONLINE WITH A PUBLIC HTTPS URL (CLOUDFLARE TUNNEL)   
echo ===============================================================================
echo.
echo This utility creates a temporary or permanent secure public HTTPS tunnel
echo to your locally running Recruitment and Applicant Tracking System.
echo Anyone worldwide will be able to access the site from any browser.
echo.
echo Checking for Cloudflare cloudflared...

where cloudflared >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo Cloudflared found! Launching instant public tunnel to port 8080...
    cloudflared tunnel --url http://localhost:8080
    pause
    exit /b 0
)

where ngrok >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    echo ngrok found! Launching instant public tunnel to port 8080...
    ngrok http 8080
    pause
    exit /b 0
)

echo.
echo [INFO] Neither cloudflared nor ngrok is currently in your system PATH.
echo.
echo To get a free instant public HTTPS link in 30 seconds:
echo   Option A (Cloudflare - No account needed):
echo     1. Download cloudflared.exe from https://github.com/cloudflare/cloudflared/releases
echo     2. Run: cloudflared tunnel --url http://localhost:8080
echo     3. You will receive an instant https://xxx.trycloudflare.com link to share!
echo.
echo   Option B (Render / Railway free cloud hosting):
echo     See deployment guide in README.md to push this repository to GitHub
echo     and link it to Render or Railway for permanent free HTTPS hosting.
echo ===============================================================================
pause
