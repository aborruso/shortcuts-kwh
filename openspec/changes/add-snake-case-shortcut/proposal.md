# Add Snake Case Shortcut Proposal

## Summary
Add a keyboard shortcut to convert clipboard text to snake_case format and paste it.

## User Request
"aggiungere uno shortcut per incollare in snake case il testo che si ha in memoria" (add a shortcut to paste in snake case the text that is in memory)

## Current State
The script currently provides:
- Special character shortcuts (ALT + key combinations)
- File creation utilities (CTRL+ALT+M, ALT+N)
- Developer utilities (tilde, backticks)

## Proposed Change
Add a new shortcut (ALT + WIN + s) that:
1. Reads text from clipboard
2. Converts it to snake_case format
3. Pastes the converted text at cursor position

## Key Questions
- What key combination should be used? (ALT + WIN + s chosen to avoid Windows conflicts)
- Should this work globally or only in specific applications?
- What conversion rules for snake_case? (spaces to underscores, lowercase, handle special chars)

## Implementation Approach
- Use AutoHotkey clipboard manipulation
- String transformation logic
- Follow existing code patterns and conventions