Menu, tray, NoStandard
Menu, tray, add, About, About
Menu, tray, add, Help, Help
Menu, tray, add
Menu, tray, add, AutoRun, AutoRun
Menu, tray, add
Menu, tray, add, Quit, End
IfNotExist, %A_Startup%\WinGrid.lnk
    Menu, Tray, Uncheck, AutoRun
else
    Menu, Tray, Check, AutoRun
EmptyMem()
return

~LButton & RButton::
	GridL:=540
	GridR:=1390
	;**************************************************************
	SysGet, WorkArea, MonitorWorkArea
	WorkAreaW:=WorkAreaRight
	WorkAreaH:=WorkAreaBottom
	WinGetPos, WindowX, WindowY, WindowW, WindowH, A
	WindowMX:=WindowX+WindowW/2
	WindowMY:=WindowY+WindowH/2
	;CoordMode, Mouse, Screen
	MouseGetPos, MouseX, MouseY
	;TrayTip,,%WindowX%/%WindowY%/%WindowW%/%WindowH% `n %MouseX%/%MouseY%
	;**************************************************************
	X:=WindowX
	Y:=WindowY
	W:=WindowW
	H:=WindowH
	if((WindowW==GridL or WindowW==GridR) and (WindowH==WorkAreaH or WindowH==WorkAreaH/2) and (WindowX==0 or WindowX==WorkAreaW-GridR) and (WindowY==0 or WindowY==WorkAreaH/2)){
		
		;1    U    2
		;L    C    R
		;4    D    3
		
		;1
		if(MouseX<WindowW*1/3 and MouseY<WindowH*1/3){
			X:=0
			Y:=0
			W:=GridL
			H:=WorkAreaH/2
		}
		;2
		if(MouseX>WindowW*2/3 and MouseY<WindowH*1/3){
			X:=WorkAreaW-GridR
			Y:=0
			W:=GridR
			H:=WorkAreaH/2
		}
		;3
		if(MouseX>WindowW*2/3 and MouseY>WindowH*2/3){
			X:=WorkAreaW-GridR
			Y:=WorkAreaH/2
			W:=GridR
			H:=WorkAreaH/2
		}
		;4
		if(MouseX<WindowW*1/3 and MouseY>WindowH*2/3){
			X:=0
			Y:=WorkAreaH/2
			W:=GridL
			H:=WorkAreaH/2
		}
		;C
		if(MouseX>WindowW*1/3 and MouseX<WindowW*2/3 and MouseY>WindowH*1/3 and MouseY<WindowH*2/3){
			X:=WorkAreaW/4
			Y:=WorkAreaH/4
			W:=WorkAreaW/2
			H:=WorkAreaH/2
		}
		;U
		if(MouseX>WindowW*1/3 and MouseX<WindowW*2/3 and MouseY<WindowH*1/3){
			if(WindowY==WorkAreaH/2 and WindowH==WorkAreaH/2){
				Y:=0
				H:=WorkAreaH
			}
			if(WindowY==0 and WindowH==WorkAreaH){
				H:=WorkAreaH/2
			} 
			if(WindowY==0 and WindowH==WorkAreaH/2){
				H:=WorkAreaH
			} 
		}
		;D
		if(MouseX>WindowW*1/3 and MouseX<WindowW*2/3 and MouseY>WindowH*2/3){
			if(WindowY==0 and WindowH==WorkAreaH/2){
				Y:=0
				H:=WorkAreaH
			}
			if(WindowY==0 and WindowH==WorkAreaH){
				Y:=WorkAreaH/2
				H:=WorkAreaH/2
			}
			if(WindowY==WorkAreaH/2 and WindowH==WorkAreaH/2){
				Y:=0
				H:=WorkAreaH
			}
		}
		;L
		if(MouseX<WindowW*1/3 and MouseY>WindowH*1/3 and MouseY<WindowH*2/3){
			;~ if(Mod(WindowW,GridL)==0 and WindowW==GridL){
			X:=0
			Y:=0
			W:=GridL
			H:=WorkAreaH
		}
		;R
		if(MouseX>WindowW*2/3 and MouseY>WindowH*1/3 and MouseY<WindowH*2/3){
			X:=WorkAreaW-GridR
			Y:=0
			W:=GridR
			H:=WorkAreaH
		}
	}else{
		if(MouseX<=WindowW*1/2){
			X:=0
			Y:=0
			W:=GridL
			H:=WorkAreaH
		}else{
			X:=WorkAreaW-GridR
			Y:=0
			W:=GridR
			H:=WorkAreaH
		}
	}
	;**************************************************************
	WinMove, A, , X, Y, W, H
	EmptyMem()
return

About:
	TrayTip,WinGrid,Version: 3.60`nCopyright 2015 Forw Ltd.`nforw.cc,600,1
	EmptyMem()
Return
Help:
    Run, help.png
    EmptyMem()
Return
AutoRun:
    IfNotExist, %A_Startup%\WinGrid.lnk
    {
        FileCreateShortcut, %A_WorkingDir%\WinGrid.exe, %A_Startup%\WinGrid.lnk
        Menu, Tray, Check, AutoRun
    }
    else
    {
        FileDelete, %A_Startup%\WinGrid.lnk
        Menu, Tray, Uncheck, AutoRun
    }
    EmptyMem()
return
End:
ExitApp

EmptyMem(PID="AHK Rocks")
{
    pid:=(pid="AHK Rocks") ? DllCall("GetCurrentProcessId") : pid
    h:=DllCall("OpenProcess", "UInt", 0x001F0FFF, "Int", 0, "Int", pid)
    DllCall("SetProcessWorkingSetSize", "UInt", h, "Int", -1, "Int", -1)
    DllCall("CloseHandle", "Int", h)
}