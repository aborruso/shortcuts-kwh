; "ALT + E" to have "�"
!e::SendInput {�}
return

; "ALT + -" to have "~"
!-::SendInput {~}
return

; "ALT + a" to have "�"
!a::SendInput {�}
return

; "ALT + '" to have "`"
!'::SendInput {``}
return

; "ALT + o" to have "�"
!o::SendInput {�}
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
