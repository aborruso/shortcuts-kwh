# Shortcuts KWH - AutoHotkey Utilities

Windows keyboard shortcuts utility using AutoHotkey to enhance productivity with special character shortcuts and file creation utilities.

**KWH** stands for **Keyboard shortcuts for "Windows habens"** (Latin for "Windows having/possessing").

Specifically designed for Italian keyboard users and developers who need quick access to special characters and file operations.

## 🎯 Features

### Special Italian Characters
Quickly type uppercase Italian accented characters that are hard to reach on standard keyboards:

- `ALT + è` → **È** (uppercase E with grave accent)
- `ALT + à` → **À** (uppercase A with grave accent)
- `ALT + ì` → **Ì** (uppercase I with grave accent)
- `ALT + ò` → **Ò** (uppercase O with grave accent)
- `ALT + ù` → **Ù** (uppercase U with grave accent)
- `ALT + e` → **ə** (schwa, for inclusive language)

### Developer Utilities
Common characters and markdown helpers for developers:

- `ALT + -` → **~** (tilde, for Unix paths and home directory)
- `ALT + '` → **`** (backtick, for markdown inline code and shell commands)
- `CTRL + ALT + '` → **```** (triple backticks, for markdown code blocks)
- `CTRL + F12` → Convert clipboard text to snake_case and paste it

### File Creation Shortcuts
Quick file operations in Windows Explorer (only work when Explorer or Desktop is active):

- `CTRL + ALT + M` → Create README.md in current folder and open it
- `ALT + N` → Create new file with custom name in current folder

## 📦 Installation

### Option 1: Use the Compiled Executable (Recommended)
1. Download `start@aborruso.exe`
2. Double-click to run
3. (Optional) Add to Windows Startup folder for automatic launch

### Option 2: Run from Source
1. Install [AutoHotkey v1](https://www.autohotkey.com/download/ahk-install.exe) (**Note: Requires v1, not v2**)
2. Double-click `start@aborruso.ahk` to run
3. (Optional) Add to Windows Startup folder

## 🚀 Deployment

To deploy the script to the Windows filesystem (WSL environment):

```bash
./deploy.sh
```

**Options:**
- `--help, -h` - Show help information
- `--verbose, -v` - Verbose output with detailed information

The script automatically:
- Creates a backup of existing files
- Verifies file integrity after copy
- Provides clear success/error feedback

## 🔨 Compilation

To recompile the script after making changes:

```batch
compile.bat
```

**Requirements:**
- AutoHotkey v1 must be installed (**Note: v2 is not compatible**)
- The script automatically finds `Ahk2Exe.exe` in standard installation locations

## 🛠️ Customization

To create your own personalized version:

1. Copy `start@aborruso.ahk` to `start@yourname.ahk`
2. Edit the file to add/modify shortcuts
3. Update `compile.bat` to use your new filename
4. Compile with `compile.bat`

## 📋 Technical Details

- **Language:** AutoHotkey v1
- **Platform:** Windows only
- **Single Instance:** Only one copy runs at a time to prevent conflicts
- **Persistent:** Runs in background with keyboard hook

## 👥 Credits

This script incorporates community contributions from:
- [aubricus](https://gist.github.com/1148174) - Original new file creation
- [davejamesmiller](https://gist.github.com/1965432) - IfWinActive check
- [syon](https://github.com/syon/ahk/blob/master/NewFile/NewFile.ahk) - Non-English Windows compatibility

## 📄 License

See [LICENSE](LICENSE) file for details.

## 🔗 Links

- [AutoHotkey Official Site](https://www.autohotkey.com/)
- [AutoHotkey Documentation](https://www.autohotkey.com/docs/)

---

**Author:** [@aborruso](https://github.com/aborruso)
