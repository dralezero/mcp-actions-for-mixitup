# Version 2.0.0  
## May 24, 2026  

Tested on   
MixItUp 1.6.500 and 1.7.000  
Stream Deck 7.4.1 and 7.4.2  
Node.js 24.15.0 and 24.16.0  

This release changes all files.

If you have a previous install, it is not necessary to run install-nodejs-elgatomcp.bat again  
even though Node.js has updated from 24.15.0 and 24.16.0 since MIU MCP Actions 1.0.0  

Previous MIU actions from "MIU MCP Actions 1.0.0" will not work.  
Refer to README on making a command to send an argument to trigger.  
Delete the following from the MIU actions "Special Identifier", "Script", "Web Request"  

Removed files:  
(functionality moved into Elgato MCP Controller.miucommand)  
Elgato MCP Action Template.miucommand  
Elgato MCP Auto Start.miucommand  
Elgato MCP File Path.miucommand  
Elgato MCP Get Actions.miucommand  
Elgato MCP Get Session ID.miucommand  
Elgato MCP Server Start.miucommand  
Elgato MCP Server Stop.miucommand  
elgato_mcp_start.bat now created by Elgato MCP Controller.miucommand  
elgato_mcp_stop.bat now created by Elgato MCP Controller.miucommand  
mcpgetsessionid_file.bat was never used in testing  
mcpgetsessionid_piped.bat functionality moved inside of Elgato MCP Controller.miucommand  

New file:
Elgato MCP Controller.miucommand  
handles config, start/stop, mcp action trigger, error checking / auto restart / retry  
Use other MIU commands to interact and send args  

- default %LOCALAPPDATA% folder path created for making files during run. this is the only %path% recognized. customized path must be full  
- config option: mcp server url  
- config option: show errors and restart alerts in chat  
- config option: debug. each run creates a file of Special Identifiers (S.I.) and values that were used

The below errors will result in a restart over Elgato MCP Server, a refresh of session ID, and get fresh list of actions from Stream Deck (stored into a S.I.).  
Then, will retry once more to trigger the button.  
- error check: list of actions stored in S.I. is empty (expecting JSON brackets)  
- error check: mcp action title not found in stored list in S.I.  
- error check: web request to trigger mcp is timeout or invalid session ID (based on tested assumptions when no result)  
- error check: mcp action id not found in stream deck (web request successful but known ID in S.I. action list no longer inside Stream Deck)  


# Version 1.0.1  
## May 11, 2026  

Tested on  
Mix It Up v.1.6.500  
Stream Deck v7.4.1  

Checksum mixitup-mcp-actions-1.0.1.zip: 2ac3fedc2edbe7ef9180ac8c74a11d377c6f64f9da1ba45dec637594533d834e  

Changes:  

-- Added more clear status messages on MCP Server Start and Stop scripts.  

-- install-nodejs-elgatomcp.bat  
Removed line that sets Powershell Execution Policy on LocalMachine to RemoteSigned  
This is not needed to start mcp server via the batch scripts.  
It was only needed to start mcp server via powershell, which this MIU implementation does not do.  

If you ran the previous version 1.0.0 install script you may want to check the policies.  

If you know what policy level you need on your machine, check and update it.  
Powershell: Get-ExecutionPolicy -List  

If you are unsure, set LocalMachine policy back to the default.  
Open PowerShell as Administrator  
Paste and hit enter: Set-ExecutionPolicy -ExecutionPolicy Restricted -Scope LocalMachine  
