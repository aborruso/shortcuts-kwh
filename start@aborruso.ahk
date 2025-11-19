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

; ALT + è per avere È
!è::SendInput {U+00C8}
Return

; ALT + - per avere ~
!-::SendInput {U+007E}
Return

; ALT + à per avere À
!à::SendInput {U+00C0}
Return

; ALT + ì per avere Ì
!ì::SendInput {U+00CC}
Return

; ALT + ' per avere `
!'::SendInput {U+0060}
Return

; ALT + ò per avere Ò
!ò::SendInput {U+00D2}
Return

; ALT + ù per avere Ù
!ù::SendInput {U+00D9}
Return

; ALT + e per avere ə, la schwa
!e::SendInput {U+0259}
Return

;CTRL +ALT + ' per avere ```
^!'::SendInput {U+0060}{U+0060}{U+0060}
Return

; Create a README.md file in the current Explorer folder, clicking CTRL + ALT + M
!^m::
if WinActive("ahk_class CabinetWClass") ; explorer
{
    ; Get the path of the active Explorer window
    for window in ComObjCreate("Shell.Application").Windows
    {
        if (window.HWND = WinExist("A"))
        {
            Fullpath := window.Document.Folder.Self.Path
            break
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
