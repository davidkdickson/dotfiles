# Merge PR

## Steps
1. **Get current branch name** - Run `git branch --show-current` and save it
2. **Approve the PR** - Run `gh pr review --approve`
3. **Switch to main** - Run `git checkout main`
4. **Pull latest** - Run `git pull`
5. **Delete local branch** - Run `git branch -D <branch-name>` using the branch name from step 1
