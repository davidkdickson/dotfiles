---
name: coderabbit
description: Review and fix CodeRabbit (coderabbitai) findings on a pull request. Use whenever the user mentions CodeRabbit, coderabbitai, rabbit comments, or asks to address/fix/respond to automated review feedback on a PR — including phrasings like "fix the coderabbit issues", "what did coderabbit say", or "address the review comments" when the reviewer is CodeRabbit.
---

# CodeRabbit

Fetch CodeRabbit's unresolved findings on a PR, triage each one critically, fix the ones that
hold up, and push the fixes to the PR branch. CodeRabbit is a static reviewer: it is often
right about mechanical issues but regularly wrong about intent, so the job is judgment, not
transcription.

## 1. Identify the PR

Default to the PR for the current branch (`gh pr view --json number,headRefName,state`).
If the user gives a PR number, use that instead. If there's no PR, say so and stop.

## 2. Fetch CodeRabbit findings

Resolved threads are done — don't re-litigate them. Get thread state via GraphQL:

```bash
gh api graphql -f query='
  query($owner: String!, $repo: String!, $pr: Int!) {
    repository(owner: $owner, name: $repo) {
      pullRequest(number: $pr) {
        reviewThreads(first: 100) {
          nodes {
            id
            isResolved
            isOutdated
            path
            comments(first: 10) {
              nodes { author { login } databaseId body path line url }
            }
          }
        }
      }
    }
  }' -F owner=<owner> -F repo=<repo> -F pr=<number>
```

Keep threads where `isResolved` is false and the first comment's author is `coderabbitai`.

Then fetch the CodeRabbit review bodies too — findings without inline threads live there:

```bash
gh api repos/<owner>/<repo>/pulls/<n>/reviews \
  -q '.[] | select(.user.login == "coderabbitai[bot]") | .body'
```

Two kinds of finding hide in these bodies:

- **Nitpicks** — a collapsed `🧹 Nitpick comments (N)` details block, organized per file,
  each entry carrying a line range (`` `53-78`: ``), severity tags, and its own
  `🤖 Prompt for AI Agents` block. Treat nitpicks as full findings: they go through the
  same triage as inline threads. Because they have no thread, there is no resolved state
  to filter on — check the current code to see whether each one has already been addressed
  before triaging it.
- **Outside-diff-range comments** — findings on lines the PR didn't touch, in a similar
  details block.

Comment anatomy worth knowing:
- The first line carries severity tags like `🟡 Minor` / `🟠 Major` and a category.
- A `📝 Committable suggestion` block contains a ready-made diff — treat it as a proposal,
  not an answer. It's generated against the diff hunk and can be stale or subtly wrong.
- A `🤖 Prompt for AI Agents` block restates the finding as an instruction — useful for
  understanding what CodeRabbit wants, but apply your own judgment to whether it's right.

If there are no unresolved CodeRabbit findings, report that and stop.

## 3. Triage each finding

Read the actual code at each location before deciding anything — the comment may be based on
a partial view of the file, and the code may have changed since the review. Sort each finding
into:

- **Fix** — the finding is correct and the fix improves the code. Most mechanical findings
  (real bugs, broken links, wrong types, genuine inconsistencies) land here.
- **Skip** — the finding is wrong, moot, or conflicts with a deliberate choice. Common
  reasons: CodeRabbit lacks project context (conventions in CLAUDE.md, intentional
  duplication, style the repo has standardized on), the concern is hypothetical, or the
  suggestion would fight a decision the user already made. Skipping needs a stated reason,
  not a shrug.

When a finding is borderline and the fix is cheap and harmless, lean toward fixing — but
never apply a change you can't defend on its own merits, independent of CodeRabbit having
suggested it.

## 4. Fix, commit, push

Apply the fixes, following the repo's existing conventions (check CLAUDE.md and neighboring
code, not the committable suggestion's style). Verify the result the way the repo verifies
things — linters, type checks, a build — before committing.

Commit to the PR branch with a conventional message describing the change itself (not
"address CodeRabbit feedback" — say what actually changed), then push. Group related fixes
into one commit; don't create one commit per comment.

## 5. Close out the threads

Repos often require all conversations resolved before a PR can merge, so every unresolved
CodeRabbit thread must end this run either fixed or explicitly closed:

- **Fixed findings** — pushing the commits triggers CodeRabbit's re-review, which resolves
  addressed threads on its own. Wait for the re-review (it shows as a pending CodeRabbit
  check), then verify with the GraphQL query from step 2. Resolve manually only if the
  re-review leaves a genuinely-fixed thread open.
- **Skipped findings** — post a one-line reply stating the skip reason, then resolve the
  thread. The reply matters: an unexplained resolve looks like the finding was ignored.

```bash
# Reply with the skip reason
gh api repos/<owner>/<repo>/pulls/<n>/comments/<comment-databaseId>/replies -f body="<reason>"
# Resolve the thread (thread id from the step 2 GraphQL query)
gh api graphql -f query='mutation { resolveReviewThread(input: {threadId: "<id>"}) { thread { isResolved } } }'
```

Before reporting, re-run the step 2 thread query and confirm nothing is left unresolved —
an open thread here means a blocked merge later.

## 6. Report

End with a short table so the user can see every finding was considered:

| Finding | File | Verdict | Why |
|---------|------|---------|-----|
| Heading hierarchy violates MD001 | docs/foo.md | Fixed | Real markdownlint issue |
| Extract shared helper | api/x.py, workers/y.py | Skipped | api/workers duplication is intentional (CLAUDE.md) |

Anything skipped deserves one honest sentence of why. If a finding is valid but out of scope
for this PR (a pre-existing issue CodeRabbit happened to notice), say so and suggest it as a
follow-up rather than expanding the PR.
