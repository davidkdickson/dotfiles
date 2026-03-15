---
name: todo-opez-add
description: Add a new todo item to the "💥 Todo: Opez" Apple Notes note
allowed-tools: mcp__apple-notes__get_note_content, mcp__apple-notes__update_note_content, AskUserQuestion
---

# Add Todo Item to Opez

Add a single todo item to the "💥 Todo: Opez" Apple Notes note.

## Steps

1. Parse the user's message for the todo item (e.g., `/todo-opez-add fix the login bug in tenant settings`)
2. Read the current note named "💥 Todo: Opez" using `mcp__apple-notes__get_note_content`
3. Classify the item into one of the 5 types:
   - `feat` — new functionality
   - `bug` — broken behavior to fix
   - `chore` — tech debt, refactoring, maintenance, security, admin
   - `outreach` — people, networking, emails
   - `question` — items needing answers from others
4. Default section to **Someday** unless the user explicitly says "now" or indicates urgency
5. Rewrite the description to be clear and actionable — include enough context that Claude could complete the task without further clarification (the what, where, and expected behavior)
6. Check for duplicates — compare the new item against existing items in both sections. If a semantically similar item already exists (same intent, not just exact text match), show the existing item and ask the user whether to skip, replace, or add anyway
7. Show the user the formatted item (`- <type>: <description>`) and which section it will go in; ask for confirmation
8. Once confirmed, append the item to the end of the correct section's `<ul>` list
9. Update the note using `mcp__apple-notes__update_note_content`
10. Remind the user to re-add smart tags if needed (e.g. `#Todo`)

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
