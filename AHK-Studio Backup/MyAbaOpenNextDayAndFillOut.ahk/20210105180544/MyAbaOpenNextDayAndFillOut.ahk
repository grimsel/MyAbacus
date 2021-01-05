; ---------------------------------------------------------------------------------
; What this script does:
; If you press Ctrl + j, then 
; In the Website https://abacus.espas.ch/, Menu Zeiterfassung, In & Out, 
; Move to the the Next Day and Fill the times out with the standard values

; Precondition: The focus is on the 'next day' position. There is data to be saved.
; Aftercondition: The focus is on the 'next day' position. There is data to be saved.
; ---------------------------------------------------------------------------------
Progress, zh0 fs18, ,Waiting until you press Ctrl+j
Sleep, 4000
Progress, OFF

^j::
SaveAndFwd()
Set4Values()


Progress,OFF
return

SaveAndFwd()
{
	; Saves the timestamps and navigates to the next days 'next day' position
	; Precondition: The focus is on the 'next day' position. There is data to be saved.
	Progress, zh0 fs18, 2 times enter
	Send, {Enter}
	Sleep, 1000
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
