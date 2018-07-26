#SingleInstance Force
#installKeybdHook
#Persistent
Return ; 

; "ALT + E" to have "È"
!e::SendInput {È}
return

; "ALT + -" to have "~"
!-::SendInput {~}
return

; "ALT + a" to have "À"
!a::SendInput {À}
return

; "ALT + '" to have "`"
!'::SendInput {``}
return

; "ALT + o" to have "Ò"
!o::SendInput {Ò}
return

; "ALT + u" to have "Ù"
!u::SendInput {Ù}
return

; "CTRL +ALT + '" to have "```"
    #NoEnv
    #SingleInstance force
return

^!'::
    SavedClip := ClipboardAll
    Clipboard := "``````"
    Send ^v
    Clipboard := SavedClip
    SavedClip := ""
return

; Hotkey Shift + 1
+1::
Sendinput,
(
Testo d'esempio
)
Return
