# MCP Actions v2.0.0 for Mix It Up 
NEEDS MAJOR UPDATED FOR THE REBUILD LOOK FOR "NEEDUPDATE"
MAYBE TALK ABOUT UNZIPPING AND CHECKING FOLDERS INSTEAD OF CREATING FOLDERS
Commands for Mix It Up to trigger buttons in Stream Deck MCP Actions profile

## Setup MCP Server

### Install Elgato Stream Deck 7.4.0+  
   Settings > General > Enable MCP Actions  
   Option won't be availabe unless physical Stream Deck or paid mobile app has been connected  

### Setup Elgato MCP Server

>   Automatic Install:  
     install-nodejs-elgatomcp.bat  
     Right-Click Properties > Security > Unblock (NEEDUPDATE if option not there, that's good)  
     Right-Click Run As Administrator  

>   Manual Install:  
     NEEDUPDATE Tutorial Video tutorial: https://www.youtube.com/watch?v=6fAbno8UpZU  
     Writen steps: https://github.com/dralezero/scripts-for-elgato-mcp/blob/main/README.md  

More info: https://www.elgato.com/ww/en/explorer/products/stream-deck/sd-mcp-setup/

## Folder setup

### NEEDUPDATE Create folder that MIU will read and write files  
(folder already exist in zip release downlaoded)
Example folder name: elgatomcp

### NEEDUPDATE Place files into folder  
(files already exist in extracted zip folder)

elgato_mcp_start.bat  
elgato_mcp_stop.bat  

For each *.bat, Right-Click Properties > Security > Unblock (NEEDUPDATE if option not there, that's good)

## Mix It Up setup

### Create Action Groups

### 1.  Name: Elgato MCP Controller  
Command Group: Elgato MCP  
Import: "Elgato MCP Controller.miucommand"

Expand "Config: Folder Path"  
Edit value of Special Identifier "elgatomcpfilepath" to folder path of *.bat files  
No backslash \ at the end  
Example: C:\Users\username\streaming\elgatomcp  

Expand "Config: MCP URL"  
Default value of Special Identifier "elgatomcpurl" is: localhost:9090  
This is default URL to Elgato MCP Server  
Do not add http:// at beginning  
Do not add /mcp at the end  

Expand "Config: Error messages to chat: ON/OFF"  
Type ON or OFF  

Expand "Config: Debug file: ON/OFF"  
Type ON of OFF  
If ON, the values of Special Identifiers are saved in $elgatomcpfilepath\debug_specialidentifiers.txt  

### 2. Name: Elgato MCP Stop  
Command Group: Elgato MCP  
Import: "Elgato MCP Stop.miucommand"  

### 3. Setup Auto Start / Stop with MIU launch  
	
Channel > Events > Generic  
Application Launch:  
Command Type: Action Group  
Command: Elgato MCP Controller  

Application Exit:  
Command Type: Action Group  
Command: Elgato MCP Stop  

## Create Stream Deck actions and trigger them with Mix It Up

### Stream Deck:  

Create a button inside Stream Deck MCP Actions Profile  
Give it a title unique from all other MCP Action buttons  
Spaces between letters are accepted  
Casing doesn't matter  
The title is not seen on your stream deck  
TITLE_LIKE_THIS is a safe option for title  

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

Test Command  

Reference the Stream Deck button's action group in MIU to trigger the Stream Deck button in response to commands, events, etc.  

NEEDUPDATE EXPLAIN WHAT THE CONTROLLER AND OTHER COMMANDS DO

## Disclaimer

This is an unofficial community project. I am not affiliated with 
Mix It Up or Elgato or any of their products. All product names, logos, 
and brands are property of their respective owners.
