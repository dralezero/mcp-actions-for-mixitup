@echo off
netstat -ano | findstr /R "9090.*LISTENING" >nul 2>&1
if %errorlevel% == 0 (
    echo Stopping Elgato MCP Server...
    for /f "tokens=5" %%a in ('netstat -ano ^| findstr /R "9090.*LISTENING"') do (
        if not "%%a"=="0" (
		taskkill /PID %%a /F
		goto done
		)		
    )
) else (
    echo No process found on port 9090.
)
:done
exit