# LOG

## 2026-01-29

- Website: add step-by-step install + EXE release link

## 2025-12-09

- Open issue #8: VoiceAccess.exe not closing with TASKKILL command
- Fix VoiceAccess: close process with TASKKILL (bar cannot be hidden/minimized, only closed)
- Remove debug logging (voiceaccess_debug.log)
- Released v0.7: Remove custom tray menu (encoding issues with Italian chars)
- Add help modal with CTRL+ALT+H shortcut and tray menu access
- Add tray menu with Show Help, Reload Script, Exit options
- Add Windows SmartScreen warning documentation to README
- Released v0.6: CTRL+ALT+V paste cleanup & code fixes
- Add CTRL+ALT+V shortcut (paste with newlines removed and spaces normalized)
- Remove unused ConvertToKebabCase() function
- Add error handling (try-catch) to CTRL+ALT+M shortcut
- Released v0.5: Italian chars fix & kebab-case hotkey
- Fix Italian character shortcuts using scan codes (SC01A, SC027, SC028, SC02B, SC00D)
- Enable uppercase È, À, Ò, Ù, Ì with ALT key combinations
- Add Ctrl+Shift+F12 hotkey for kebab-case
- Enhance CLAUDE.md with development commands, architecture overview, AutoHotkey v1 constraints
- Add deployment workflow documentation
