---
name: watch-pr-checks
description: Watch the current pull request's checks and notify when they complete
disable-model-invocation: true
allowed-tools: Bash
---

# Watch PR Checks

Watch the current pull request's checks and notify when they complete.

## Steps
1. **Watch PR checks** - Run `gh pr checks --watch` in the background using `run_in_background: true`. After launching it, tell the user you're watching and **stop responding**. Do NOT poll, sleep, or use TaskOutput to wait — you will be automatically notified when the background task completes.
2. **Report result** - When you receive the background task completion notification, read the output and tell the user whether the checks passed or failed.
3. **Show comments** - Run both of these and summarize any findings:
   - `gh pr view --comments --json comments` for issue-level comments
   - `gh pr view --json reviews --jq '.reviews[].body'` and `gh api repos/{owner}/{repo}/pulls/{pr_number}/comments --jq '.[].body'` for review comments (line-level comments from bots like Bugbot)
