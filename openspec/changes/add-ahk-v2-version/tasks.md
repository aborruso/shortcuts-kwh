# Tasks for Add AutoHotkey v2 Version

## 1. Script Conversion
- [ ] 1.1 Create `start@aborruso_v2.ahk` from v1 script
- [ ] 1.2 Convert string functions (StringLower → StrLower)
- [ ] 1.3 Update function syntax and assignments
- [ ] 1.4 Convert SendInput to v2 syntax
- [ ] 1.5 Update RegExReplace calls if needed
- [ ] 1.6 Add v2-specific directives (#Requires AutoHotkey v2.0)

## 2. Build System Updates
- [ ] 2.1 Update `compile.bat` to compile both v1 and v2
- [ ] 2.2 Generate `start@aborruso_v2.exe`
- [ ] 2.3 Handle icon resource for v2 executable

## 3. Deployment Updates
- [ ] 3.1 Update `deploy.sh` to deploy both .ahk files
- [ ] 3.2 Add option to deploy v1, v2, or both
- [ ] 3.3 Update file integrity checks for both versions
- [ ] 3.4 Update help text with v2 information

## 4. Documentation
- [ ] 4.1 Update README.md with v1/v2 download links
- [ ] 4.2 Add version comparison table
- [ ] 4.3 Update CLAUDE.md with v2 syntax notes
- [ ] 4.4 Update openspec/AGENTS.md with v2 information
- [ ] 4.5 Update openspec/project.md with dual-version strategy

## Dependencies
- AutoHotkey v2 compiler (Ahk2Exe.exe for v2)
- No testing required per user request

## Validation Criteria
- `start@aborruso_v2.ahk` created with all features from v1
- Both v1 and v2 scripts deployable via `deploy.sh`
- Documentation clearly explains v1 vs v2 usage
- No modifications to existing v1 script functionality