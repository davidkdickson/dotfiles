# PR

Manage the pull request for the current branch. Two modes:

- **`/pr`** (default) — create a **draft** PR. Drafts keep CI quiet and don't request review.
- **`/pr ready`** — make the PR ready for review: flip an existing draft (`gh pr ready`), or create it ready-for-review if no PR exists yet, then watch CI.

## PR template
- **Title** — `<type>(optional scope): <Title>`, sentence case, focused on the "why" behind the change, not a description of what changed.
- **Summary** — one or two sentences on why this change exists (the motivation/problem).
- **Changes** — a short bullet list of what changed, only enough to orient a reviewer.

Derive `<type>` (`feat`/`fix`/`chore`) from the branch prefix before `/`. Add the matching label if it exists in the repo, and assign the PR to me. Do NOT include Co-Authored-By or any agent attribution.

## Steps — `/pr` (default, draft)
1. Write the PR description (Summary + Changes).
2. Create the draft PR using `gh pr create --draft` with the conventional title, the matching label if it exists, assigned to me.

## Steps — `/pr ready` (flip to ready)
1. **Preconditions** — ensure local commits are pushed; push if the branch is ahead.
2. **Make it ready**
   - If a draft PR exists for the branch → `gh pr ready`.
   - If it is already ready → report and skip the flip.
   - If no PR exists → create it ready-for-review (`gh pr create` without `--draft`), using the same title/label/assignee logic as the draft path.
3. **Watch checks** — watch the now-running CI checks (the flip triggers them, since CI skips drafts) and report the result.
