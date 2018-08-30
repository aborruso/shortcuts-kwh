#SingleInstance Force
#installKeybdHook
#Persistent
Return

; "ALT + a" to have "À"
!a::SendInput {U+00C0}
Return

; ALT + E per avere È
!è::SendInput {U+00C8}  
Return

; "ALT + o" to have "Ò"
!o::SendInput {U+00D2}
Return

; "ALT + u" to have "Ù"
!u::SendInput {U+00D9}
Return

; "ALT + -" to have "~"
!-::SendInput {U+007E}
Return

; "ALT + '" to have "`"
!'::SendInput {U+0060}
Return

;"CTRL +ALT + '" to have "```"
^!'::
loop 3
SendInput {U+0060}
Return

; "CTRL +ALT + h" to have "This is an example text"
; The lines below are commented with ";", than "CTRL +ALT + h" does not work. Remove ";" to make it works
;^!h::
;Sendinput,
;(
;This is an example text
;)
;Return
