#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir% ; Ensures a consistent starting directory.

#SingleInstance force
#MaxThreadsPerHotkey 2

~F2::Suspend


~F10::
    main()
Return

main()
{
    Loop
    {
        FileReadLine, line, ./accList.txt, %A_Index%
        if ErrorLevel
            break
		if (A_Index == 1)
		{
			pass := line 
		} 
		else
		{
			startLogin(line, pass)
		}
    }
    MsgBox, All accounts have been logged in or there has been a problem.
return
}

startLogin(mail, pass)
{
	clickLogOut()
	sleep 1000
	clickLogIn()
	sleep 1000
	writeMail(mail)
	sleep 500
	writePass(pass)
	sleep 500
	pressEnter()
	sleep 3500
	pressEnter()
	sleep 4500
	pressHome()
	sleep 2000
	newWindow()
	sleep 2500
	openStarBreak()
	sleep 5500
	;MsgBox,  %mail% %pass%
return
}

clickLogOut()
{
	SendInput, {Down Down}
	SendInput, {Down Up}

	SendInput, {Down Down}
	SendInput, {Down Up}

	SendInput, {Down Down}
	SendInput, {Down Up}

	pressEnter()
return
}

clickLogIn()
{
	SendInput, {Down Down}
	SendInput, {Down Up}

	SendInput, {Down Down}
	SendInput, {Down Up}

	SendInput, {Down Down}
	SendInput, {Down Up}

	pressEnter()
return
}

writeMail(mail)
{
	SendInput, {BS Down}
	sleep 500
	SendInput, {BS up}
	sendInput %mail%
	sleep 500
	SendInput, {Tab Down}
	SendInput, {Tab Up}
return
}

writePass(pass)
{
	sendInput %pass%
	sleep 500
	SendInput, {Tab Down}
	SendInput, {Tab Up}
return
}

pressEnter()
{
	SendInput, {Enter Down}
	sleep 500
	SendInput, {Enter Up}
return
}

pressHome()
{
	SendInput, {H Down}
	sleep 500
	SendInput, {H Up}
	sleep 1000
return
}

newWindow()
{
	SendInput, ^n
return
}

openStarBreak()
{
	sendInput starbreak.com
	pressEnter()
return
}


#IfWinActive

