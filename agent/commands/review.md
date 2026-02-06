# Review

## Overview
Review the current diff for bugs, security issues, and code quality concerns.

## Steps
1. **Gather changes**
   - Run `git diff` to see unstaged changes
   - Run `git diff --cached` to see staged changes
   - If no local changes exist, diff against the base branch

2. **Review for issues**
   - Bugs and logic errors
   - Security vulnerabilities (injection, auth issues, data exposure)
   - Edge cases and error handling gaps
   - Performance concerns

3. **Provide feedback**
   - List issues by severity (critical, warning, suggestion)
   - Reference specific files and line numbers
   - Suggest a fix for each issue
   - If no issues found, confirm the changes look good
