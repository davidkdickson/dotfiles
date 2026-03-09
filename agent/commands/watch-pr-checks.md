# Watch PR Checks

## Overview
Watch the current pull request's checks and notify when they complete.

## Steps
1. **Watch PR checks** - Run `gh pr checks --watch` in the background to wait until all checks complete
2. **Report result** - Once the command finishes, read the output and tell me whether the checks passed or failed
3. **Show comments** - Run both of these and summarize any findings:
   - `gh pr view --comments --json comments` for issue-level comments
   - `gh pr view --json reviews --jq '.reviews[].body'` and `gh api repos/{owner}/{repo}/pulls/{pr_number}/comments --jq '.[].body'` for review comments (line-level comments from bots like Bugbot)
