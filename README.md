# MIU MCP Actions v2.0.0  

Commands for Mix It Up to trigger buttons in Stream Deck MCP Actions profile  

## Setup MCP Server  

### Install Elgato Stream Deck 7.4.0+  
   Settings > General > Enable MCP Actions  
   Option won't be availabe unless physical Stream Deck or paid mobile app has been connected  

### Setup Elgato MCP Server  

Close Mix It Up before installing.  
Otherwise Mix it Up will need to be restarted after install.

>   Automatic Install:  
     install-nodejs-elgatomcp.bat
     (Might need to unblock)  
	 Right-Click Properties > Security > Unblock  
	 Install:  
     Right-Click Run As Administrator  

>   Manual Elgato MCP Server Install:  
     Tutorial Video tutorial: https://www.youtube.com/watch?v=6fAbno8UpZU  
     Writen steps: https://github.com/dralezero/scripts-for-elgato-mcp/blob/main/README.md  

Optional learning: https://www.elgato.com/ww/en/explorer/products/stream-deck/sd-mcp-setup/  

## Mix It Up Setup  

### 1. Import Elgato MCP Controller

Create Action Group  
Name: Elgato MCP Controller  
Command Group: Elgato MCP  
Import: "Elgato MCP Controller.miucommand"

### 2. Configuration (Optional)  

Action Group: Elgato MCP Controller  

Expand "CONFIGURATION"  

"Config: Folder Path"  
A folder "MixItUpElgatoMCP" is created in $elgatomcpmiubasepath  
for stop/start batch files and JSON of MCP Actions  
The folder and files are created automatically  
Default value: %LOCALAPPDATA%  
example: C:\Users\drale\AppData\Local\MixItUpElgatoMCP  

Edit value of Special Identifier "elgatomcpmiubasepath"  
No backslash \ at the end  
Example: C:\Users\username\streaming  
Results in folder created here
C:\Users\username\streaming\MixItUpElgatoMCP  

"Config: MCP URL"  
Default value of Special Identifier "elgatomcpurl": localhost:9090  
This is default URL to Elgato MCP Server  
Do not add http:// at beginning  
Do not add /mcp at the end  

"Config: Error messages to chat: ON/OFF"  
Value: ON or OFF  
Default: OFF  

"Config: Debug file: ON/OFF"  
Value: ON of OFF  
Default: OFF  
If ON, the values of Special Identifiers used in "Elgato MCP Controller"  
are saved in $elgatomcpmiubasepath\MixItUpElgatoMCP\debug_specialidentifiers.txt  

### 2. Auto Start / Stop with MIU launch  
	
Channel > Events > Generic  
Application Launch:  
Action: Command  
Type: Run Command  
Command Type: Action Group  
Command: Elgato MCP Controller  
Save  

Application Exit:  
Action: Command  
Type: Run Command  
Command Type: Action Group  
Command: Elgato MCP Controller  
Command Arguments: elgatomcpstop  
Save  

## Create Stream Deck actions and trigger them with Mix It Up

### Stream Deck:  

Create a button inside Stream Deck MCP Actions Profile  
Give it a title unique from all other MCP Action buttons  
Spaces between letters are accepted  
Casing doesn't matter  
The title is not seen on your stream deck  
No special characters or quotes  

### MixItUp:
New Action Group:  

Name: Title of Stream Deck action  
Command Group: Elgato MCP Actions  
Action: Command  
Command Type: Action Group  
Command: Elgato MCP Controller  
Command Argument: Title of Stream Deck action  
- It is best to match the MCP Action title exactly (copy paste title from Stream Deck)
  
Save  

Test the action.  

Reference the action group in response to commands, events, redeems, etc.  

## MIU MCP Actions v2.0.0 Tested on

Tested versions:  
MixItUp 1.6.500 and 1.7.000  
Stream Deck 7.4.1 and 7.4.2  
Node.js 24.15.0 and 24.16.0  

## Disclaimer

This is an unofficial community project. I am not affiliated with 
Mix It Up or Elgato or any of their products. All product names, logos, 
and brands are property of their respective owners.
