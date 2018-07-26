#SingleInstance Force
#installKeybdHook
#Persistent
Return

; "ALT + E" to have "È"
!e::SendInput {È}
Return

; "ALT + -" to have "~"
!-::SendInput {~}
Return

; "ALT + a" to have "À"
!a::SendInput {À}
Return

; "ALT + '" to have "`"
!'::SendInput {``}
Return

; "ALT + o" to have "Ò"
!o::SendInput {Ò}
Return

; "ALT + u" to have "Ù"
!u::SendInput {Ù}
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
Return

; "CTRL +ALT + h" to have "This is an {#}example text"
^!h::
Sendinput,
(
This is an {#}example text
)
Return
