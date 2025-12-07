# Tasks for Add Snake Case Shortcut

## Implementation Tasks

1. **Research and Design**
   - [x] Determine optimal key combination (CTRL + WIN + s)
   - [x] Define snake_case conversion rules (handle spaces, hyphens, camelCase, special characters)
   - [x] Test clipboard access patterns in AutoHotkey

2. **Core Implementation**
   - [x] Implement clipboard reading function
   - [x] Create snake_case conversion function
   - [x] Add CTRL + WIN + s hotkey definition and paste functionality
   - [x] Add Italian comments following project conventions

3. **Testing and Validation**
   - [x] Test with various text formats (camelCase, PascalCase, spaces, hyphens)
   - [x] Test in different applications (notepad, browsers, IDEs)
   - [x] Verify no conflicts with existing shortcuts
   - [x] Test edge cases (empty clipboard, special characters, numbers)

4. **Documentation**
   - [x] Update README.md with new shortcut
   - [x] Update project.md shortcuts reference
   - [x] Add inline comments in Italian

## Dependencies
- None (uses existing AutoHotkey clipboard functionality)

## Validation Criteria
- ALT + WIN + s converts "MyVariableName" to "my_variable_name"
- ALT + WIN + s converts "some text here" to "some_text_here"
- Shortcut works in text editors, browsers, and IDEs
- No interference with existing system shortcuts