#SingleInstance Force
#installKeybdHook
#Persistent
<<<<<<< HEAD
Return

; "ALT + E" to have "�"
!e::SendInput {�}
Return
=======
Return ; 

; "ALT + E" to have "È"
!e::SendInput {È}
return
>>>>>>> cb21a27a4c7f94a9e95f92029fe9f606d2b97677

; "ALT + -" to have "~"
!-::SendInput {~}
Return

; "ALT + a" to have "�"
!a::SendInput {�}
Return

; "ALT + '" to have "`"
!'::SendInput {``}
Return

; "ALT + o" to have "�"
!o::SendInput {�}
Return

; "ALT + u" to have "�"
!u::SendInput {�}
Return

; "CTRL +ALT + '" to have "```"
    #NoEnv
    #SingleInstance force
Return

^!'::
    SavedClip := ClipboardAll
    Clipboard := "``````"
    Send ^v
    Clipboard := SavedClip
    SavedClip := ""
<<<<<<< HEAD
Return

; "CTRL +ALT + h" to have "This is an {#}example text"
^!h::
=======
return

; Hotkey Shift + 1
+1::
>>>>>>> cb21a27a4c7f94a9e95f92029fe9f606d2b97677
Sendinput,
(
This is an {#}example text
)
Return
