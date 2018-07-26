#SingleInstance Force
#installKeybdHook
#Persistent
Return

; "ALT + E" to have "�"
!e::SendInput {�}
Return

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
Return

; "CTRL +ALT + h" to have "This is an {#}example text"
^!h::
Sendinput,
(
This is an {#}example text
)
Return
