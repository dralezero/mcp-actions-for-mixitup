@echo off
echo ================================
echo  Downloading Node.js v24.15.0...
echo ================================

curl -L -o "%TEMP%\node-v24.15.0-x64.msi" "https://nodejs.org/dist/v24.15.0/node-v24.15.0-x64.msi"

echo.
echo ================================
echo  Installing Node.js...
echo ================================

msiexec /i "%TEMP%\node-v24.15.0-x64.msi" /qn /norestart

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