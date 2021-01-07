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
#SingleInstance force

Sleep, 4000
Progress, OFF

^j::
Progress, %POptions%, You pressed Ctrl + I
Sleep, 2000
Progress, OFF


SchlaufeRaus := false
while(%SchlaufeRaus% = false )
{
	Progress, OFF
	MsgBox,35,Fill-in NextDay?
	
	IfMsgBox, Yes
	{
		SaveAndFwd() ; Future DoFwd(bool : ButSaveDataFirst=true)
		Set4Values()
	}
	IfMsgBox, No
	{
		;Future DoFwd(bool : ButSaveDataFirst=false)
	}
	IfMsgBox, Cancel
	{
		SchlaufeRaus = true
		
	}
}
Progress, OFF	

ExitApp ;End of script

SaveAndFwd()
{
	; Saves the timestamps and navigates to the next days 'next day' position
	; Precondition: The focus is on the 'next day' position. There is data to be saved.
     ; Aftercondition: The focus is on the 'next day' position. There is no data to be saved.

	DebugEnterKey := true ; manually Control pressing of the enter key
	if (%DebugEnterKey%=true)	
	{
		MsgBox,64,Info,In DebugMode now
		SchlaufeRaus := false
		MyCount := 0
		while(%SchlaufeRaus% = false )
		{
			
			Send, {Enter}
			MyCount++
			MsgBox,35,Enterkey pressed %MyCount%. time.`nPress again?`n`(else continue`)
			
		}	
	}
	

	
}
