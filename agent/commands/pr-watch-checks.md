# Watch PR Checks

## Overview
Watch the current pull request's checks and notify when they complete.

## Steps
1. **Watch PR checks** - Run `gh pr checks --watch` in the background to wait until all checks complete
2. **Report result** - Once the command finishes, read the output and tell me whether the checks passed or failed
3. **Show review comments** - Run `gh pr view --comments --json comments` to check for any review comments from bots or reviewers and summarize them
