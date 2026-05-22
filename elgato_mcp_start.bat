@echo off
netstat -ano | findstr "LISTENING" | findstr ":9090" >nul 2>&1
if %errorlevel% == 0 (
     echo MCP server already running on port 9090
) else (
    start "" /min cmd /c "elgato-mcp-server --http"
	:: echo Elgato MCP Server running...
    exit
)