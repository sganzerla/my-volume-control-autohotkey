#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

; Tecla Control (^) + Tecla X
^X::
send {Volume_Up 2}
return
; Tecla Control (^) + Tecla V
^V::
send {Volume_Down 2}
return
