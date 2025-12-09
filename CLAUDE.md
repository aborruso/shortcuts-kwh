# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

<!-- OPENSPEC:START -->
# OpenSpec Instructions

These instructions are for AI assistants working in this project.

Always open `@/openspec/AGENTS.md` when the request:
- Mentions planning or proposals (words like proposal, spec, change, plan)
- Introduces new capabilities, breaking changes, architecture shifts, or big performance/security work
- Sounds ambiguous and you need the authoritative spec before coding

Use `@/openspec/AGENTS.md` to learn:
- How to create and apply change proposals
- Spec format and conventions
- Project structure and guidelines

Keep this managed block so 'openspec update' can refresh the instructions.

<!-- OPENSPEC:END -->

## Project Overview

Windows keyboard shortcuts utility using AutoHotkey v1 for Italian keyboard users and developers. Provides quick access to special characters (È, À, Ì, Ò, Ù, ə, ~, `) and text transformation utilities (snake_case, kebab-case).

## Development Commands

### Compilation
```batch
compile.bat
```
Compiles `start@aborruso.ahk` to `start@aborruso.exe` using Ahk2Exe.exe. Requires AutoHotkey v1 installed.

### Deployment (WSL to Windows)
```bash
./deploy.sh              # Deploy script only
./deploy.sh --compile    # Deploy and compile exe
./deploy.sh --verbose    # Verbose output
```
Copies files from WSL to Windows filesystem at `/mnt/c/github/shortcuts-kwh/`

### Testing
Run the script directly by double-clicking `start@aborruso.ahk` in Windows or executing from Windows Explorer.

## AutoHotkey Version Constraints

**This project uses AutoHotkey v1** (NOT v2)

Critical syntax differences:
- String operations: `StringLower, var, input` NOT `var := StrLower(input)`
- String replacement: `StringReplace, out, in, search, replace, All`
- Hotkey modifiers: `!` (ALT), `^` (CTRL), `#` (WIN), `+` (SHIFT)
- Send text safely: Use `SendInput, {Text}%variable%` to avoid layout issues
- Unicode characters: Use `{U+XXXX}` format (e.g., `{U+00C8}` for È)
- Italian special characters (è, à, ì, ò, ù) require scan code syntax due to encoding issues

## Code Architecture

### Main Script Structure (start@aborruso.ahk)

Single-file architecture with three main sections:

1. **Initialization (lines 13-16)**
   - `#SingleInstance Force` - Prevents multiple instances
   - `#installKeybdHook` - Keyboard hook for shortcuts
   - `#Persistent` - Keeps script running

2. **Keyboard Shortcuts (lines 24-95)**
   - Italian character shortcuts: ALT + è/à/ì/ò/ù → È/À/Ì/Ò/Ù
   - Developer utilities: ALT + `-` → `~`, ALT + `'` → `` ` ``, CTRL+ALT+' → `` ``` ``
   - Clipboard utilities: CTRL+ALT+V (paste with newlines removed and spaces normalized)
   - Text transformation: CTRL+F12 (snake_case), WIN+SHIFT+F12 or CTRL+SHIFT+F12 (kebab-case)

3. **Text Transformation Functions (lines 107-129)**
   - `ConvertToSnakeCase()` - Converts text to snake_case (also used for kebab-case with underscore replacement)

4. **File Creation Utilities (lines 131-233)**
   - CTRL+ALT+M: Create README.md in current Explorer folder
   - ALT+N: Create new file with custom name
   - Uses COM objects to get Explorer window path
   - Only works when Explorer or Desktop is active (`#IfWinActive`)

### Key Technical Patterns

- **COM Object Usage**: Accesses `Shell.Application` to get active Explorer window path
- **Error Handling**: Checks `ErrorLevel` after operations, validates file existence
- **Clipboard Operations**: Reads clipboard for text transformations without modifying it
- **RegEx Transformations**: Uses `RegExReplace()` for text normalization
- **Safe Text Input**: Uses `{Text}` prefix with `SendInput` to prevent special character issues

### Character Encoding Issues

Lines 18-22 show disabled Italian character shortcuts due to encoding problems. When working with special characters:
- Use Unicode escape sequences `{U+XXXX}`
- Consider scan codes for physical key detection
- Test thoroughly on Italian keyboard layout

## File Operations Workflow

File creation utilities follow this pattern:
1. Check if Explorer/Desktop is active window
2. Get current folder path via COM
3. Validate path and permissions
4. Create file or check if exists
5. Open file in default editor

## Customization Pattern

To create personalized versions:
1. Copy `start@aborruso.ahk` to `start@username.ahk`
2. Modify shortcuts and functions
3. Update `SCRIPT_NAME` in `compile.bat`
4. Compile with `compile.bat`

## Important Notes

- The script runs persistently in the background with a keyboard hook
- Only one instance can run at a time due to `#SingleInstance Force`
- File creation shortcuts only work in Windows Explorer or Desktop contexts
- Text transformation reads clipboard but doesn't modify it (pastes directly)
- All paths and file operations are Windows-specific (not WSL)