﻿; ---------------------------------------------------------------------------------
; What this script does:
; If you press Ctrl + j, then 
; In the Website https://abacus.espas.ch/, Menu Zeiterfassung, In & Out, 
; Move to the the Next Day and Fill the times out with the standard values

; Precondition: The focus is on the 'next day' position. There is data to be saved.
; Aftercondition: The focus is on the 'next day' position. There is data to be saved.
; ---------------------------------------------------------------------------------
Progress, m2 Y300 zh0 fs18, ,Waiting until you press Ctrl+j
;Progress, m2 Y300 b fs18 zh0, This is the Text.`nThis is a 2nd line., , , Courier New
Sleep, 4000
Progress, OFF

^j::
Progress, zh0 fs18, You pressed Ctrl + I
Sleep, 2000
Progress, OFF


SchlaufeRaus = false
while(%SchlaufeRaus% = false )
{
	Progress, OFF
	MsgBox,35,Fill-in NextDay?
	
	IfMsgBox, Yes
	{
		SaveAndFwd()
		Set4Values()
	}
	; IfMsgBox, Cancel
	; %SchlaufeRaus% = true
	; Return;
}
Progress,OFF	



return

SaveAndFwd()
{
	; Saves the timestamps and navigates to the next days 'next day' position
	; Precondition: The focus is on the 'next day' position. There is data to be saved.
	Progress, zh0 fs18, 2 times enter
	Send, {Enter}
	Sleep, 3000 ;Beim zweiten Mal verstreicht viel Zeit um Seite neu zu laden
	Send, {Enter}
	Sleep, 1000
	;Verify: The panel has changed to the next day
	
}
Set4Values()
{
	Progress, zh0 fs18, 4 values
	;SetKeyDelay, 200 ;too fast
	SetKeyDelay, 500
	Send, {Tab}
	Progress, zh0 fs18, ,morning filling 
	Send, 8{ Tab }12{ Tab}
	Progress, zh0 fs18, afternoon filling 
	Send, 13{Tab}17
	;Verify: The 4 timestamps are now entered
	
	Progress, zh0 fs18, 1 back-tab
	Send, {Home}
	Send, {LShift down}{Tab}{LShift up}
	
	
	Progress, zh0 fs18, 3 back-tabs
	Send, {Home}
	Send, {LShift down}{Tab}{LShift up}
	Send, {Home}
	Send, {LShift down}{Tab}{LShift up}
	Send, {Home}
	Send, {LShift down}{Tab}{LShift up}
	;Verify: The focus is back on the 'next day' position. 
}
