#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn   ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

^!w::
WinMatcher := "ahk_class CASCADIA_HOSTING_WINDOW_CLASS"
DetectHiddenWindows, On

if WinExist(WinMatcher)
{
    WinHide ahk_class CASCADIA_HOSTING_WINDOW_CLASS
}

DllCall( "CascadeWindows", uInt,0, Int,4, Int,0, Int,0, Int,0 )

if WinExist(WinMatcher)
{
    Sleep 500
    WinActivate ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinMove, ahk_class CASCADIA_HOSTING_WINDOW_CLASS, , 686, 700, 2374, 1315
    WinShow ahk_class CASCADIA_HOSTING_WINDOW_CLASS
    WinWaitActive ahk_class CASCADIA_HOSTING_WINDOW_CLASS
}

return
