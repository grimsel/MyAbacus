

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

