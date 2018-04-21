# WinGrid
[![Open Source Love](https://badges.frapsoft.com/os/v2/open-source.svg?v=103)](https://github.com/ellerbrock/open-source-badge/)
[![MIT Licence](https://badges.frapsoft.com/os/mit/mit.svg?v=103)](https://opensource.org/licenses/mit-license.php)  
   
Adjust the window to standard size and position quickly and accurately.  

![screenshot](https://github.com/Tyxiang/WinGrid/blob/master/screenshot.png)

## Install
1. Download zip package from Releases;
1. Decompress the zip file to a working directory;
1. Run WinGird.exe;

## Run At System Startup
1. Right click the WinGird icon on the system tray;
1. Select "AutoRun";

## Usage
- Press the left and right mouse buttons at the same time to trigger the window adjustment;
- The result of the adjustment depends on which area of the window the mouse pointer is on when the trigger fires;

## Standard Size

__Standard Height__
- Half high. Half the height of the screen.
- Full height. Screen height.

__Standard Width__
- File width. About 550 pixels, suitable for file browsing and so on.
- Content width. About 1400 pixels, suitable for web browsing, content editing and so on.

## Adjust Rules

__First Time__
- If the mouse is on the left side of the current window, the window is adjusted to the left of the screen and set to full height file width.
- If the mouse is on the right side of the current window, the window is adjusted to the right of the screen and set to full height content width.

__Second Time__  
If it is already a standard size window, follow these rules when making adjustments again:
<table>
  <tr>
    <td></td><td>Adjust to half/full height</td><td></td>
  </tr>
  <tr>
    <td>To left full height file width</td><td>To the middle of the screen</td><td>To right full height content wide</td>
  </tr>
  <tr>
    <td></td><td>To half/full height</td><td></td>
  </tr>
</table>

## Uninstall
1. Run Uninstall.exe;
1. Delete the directory and files;
