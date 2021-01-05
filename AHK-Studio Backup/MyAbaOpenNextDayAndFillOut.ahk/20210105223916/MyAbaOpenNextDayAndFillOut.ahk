; ---------------------------------------------------------------------------------
; What this script does:
; If you press Ctrl + j, then 
; In the Website https://abacus.espas.ch/, Menu Zeiterfassung, In & Out, 
; Move to the the Next Day and Fill the times out with the standard values

; Precondition: The focus is on the 'next day' position. There is data to be saved.
; Aftercondition: The focus is on the 'next day' position. There is data to be saved.
; ---------------------------------------------------------------------------------
POptions="m2 Y300 zh0 fs18"; Progress commando options
Progress, %POptions%, ,Waiting until you press Ctrl+j
;Progress, m2 Y300 zh0 fs18, ,Waiting until you press Ctrl+j
;Progress, m2 Y300 b fs18 zh0, This is the Text.`nThis is a 2nd line., , , Courier New
Sleep, 4000
Progress, OFF

^j::
Progress, %POptions%, You pressed Ctrl + I
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
	IfMsgBox, Cancel
	{
	SchlaufeRaus = true
	Return;
	}
}
Progress,OFF	



return

SaveAndFwd()
{
	; Saves the timestamps and navigates to the next days 'next day' position
	; Precondition: The focus is on the 'next day' position. There is data to be saved.
	DebugEnterKey=true;  ; manually Control pressing of the enter key
	if DebugEnterKey=true
	{
		SchlaufeRaus = false
		while(%SchlaufeRaus% = false )
		{
			
			MsgBox,35,Enterkey pressed`nPress again?`n(else continue)
			
			IfMsgBox, Yes
			{
				Send, {Enter}
			}
			IfMsgBox, No
			{
				SchlaufeRaus = true
			}
			IfMsgBox, Cancel
			{
				SchlaufeRaus = true
				Return;
			}
		}	
	}
	else; if DebugEnterKey=false; press the enter key automatically
	{
		Progress, %POptions%, Enter Nr.1`nWait long
		Send, {Enter}
		Sleep, 3000 ;Beim zweiten Mal verstreicht viel Zeit um Seite neu zu laden
		Progress, %POptions%, Enter Nr.2`nWait short
		Send, {Enter}
		Sleep, 1000
		;Verify: The panel has changed to the next day
		
	}
	
	
	
}
Set4Values()
{
	Progress, %POptions%, 4 values
	;SetKeyDelay, 200 ;too fast
	SetKeyDelay, 500
	Send, {Tab}
	Progress, %POptions%, ,morning filling 
	Send, 8{ Tab }12{ Tab}
	Progress, %POptions%, afternoon filling 
	Send, 13{Tab}17
	;Verify: The 4 timestamps are now entered
	
	Progress, %POptions%, 1 back-tab
	Send, {Home}
	Send, {LShift down}{Tab}{LShift up}
	
	
	Progress, %POptions%, 3 back-tabs
	Send, {Home}
	Send, {LShift down}{Tab}{LShift up}
	Send, {Home}
	Send, {LShift down}{Tab}{LShift up}
	Send, {Home}
	Send, {LShift down}{Tab}{LShift up}
	;Verify: The focus is back on the 'next day' position. 
}
