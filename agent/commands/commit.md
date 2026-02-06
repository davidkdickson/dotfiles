# Commit

## Overview
Create a well-structured git commit using the Conventional Commits specification. 

<type>(optional scope): <Description>

[optional body]

[optional footer(s)]

The type of the commit can be (feat, fix, or chore). The Description should be in sentence-case.

## Steps
1. **Come up with a good commit message**
   - Summarize change clearly using <type>(optional scope): <Description>
   - Follow Conventional Commit specification
   - Do NOT include Co-Authored-By or any agent attribution in the commit message

3. **Run git commit**
   - Run git commit using `git commit -e -m` 
   - This allows review of the message in my default editor
