
OpenSoundControlPanel()
SelectInputDevice("마이크 ") ; 장치 이름 변경 필요
SetSampleRate()

Func OpenSoundControlPanel()
	run("control mmsys.cpl")
	WinWaitActive("소리","", 10000)
EndFunc

Func SelectInputDevice($deviceName)
	Local $hwnd = WinGetHandle("소리")
	ConsoleWrite("Handle :" & $hwnd & @CRLF)
	If $hwnd <> "" Then
		ControlCommand($hWnd, "", "[CLASS:SysTabControl32; INSTANCE:1]", "TabRight", "")
		Sleep(200)
		ControlListView($hwnd, "","[CLASS:SysListView32; INSTANCE:1]", "Select", 0)
		Sleep(200)
		Send("!P") ; "속성" 메뉴 선택
		Local $nIdx = ControlListView($hwnd, "","[CLASS:SysListView32; INSTANCE:1]", "GetItemCount")
		ConsoleWrite("Item Idx :" & $nIdx & @CRLF)

	EndIf
EndFunc

; 고급 설정으로 이동하여 샘플 레이트 설정
Func SetSampleRate($rate = "{UP}")
    WinWaitActive("마이크", "", 10000)
	Local $hwnd = WinGetHandle("마이크")
		If $hwnd <> "" Then
			ControlCommand($hWnd, "", "[CLASS:SysTabControl32; INSTANCE:1]", "TabRight", "")
			ControlCommand($hWnd, "", "[CLASS:SysTabControl32; INSTANCE:1]", "TabRight", "")
			ControlCommand($hWnd, "", "[CLASS:SysTabControl32; INSTANCE:1]", "TabRight", "")
			Sleep(500);ControlClick($hwnd, "", "[CLASS:Button; TEXT:고급]")
			ControlClick($hwnd, "", "[CLASS:ComboBox; INSTANCE:1]") ; 샘플 레이트 콤보박스
		    Send($rate& "{ENTER}{ENTER}{ENTER}")
		EndIf
EndFunc