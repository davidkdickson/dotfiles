---
name: todos-opez-cleanup
description: Restructure the "💥 Todo: Opez" Apple Notes note into the standard format with typed, sectioned items
allowed-tools: mcp__apple-notes__get_note_content, mcp__apple-notes__update_note_content, AskUserQuestion
---

# Todos Cleanup Opez

Restructure the "💥 Todo: Opez" note to match the standard todo format.

## Standard Format

The note should have two sections with typed, bulleted items:

```
## Now
- feat: Mailbox should be per tenant and how OTP is handled
- bug: Fix issue where saving extracted fields for a newly uploaded K-1 doesn't work

## Someday
- chore: Move to cookies
- outreach: Email Daniel van Andel & Roberto Ramadhin
- question: What year should be set for each K-1
```

### Sections
1. **Now** — items currently being worked on
2. **Someday** — items to work on eventually

### Item Types (5)
- `feat` — new functionality
- `bug` — broken behavior to fix
- `chore` — tech debt, refactoring, maintenance, security, admin
- `outreach` — people, networking, emails
- `question` — items needing answers from others

### Item Format
```
- <type>: <description>
```

## Steps

1. Read the note named "💥 Todo: Opez" using `mcp__apple-notes__get_note_content`
2. Restructure all items into the standard format:
   - Organize into **Now** and **Someday** sections
   - Format each item as `- <type>: <description>`
   - Classify each item into one of the 5 types based on its content
   - Items that don't clearly belong in **Now** default to **Someday**
   - Preserve the meaning of every item — do not drop or merge items
3. Show the user a before/after comparison so they can see what changed
4. Ask the user to confirm before proceeding
5. Once confirmed, update the note using `mcp__apple-notes__update_note_content`

## IMPORTANT: Apple Notes HTML Format

Apple Notes stores content as HTML. When updating, you MUST:
- Use HTML tags, NOT markdown
- **Always include the title** as the first element: `<div><b><span style="font-size: 24px">💥 Todo: Opez</span></b></div>`
- Use `<div><b><span style="font-size: 18px">⚡️ Now</span></b></div>` and `<div><b><span style="font-size: 18px">⏳ Someday</span></b></div>` for section headers
- Use `<ul><li>...</li></ul>` for item lists
- Use `<div><br></div>` for blank lines between sections
- Use `&amp;` for ampersands in text
- Put all HTML on a single line (no newlines) to avoid AppleScript escaping issues
- Apple Notes smart tags (e.g. `#Todo`) are stored as internal metadata, NOT in the HTML body — they cannot be read or written via the MCP tool. After updating, remind the user to re-add any smart tags manually in Apple Notes.
