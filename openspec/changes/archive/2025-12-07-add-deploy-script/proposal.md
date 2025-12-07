# Add Deployment Script Proposal

## Summary
Create a bash deployment script that copies the main AutoHotkey script file to the deployment directory in Windows filesystem.

## User Request
"crea uno script di deploy in bash che copia @start@aborruso.ahk in /mnt/c/github/shortcuts-kwh" (create a bash deployment script that copies @start@aborruso.ahk to /mnt/c/github/shortcuts-kwh)

## Current State
The project currently provides:
- Manual file copying for deployment
- No automated deployment mechanism
- Target directory exists at `/mnt/c/github/shortcuts-kwh/`

## Proposed Change
Add a bash deployment script that:
1. Copies `start@aborruso.ahk` from current directory to `/mnt/c/github/shortcuts-kwh/`
2. Provides feedback on copy operation success/failure
3. Handles edge cases (file not found, target directory issues)
4. Can be executed from the project root

## Key Questions
- Should the script be executable with proper permissions?
- Should it include backup functionality for existing files?
- Should it validate the copy operation?
- Should it handle multiple files or just the main script?

## Implementation Approach
- Create simple bash script with error handling
- Use standard Unix commands (cp, echo, test)
- Follow bash scripting best practices
- Include Italian comments following project conventions