# Cleanup

## Overview
Clean up local branches after a pull request has been merged.

## Steps
1. **Switch to main branch**
   - Checkout the main/master branch
   - Pull the latest changes

2. **Delete the local branch**
   - Delete the merged branch locally using `git branch -d` (never use `-D` force delete)

3. **Prune remote tracking branches**
   - Run `git remote prune origin` to remove stale remote tracking references
