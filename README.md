# MCP Actions for Mix It Up v1.0.1

Commands for Mix It Up to trigger buttons in Stream Deck MCP Actions profile

## Setup MCP Server

### Install Elgato Stream Deck 7.4.0+  
   Settings > General > Enable MCP Actions

### Setup Elgato MCP Server

>   Automatic Install:  
     install-nodejs-elgatomcp.bat  
     Right-Click Properties > Security > Unblock  
     Right-Click Run As Administrator  
     Source: https://github.com/dralezero/scripts-for-elgato-mcp/blob/main/scripts/install-nodejs-elgatomcp.bat  

>   Manual Install:  
     Tutorial Video tutorial: https://www.youtube.com/watch?v=6fAbno8UpZU  
     Writen steps: https://github.com/dralezero/scripts-for-elgato-mcp/blob/main/README.md  

More info: https://www.elgato.com/ww/en/explorer/products/stream-deck/sd-mcp-setup/

## Folder setup

### Create folder that MIU will read and write files  
Example folder name: elgatomcp

### Place files into folder  

elgato_mcp_start.bat  
elgato_mcp_stop.bat  
mcpgetsessionid_piped.bat  

For each *.bat, Right-Click Properties > Security > Unblock

Files included in release or found here:  
https://github.com/dralezero/scripts-for-elgato-mcp/tree/main/scripts

## Mix It Up setup

### Create Action Groups

### 1.  Name: Elgato MCP File Path   
Command Group: Elgato MCP  
Import: "Elgato MCP File Path.miucommand"

Edit value of Special Identifier "elgatomcpfilepath" to folder path of *.bat files  
No backslash \ at the end  
Example: C:\Users\username\streaming\elgatomcp  

### 2. Name: Elgato MCP Server Start  
Command Group: Elgato MCP  
Import: "Elgato MCP Server Start.miucommand"  

Show Window option is enabled so server can be seen as running or stopped.  
Running message: "Starting Elgato MCP server..."  
Stopped by Stop command message: "Press any key to continue..."  
Closing the window will also stop the server  

Optional preference to not show window but then Stop command must be used.  

### 3. Name: Elgato MCP Server Stop  
Command Group: Elgato MCP  
Import: Elgato MCP Server Stop.miucommand  

Show Window option is enabled so server can be seen stopped  
Optional preference to not show window  

### 4. Name: Elgato MCP Get Session ID  
Command Group: Elgato MCP  
Import: "Elgato MCP Get Session ID.miucommand"  

### 5. Name: Elgato MCP Get Actions  
Command Group: Elgato MCP  
Import: "Elgato MCP Get Actions.miucommand"  

### 6. Name: Elgato MCP Auto Start  
Command Group: Elgato MCP  
Import: "Elgato MCP Auto Start.miucommand"  

Auto Start will have 4 empty commands  
Edit them in this order  

For each Command Type: Action Group  

Command: Elgato MCP File Path  

Command: Elgato MCP Server Start  

Command: Elgato MCP Get Session ID  

Command: Elgato MCP Get Actions  

### 5. Auto start / stop MCP server:  
	
Channel > Events > Generic  
Application Launch:  
Command Type: Action Group  
Command: Elgato MCP Auto Start  

Application Exit:  
Command Type: Action Group  
Command: Elgato MCP Server Stop  

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

Name: Whatever you like	in reference to the Stream Deck MCP Action button  
Command Group: Elgato MCP Actions  
Import: "Elgato MCP Action Template.miucommand"  
Edit Special Identifer actiontitle value: BUTTON_TITLE_HERE  
Match the MCP Action title exactly (copy paste title from Stream Deck)  
Save  

Test Command  

Reference the action group in MIU to "press" the Stream Deck button in response to commands, events, etc.  

## Action Groups explained

### Elgato MCP Auto Start:  

Runs commands in order:  
	
1. Elgato MCP File Path  
2. Elgato MCP Server Start  
3. Elgato MCP Get Session ID  
4. Elgato MCP Get Actions  

### Elgato MCP File Path:  

Sets global $elgatomcpfilepath for file path of MCP files  
	
### Elgato MCP Server Start:  

Runs elgato_mcp_start.bat in the $elgatomcpfilepath  
	
### Elgato MCP Server Stop:  

Runs elgato_mcp_stop.bat in the $elgatomcpfilepath  
The bat looks for processes listening on port 9090 and runs taskkill on the process  

### Elgato MCP Get Session ID:  
	
Runs mcpgetsessionid_piped.bat in the $elgatomcpfilepath  
Piped has a one line batch command and returns the session ID  
If pipe doesn't work use mcpgetsessionid_file.bat this will write the HTTP response headers to a file "headers.txt"  
in path the where the bat ran ($elgatomcpfilepath) and then reads the headers.txt file to return session ID.  
MCP session ID is stored in global $elgatomcpsessionid  

### Elgato MCP Get Actions:  

Using $elgatomcpsessionid, sends HTTP request to get JSON of buttons from Stream Deck MCP Actions profile  
Saves the JSON in mcpactions_json.txt in the $elgatomcpfilepath  
C# script reads and parses the JSON and saves into mcpactions_list.txt  
the list of MCP Actions formatted as  
BUTTONTITLE:ACTIONID  
(technically it walks through it as a string because System.Text.Json wasn't found in MIU)  

This can be manually run to get fresh list of buttons  
while editing Stream Deck MCP Actions with MIU open and Elgato MCP server running.  

## Disclaimer

This is an unofficial community project. I am not affiliated with 
Mix It Up or Elgato or any of their products. All product names, logos, 
and brands are property of their respective owners.
