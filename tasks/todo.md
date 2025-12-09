# TODO: Add CTRL+ALT+V shortcut

## Phase 1: Code Changes

- [x] Add CTRL+ALT+V shortcut to start@aborruso.ahk
  - Paste clipboard text with newlines removed and double spaces reduced
- [x] Fix unused ConvertToKebabCase() function (removed)
- [x] Fix CTRL+ALT+M error handling (added try-catch)

## Phase 2: Documentation

- [x] Update README.md with new shortcut
- [x] Update CLAUDE.md line numbers and descriptions

## Phase 3: Release

- [x] Compile new exe (deploy.sh --compile)
- [x] Create git tag v0.6
- [x] Push tag to GitHub
- [x] Create release v0.6 with assets

## Shortcut Behavior

**CTRL+ALT+V**: Paste clipboard text with cleanup:
- Replace newlines with spaces
- Reduce multiple spaces to single space
- Restore original clipboard after paste

## Review

Successfully released v0.6 with all changes:

### New Feature
- Added CTRL+ALT+V shortcut for pasting cleaned text (lines 55-64)

### Code Improvements
- Removed unused `ConvertToKebabCase()` function (~22 lines)
- Added error handling to CTRL+ALT+M with try-catch block
- Updated CLAUDE.md with correct line numbers

### Release
- Published GitHub release: https://github.com/aborruso/shortcuts-kwh/releases/tag/v0.6
- Uploaded exe and source .ahk as assets
- Updated LOG.md with all changes
