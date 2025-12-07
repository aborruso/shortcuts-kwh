# Add AutoHotkey v2 Version

## Why
AutoHotkey v2 introduces breaking syntax changes and modern features. Users may prefer or require v2 for compatibility with newer Windows versions or other v2 scripts. Maintaining both versions allows gradual migration without forcing users to update immediately.

## What Changes
- Create `start@aborruso_v2.ahk` with AutoHotkey v2 syntax
- Convert all existing shortcuts to v2 syntax
- Update `compile.bat` to support compiling both versions
- Update `deploy.sh` to deploy both v1 and v2 scripts
- Update documentation to clarify v1/v2 differences and usage

Key syntax migrations:
- `StringLower, var, input` → `var := StrLower(input)`
- Function syntax modernization
- Assignment operator changes (`:=` required)
- Updated `SendInput` syntax

## Impact
- Affected files:
  - New: `start@aborruso_v2.ahk`
  - Modified: `compile.bat`, `deploy.sh`, `README.md`, `CLAUDE.md`, `openspec/AGENTS.md`, `openspec/project.md`
- No breaking changes to existing v1 script
- Users can choose which version to use
- Testing deferred (user requested no testing for now)