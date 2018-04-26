#Include AHKHID.ahk
Gui, +LastFound
hGui := WinExist()
lastCallTime := 0
OnMessage(0xFF, "InputMsg")
AHKHID_Register(12, 1,hGui, RIDEV_INPUTSINK)
return

InputMsg(wParam, lParam) {
    Local now := A_TickCount
    Local d
    devhandle:=AHKHID_GetInputInfo(lParam,II_DEVHANDLE)
    data_code:=AHKHID_GetInputData(lParam, uData)
    
    if (data_code=5) {
        if (now - lastCallTime > 500) {
            SendInput {Media_Play_Pause}
            lastCallTime := now
        }
    }
    
    return test
}
