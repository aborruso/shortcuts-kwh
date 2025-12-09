# TODO: Release v0.5

## Phase 1: Prepare Release

- [x] Compile fresh exe with latest changes (deploy.sh --compile)
- [x] Create git tag v0.5
- [x] Push tag to GitHub

## Phase 2: Create GitHub Release

- [x] Create release v0.5 via gh CLI
- [x] Upload exe as asset
- [x] Upload source .ahk as asset

## Summary of changes for v0.5

After v0.4 (2025-12-07):
- 178f3ae: Fix Italian character shortcuts and improve docs
- 58b5211: Fix kebab-case hotkey and add Ctrl+Shift+F12
- 80df9b0: Add KWH acronym explanation to README

## Review

Successfully released v0.5 with all assets:
- Compiled fresh exe with latest changes
- Created and pushed tag v0.5
- Published GitHub release: https://github.com/aborruso/shortcuts-kwh/releases/tag/v0.5
- Uploaded exe and source .ahk as release assets
- Updated LOG.md

Release includes:
- Fixed Italian character shortcuts (È, À, Ì, Ò, Ù) with scan codes
- New Ctrl+Shift+F12 hotkey for kebab-case conversion
- Documentation improvements
