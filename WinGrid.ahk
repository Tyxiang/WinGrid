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
	;**************************************************************
	SysGet, WorkArea, MonitorWorkArea
	WorkAreaW:=WorkAreaRight + 10
	WorkAreaH:=WorkAreaBottom + 10
	GridL:=560
	GridR:=1390
	BasePointX:=-10
	BasePointY:=0
	;**************************************************************
	WinGetPos, WindowX, WindowY, WindowW, WindowH, A
	;CoordMode, Mouse, Screen
	MouseGetPos, MouseX, MouseY
	;TrayTip,,%WindowX%/%WindowY%/%WindowW%/%WindowH% `n %MouseX%/%MouseY%
	;**************************************************************
	X:=WindowX
	Y:=WindowY
	W:=WindowW
	H:=WindowH
	if((WindowW==GridL or WindowW==GridR) and (WindowH==WorkAreaH or WindowH==WorkAreaH/2) and (WindowX==BasePointX or WindowX==WorkAreaW-GridR) and (WindowY==BasePointY or WindowY==WorkAreaH/2)){
		
		;1    U    2
		;L    C    R
		;4    D    3
		
		/*
		;1		
		if(MouseX<WindowW*1/3 and MouseY<WindowH*1/3){
			X:=BasePointX
			Y:=BasePointY
			W:=GridL
			H:=WorkAreaH/2
		} 
		;2
		if(MouseX>WindowW*2/3 and MouseY<WindowH*1/3){
			X:=WorkAreaW-GridR
			Y:=BasePointY
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
			X:=BasePointX
			Y:=WorkAreaH/2
			W:=GridL
			H:=WorkAreaH/2
		}
		*/
		
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
				Y:=BasePointY
				H:=WorkAreaH
			}
			if(WindowY==BasePointY and WindowH==WorkAreaH){
				H:=WorkAreaH/2
			} 
			if(WindowY==BasePointY and WindowH==WorkAreaH/2){
				H:=WorkAreaH
			} 
		}
		;D
		if(MouseX>WindowW*1/3 and MouseX<WindowW*2/3 and MouseY>WindowH*2/3){
			if(WindowY==BasePointY and WindowH==WorkAreaH/2){
				Y:=BasePointY
				H:=WorkAreaH
			}
			if(WindowY==BasePointY and WindowH==WorkAreaH){
				Y:=WorkAreaH/2
				H:=WorkAreaH/2
			}
			if(WindowY==WorkAreaH/2 and WindowH==WorkAreaH/2){
				Y:=BasePointY
				H:=WorkAreaH
			}
		}
		;L
		if(MouseX<WindowW*1/3 and MouseY>WindowH*1/3 and MouseY<WindowH*2/3){
			X:=BasePointX
			Y:=BasePointY
			W:=GridL
			H:=WorkAreaH
		}
		;R
		if(MouseX>WindowW*2/3 and MouseY>WindowH*1/3 and MouseY<WindowH*2/3){
			X:=WorkAreaW-GridR
			Y:=BasePointY
			W:=GridR
			H:=WorkAreaH
		}
	}else{
		if(MouseX<=WindowW*1/2){
			X:=BasePointX
			Y:=BasePointY
			W:=GridL
			H:=WorkAreaH
		}else{
			X:=WorkAreaW-GridR
			Y:=BasePointY
			W:=GridR
			H:=WorkAreaH
		}
	}
	;**************************************************************
	WinMove, A, , X, Y, W, H
	EmptyMem()
return

About:
	TrayTip,WinGrid,Version: 3.80`nCopyright 2015 Forw Ltd.`nforw.cc,600,1
	EmptyMem()
Return
Help:
    Run, https://github.com/Tyxiang/WinGrid/blob/master/README.md
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