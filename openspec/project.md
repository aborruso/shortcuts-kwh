# Project Context

## Purpose
Windows keyboard shortcuts utility using AutoHotkey to enhance productivity with special characters, text transforms, and file creation utilities. Designed for Italian keyboard users and developers who need quick access to special characters and fast file operations. Personalized configuration for @aborruso's workflow, plus a built-in help modal and tray menu.

## Tech Stack
- AutoHotkey v1 (AHK) - Windows automation scripting language
- Windows Explorer/desktop integration via Shell.Application COM
- Compiled executable via Ahk2Exe
- WSL deploy script for Windows copy/backup

## Project Conventions

### Code Style
- AutoHotkey v1 syntax (command-style, not v2 expression style)
- Semicolons `;` for comments
- Italian comments for describing shortcuts (maintaining original author's language)
- Hotkey definitions use ALT (`!`), CTRL (`^`), WIN (`#`), SHIFT (`+`)
- Italian special keys use scan codes (e.g., `SC01A`) to avoid layout/encoding issues
- `SendInput` with Unicode `{U+XXXX}` for special characters
- File encoding: UTF-8 with BOM or ANSI for Windows compatibility
- Clear section comments separating different functionality groups

### Architecture Patterns
- Single-instance script (`#SingleInstance Force`)
- Persistent keyboard hook (`#installKeybdHook`, `#Persistent`)
- Context-sensitive hotkeys using `#IfWinActive` for Explorer-specific functionality
- COM object integration with Windows Shell for Explorer window interaction
- Periodic process check via `SetTimer` (closes VoiceAccess if running)
- Simple GUI help modal (`Gui, Help:*`) and tray menu actions

### Testing Strategy
- Manual testing on Windows systems (Windows 7, 10, 11 compatibility)
- Verify hotkeys in different contexts (Explorer, Desktop, general applications)
- Test compiled executable vs source script
- Ensure shortcuts don't interfere with existing system/application hotkeys
- Validate Unicode character output in various applications (text editors, browsers, Office)
- Validate clipboard-based transforms (clean paste, snake_case, kebab-case)
- Verify help modal and tray menu actions

### Git Workflow
- Personal utility project
- Direct commits to main branch
- Version updates when adding new shortcuts or fixing bugs

## Domain Context
- **Italian Keyboard Layout**: Shortcuts primarily for Italian special characters (È, À, Ì, Ò, Ù)
- **Schwa Character**: Special support for `ə` (schwa) via ALT+E for inclusive language
- **Developer Utilities**: Common developer characters and operations
  - Tilde `~` (ALT+-) for Unix paths and home directory
  - Backtick `` ` `` (ALT+') for markdown inline code and shell commands
  - Triple backticks (CTRL+ALT+') for markdown code blocks
  - Clean paste (CTRL+ALT+V) to remove newlines and collapse double spaces
  - Clipboard text transforms (snake_case, kebab-case)
  - Quick README.md creation (CTRL+ALT+M) in current Explorer folder
  - New file creation (ALT+N) with immediate opening in default editor
- **Help & UX**: In-app shortcut reference modal and tray menu
- **Explorer Integration**: File creation shortcuts only active when Windows Explorer/Desktop is active

## Shortcuts Reference

### Special Characters
- `ALT + è` → È (uppercase E with grave accent, scan code)
- `ALT + à` → À (uppercase A with grave accent, scan code)
- `ALT + ì` → Ì (uppercase I with grave accent, scan code)
- `ALT + ò` → Ò (uppercase O with grave accent, scan code)
- `ALT + ù` → Ù (uppercase U with grave accent, scan code)
- `ALT + e` → ə (schwa, for inclusive language)
- `ALT + -` → ~ (tilde, for Unix paths)
- `ALT + '` → ` (backtick, for markdown/shell)
- `CTRL + ALT + '` → ``` (triple backticks, for markdown code blocks)

### Text Transformation
- `CTRL + F12` → Convert clipboard text to snake_case and paste it
- `WIN + SHIFT + F12` → Convert clipboard text to kebab-case and paste it
- `CTRL + SHIFT + F12` → Convert clipboard text to kebab-case and paste it
- `CTRL + ALT + V` → Paste clipboard text without newlines and double spaces

### Help & Reference
- `CTRL + ALT + H` → Show quick reference modal
- Tray icon right-click → Help, reload, exit

### File Operations (Explorer/Desktop only)
- `CTRL + ALT + M` → Create README.md in current folder and open it
- `ALT + N` → Prompt for filename, create file in current folder

## Important Constraints
- Windows-only functionality (no cross-platform support)
- Requires AutoHotkey runtime or compiled executable
- Must maintain single instance to prevent hotkey conflicts
- Hotkeys must not conflict with system or common application shortcuts
- File operations require Explorer/Desktop window to be active
- Script filename pattern: `start@username.ahk` for personalization
- Italian special keys require scan codes for reliability across layouts

## Deployment
- **Deployment Script**: `deploy.sh` automates copying script to Windows filesystem via WSL
- **Target Directory**: `/mnt/c/github/shortcuts-kwh/` (Windows C: drive mapped in WSL)
- **Backup Strategy**: Automatic backup of existing files with timestamp
- **Error Handling**: Comprehensive validation and user feedback in Italian

## External Dependencies
- Windows Shell Application COM object (`Shell.Application`)
- Windows Explorer (`ahk_class CabinetWClass`, `ExploreWClass`, `Progman`, `WorkerW`)
- Credits: Script incorporates community contributions from:
  - aubricus (original new file creation)
  - davejamesmiller (IfWinActive check)
  - syon (non-English Windows compatibility)
