

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
