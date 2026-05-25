@echo off
echo ================================
echo  Elgato MCP Server Setup
echo ================================
echo.
echo This script will download and install:
echo   - Node.js
echo   - Elgato MCP Server
echo.
set /p confirm="Do you want to continue? (Y/N): "
if /i not "%confirm%"=="Y" (
    echo Installation cancelled.
    pause
    exit /b
)
echo ================================
echo  Downloading Node.js...
echo ================================
curl -L -o "%TEMP%\nodejsinstaller.msi" "https://nodejs.org/dist/v24.16.0/node-v24.16.0-x64.msi"
echo.
echo ================================
echo  Installing Node.js...
echo ================================
msiexec /i "%TEMP%\nodejsinstaller.msi" /qn /norestart
echo.
echo  Waiting for installation to complete...
timeout /t 10 /nobreak
echo.
echo ================================
echo  Refreshing PATH...
echo ================================
powershell -ExecutionPolicy Bypass -Command "$env:PATH = [System.Environment]::GetEnvironmentVariable('PATH','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('PATH','User'); Write-Host 'PATH refreshed successfully'"
echo.
echo ================================
echo  Installing Elgato MCP Server...
echo ================================
powershell -ExecutionPolicy Bypass -Command "$env:PATH = [System.Environment]::GetEnvironmentVariable('PATH','Machine') + ';' + [System.Environment]::GetEnvironmentVariable('PATH','User'); npm install -g @elgato/mcp-server"
echo.
echo ================================
echo  Setup Complete!
echo ================================
pause
