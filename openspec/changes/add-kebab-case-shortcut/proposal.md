# Change: Add kebab-case text transformation shortcut

## Why
User wants to add a keyboard shortcut for converting clipboard text to kebab-case format, complementing the existing snake_case functionality.

## What Changes
- Add CTRL + SHIFT + F12 shortcut to convert clipboard text to kebab-case and paste it
- Extend text-transformation capability with kebab-case conversion function
- Follow same pattern as existing snake_case implementation

## Impact
- Affected specs: text-transformation
- Affected code: start@aborruso.ahk (add new hotkey and conversion function)