; ================================================================
; AutoHotkey Shortcuts for Italian Keyboard & Developer Utilities
; ================================================================
; Author: @aborruso
; Description: Keyboard shortcuts for special Italian characters
;              and productivity utilities for Windows Explorer
; Credits: Based on community contributions from:
;          - aubricus (original new file creation)
;          - davejamesmiller (IfWinActive check)
;          - syon (non-English Windows compatibility)
; ================================================================

#SingleInstance Force
#installKeybdHook
#Persistent
Return

; ALT + è per avere È (tasto dopo P sulla tastiera italiana)
!SC01A::SendInput {U+00C8}
Return

; ALT + ò per avere Ò (tasto dopo L sulla tastiera italiana)
!SC027::SendInput {U+00D2}
Return

; ALT + à per avere À (tasto dopo ò sulla tastiera italiana)
!SC028::SendInput {U+00C0}
Return

; ALT + ù per avere Ù (tasto dopo ò, in basso)
!SC02B::SendInput {U+00D9}
Return

; ALT + ì per avere Ì (provando con scan code diversi)
; Sulla tastiera italiana, ì potrebbe essere SC00D o SC00C
!SC00D::SendInput {U+00CC}
Return

; ALT + - per avere ~
!-::SendInput {U+007E}
Return

; ALT + ' per avere `
!'::SendInput {U+0060}
Return

; ALT + e per avere ə, la schwa
!e::SendInput {U+0259}
Return

;CTRL +ALT + ' per avere ```
^!'::SendInput {U+0060}{U+0060}{U+0060}
Return

; CTRL+ALT+V per incollare testo rimuovendo a capo e doppi spazi
^!v::
    ClipSaved := ClipboardAll  ; Salva il contenuto attuale degli appunti
    ; Sostituisce gli a capo con spazi e riduce i multi spazi a uno spazio singolo
    Clipboard := RegExReplace(RegExReplace(Clipboard, "\r?\n", " "), " {2,}", " ")
    Send ^v  ; Incolla il testo
    Sleep 50  ; Piccola pausa per assicurare che il testo sia incollato
    Clipboard := ClipSaved  ; Ripristina il contenuto originale degli appunti
    ClipSaved :=  ; Pulisce la variabile temporanea
Return

; CTRL + F12 per convertire testo in clipboard in snake_case e incollarlo
^F12::
    ; Leggi il testo dalla clipboard
    clipboardText := Clipboard
    
    ; Se la clipboard è vuota, non fare nulla
    if (clipboardText = "")
        Return
    
    ; Converti in snake_case
    snakeCaseText := ConvertToSnakeCase(clipboardText)
    
    ; Incolla il testo convertito
    SendInput, %snakeCaseText%
Return

; WIN + SHIFT + F12 oppure CTRL + SHIFT + F12 per convertire testo in clipboard in kebab-case e incollarlo
#+F12::
^+F12::
    ; Leggi il testo dalla clipboard
    clipboardText := Clipboard

    ; Se la clipboard è vuota, non fare nulla
    if (clipboardText = "")
        Return

    ; Converti in kebab-case riusando snake_case (che è già stabile) e sostituendo gli underscore
    kebabCaseText := ConvertToSnakeCase(clipboardText)
    StringReplace, kebabCaseText, kebabCaseText, _, -, All

    ; Se conversione vuota, segnala e interrompi
    if (kebabCaseText = "") {
        TrayTip, Shortcuts KWH, Conversione vuota dopo kebab-case, 1
        Return
    }

    ; Incolla direttamente il testo convertito (senza usare la clipboard)
    ; {Text} evita problemi con caratteri speciali e layout
    SendInput, {Text}%kebabCaseText%
Return

; Funzione per convertire testo in snake_case
ConvertToSnakeCase(inputText) {
    ; Converti tutto in minuscolo
    StringLower, lowerText, inputText
    
    ; Sostituisci spazi, trattini e altri separatori comuni con underscore
    ; Prima gestisci camelCase inserendo underscore prima delle lettere maiuscole
    camelCaseHandled := RegExReplace(lowerText, "([a-z])([A-Z])", "$1_$2")
    
    ; Sostituisci spazi, trattini, punti e altri separatori con underscore
    normalized := RegExReplace(camelCaseHandled, "[\s\-\.]+", "_")
    
    ; Rimuovi caratteri speciali non alfanumerici (eccetto underscore)
    cleaned := RegExReplace(normalized, "[^a-z0-9_]", "")
    
    ; Gestisci underscore multipli consecutivi
    singleUnderscore := RegExReplace(cleaned, "_+", "_")
    
    ; Rimuovi underscore all'inizio e alla fine
    finalText := RegExReplace(singleUnderscore, "^_+|_+$", "")
    
    return finalText
}

; Create a README.md file in the current Explorer folder, clicking CTRL + ALT + M
!^m::
if WinActive("ahk_class CabinetWClass") ; explorer
{
    ; Get the path of the active Explorer window
    for window in ComObjCreate("Shell.Application").Windows
    {
        try {
            if (window.HWND = WinExist("A"))
            {
                Fullpath := window.Document.Folder.Self.Path
                break
            }
        }
    }

    ; Check if README.md already exists
    if !FileExist(Fullpath . "\README.md")
        FileAppend,, %Fullpath%\README.md

    Run, %Fullpath%\README.md
}
Return

; Create New File in current folder with ALT + N
; the source is https://gist.github.com/TheBeastOfCaerbannog/4bc8c8f4965a9f53318aca9b9d26fe53

; This is part of my AutoHotKey [1] script. When you are in Windows Explorer it
; allows you to press Alt+N and type a filename, and that file is created
; in the current directory and opened in the appropriate edito.
; Credit goes to aubricus [2] who wrote most of this and davejamesmiller [3] who
; added the 'IfWinActive' check and 'Run %UserInput%' at the end. Also to
; syon [4] who changed regexp to make script work on non-english versions
; of Windows. And I changed the way how script gets full path to make it
; compatible with Windows 10 and also changed hotkey to Alt+N

; [1]: http://www.autohotkey.com/
; [2]: https://gist.github.com/1148174
; [3]: https://gist.github.com/1965432
; [4]: https://github.com/syon/ahk/blob/master/NewFile/NewFile.ahk


; Only run when Windows Explorer or Desktop is active
; Alt+N
#IfWinActive ahk_class CabinetWClass
!n::
#IfWinActive ahk_class ExploreWClass
!n::
#IfWinActive ahk_class Progman
!n::
#IfWinActive ahk_class WorkerW
!n::
    ; Get the path of the active Explorer window (same method as CTRL+ALT+M)
    for window in ComObjCreate("Shell.Application").Windows
    {
        try {
            if (window.HWND = WinExist("A"))
            {
                FullPath := window.Document.Folder.Self.Path
                break
            }
        }
    }
    
    ; If no path found (e.g., on Desktop), use Desktop path
    if (FullPath = "")
    {
        FullPath := A_Desktop
    }

    ; Change working directory
    SetWorkingDir, %FullPath%

    ; An error occurred with the SetWorkingDir directive
    If ErrorLevel
    {
        MsgBox, ERROR: Cannot set working directory to %FullPath%
        Return
    }

    ; Display input box for filename
    InputBox, UserInput, New File, , , 400, 100, , , , ,

    ; User pressed cancel
    If ErrorLevel
        Return

    ; Check if file already exists
    If FileExist(UserInput)
    {
        MsgBox, 4, File Exists, File already exists. Open it?
        IfMsgBox Yes
            Run %UserInput%
        Return
    }

    ; Create file
    FileAppend, , %UserInput%

    ; Open the file in the appropriate editor
    Run %UserInput%

    Return

#IfWinActive
