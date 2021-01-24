JoinAndRecord(len_msec,url)
{
; LaunchOBS
    Process,Exist,obs64.exe
    If %ErrorLevel% <> 0
        WinActivate,ahk_pid %ErrorLevel%,    
    Else
        Run, C:\Windows\SysWOW64\cmd.exe /c "start /d C:\"Program Files"\obs-studio\bin\64bit\ obs64.exe"
    WinWait, OBS, , 10

; BeginRecording
    Process,Exist,obs64.exe
    WinActivate,ahk_pid %ErrorLevel%,
    Send, !E

; JoinZoom
    Run chrome.exe %url% " --new-tab "
    WinWait, Zoom, , 10
    Sleep, 5000

; Wait
    Sleep, %len_msec%

; ExitZoom
    WinActivate, Zoom
    Send, !q
    MsgBox, , , ExitZoom, 5

; EndRecording
    Process,Exist,obs64.exe
    WinActivate,ahk_pid %ErrorLevel%,
    Send, !Q
}
