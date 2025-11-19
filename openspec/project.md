# Project Context

## Purpose
Windows keyboard shortcuts utility using AutoHotkey to enhance productivity with special character shortcuts and file creation utilities. Specifically designed for Italian keyboard users and developers who need quick access to special characters and file operations. Personalized configuration for @aborruso's workflow.

## Tech Stack
- AutoHotkey (AHK) - Windows automation scripting language
- Windows Explorer integration
- Compiled executable for standalone distribution

## Project Conventions

### Code Style
- AutoHotkey v1 syntax
- Italian comments for describing shortcuts (maintaining original author's language)
- Hotkey definitions use ALT (`!`) and CTRL+ALT (`^!`) modifiers
- Unicode character codes (e.g., `{U+00C8}`) for special characters
- Clear section comments separating different functionality groups

### Architecture Patterns
- Single-instance script (`#SingleInstance Force`)
- Persistent keyboard hook (`#installKeybdHook`, `#Persistent`)
- Context-sensitive hotkeys using `#IfWinActive` for Explorer-specific functionality
- COM object integration with Windows Shell for Explorer window interaction

### Testing Strategy
- Manual testing on Windows systems (Windows 7, 10, 11 compatibility)
- Verify hotkeys in different contexts (Explorer, Desktop, general applications)
- Test compiled executable vs source script
- Ensure shortcuts don't interfere with existing system/application hotkeys
- Validate Unicode character output in various applications (text editors, browsers, Office)

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
  - Quick README.md creation (CTRL+ALT+M) in current Explorer folder
  - New file creation (ALT+N) with immediate opening in default editor
- **Explorer Integration**: File creation shortcuts only active when Windows Explorer/Desktop is active

## Shortcuts Reference

### Special Characters
- `ALT + è` → È (uppercase E with grave accent)
- `ALT + à` → À (uppercase A with grave accent)
- `ALT + ì` → Ì (uppercase I with grave accent)
- `ALT + ò` → Ò (uppercase O with grave accent)
- `ALT + ù` → Ù (uppercase U with grave accent)
- `ALT + e` → ə (schwa, for inclusive language)
- `ALT + -` → ~ (tilde, for Unix paths)
- `ALT + '` → ` (backtick, for markdown/shell)
- `CTRL + ALT + '` → ``` (triple backticks, for markdown code blocks)

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

## External Dependencies
- Windows Shell Application COM object (`Shell.Application`)
- Windows Explorer (`ahk_class CabinetWClass`, `ExploreWClass`, `Progman`, `WorkerW`)
- Credits: Script incorporates community contributions from:
  - aubricus (original new file creation)
  - davejamesmiller (IfWinActive check)
  - syon (non-English Windows compatibility)
