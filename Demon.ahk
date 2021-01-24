#Include %A_LineFile%\..\JoinAndRecord.ahk
#Persistent
While, true
{
; Scan CSV
    time = %A_Now%
    Loop, Read, %A_LineFile%\..\Schedules.csv
    {
        StringSplit, col, A_LoopReadLine, `, 
        next_time = %col1%
        next_len = %col2%
        next_url = %col3%
        If next_time > %time%
            Break
    }
    MsgBox, , , Next : %next_time% : %next_url% , 5
; Wait
    While A_Now < next_time
        Sleep, 30000 ; check per 30sec
; Run
    JoinAndRecord(next_len,next_url)
}
