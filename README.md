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
- 文件宽。约550像素，适合文件浏览等。
- 内容宽。约1400像素，适合网页浏览、内容编辑等。

## Adjust Rules

__First Time__
- 如果鼠标在前窗口左侧，窗口被调整至屏幕左侧，并设置为全高文件宽。
- 如果鼠标在前窗口右侧，窗口被调整至屏幕右侧，并设置为全高内容宽。

__Second Time__  
已经是标准大小的窗口，再次调整时遵循以下规则：
<table>
  <tr>
    <td></td><td>调至半高/全高</td><td></td>
  </tr>
  <tr>
    <td>调至左侧全高文件宽</td><td>调至屏幕中间</td><td>调至右侧全高内容宽</td>
  </tr>
  <tr>
    <td></td><td>调至半高/全高</td><td></td>
  </tr>
</table>

## Uninstall
1. Run Uninstall.exe;
1. Delete the directory and files;
