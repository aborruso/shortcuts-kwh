#SingleInstance Force
#installKeybdHook
#Persistent
Return ; 


; "ALT + E" to have "È"
!e::SendInput {U+00C8} 
return

; "ALT + -" to have "~"
!-::SendInput {U+007E}
Return

; "ALT + a" to have "À"
!a::SendInput {U+00C0}
Return

; "ALT + '" to have "`"
!'::SendInput {U+0060}
Return

; "ALT + o" to have "Ò"
!o::SendInput {U+00D2}
Return

; "ALT + u" to have "Ù"
!u::SendInput {U+00D9}
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
