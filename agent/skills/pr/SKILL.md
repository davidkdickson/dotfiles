---
name: pr
description: Create a concise pull request with conventional commit title, summary, and labels
disable-model-invocation: true
allowed-tools: Bash, Read, Grep
---

# Create PR

Create a concise pull request using the following template:

# Title - in the format <type>(optional scope): <Title> where the title focuses on the "why" behind the change, not a description of what was changed
## Summary - one or two sentences on why this change exists (the motivation/problem).
## Changes - A short bullet list of what changed, only enough to orient a reviewer.

Also add labels depending on the branch. Labels available are feat, fix and chore. Assign the PR to me.
The title should be in sentence case.

## Steps
1. **Write PR description**
   - Summarize changes clearly and concisely
   - Include context and motivation when it makes sense
   - Do NOT include Co-Authored-By or any agent attribution in the PR description

3. **Set up PR**
   - Create PR using `gh pr create` using the following format <type>(optional scope): <Title> where the title captures the "why" behind the change
   - Add appropriate labels (feature, bug or chore)
   - Assign the PR to me
