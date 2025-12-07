<!-- OPENSPEC:START -->
# OpenSpec Instructions

These instructions are for AI assistants working in this project.

Always open `@/openspec/AGENTS.md` when the request:
- Mentions planning or proposals (words like proposal, spec, change, plan)
- Introduces new capabilities, breaking changes, architecture shifts, or big performance/security work
- Sounds ambiguous and you need the authoritative spec before coding

Use `@/openspec/AGENTS.md` to learn:
- How to create and apply change proposals
- Spec format and conventions
- Project structure and guidelines

Keep this managed block so 'openspec update' can refresh the instructions.

<!-- OPENSPEC:END -->

# AutoHotkey Version

**This project uses AutoHotkey v1**

Important syntax differences from v2:
- Use `StringLower, var, input` instead of `var := StrLower(input)`
- Use `!` for ALT, `^` for CTRL, `#` for WIN, `+` for SHIFT
- Character encoding must be ANSI/UTF-8 compatible
- Italian special characters (è, à, ì, ò, ù) require scan codes (SC) syntax