---
name: watch-deploy
description: Watch the most recent Deploy workflow run and notify when it completes
disable-model-invocation: true
allowed-tools: Bash
---

# Watch Deploy

Watch the most recent Deploy workflow run and notify when it completes.

## Steps
1. **Find the latest deploy run** - Run `gh run list --workflow=deploy.yml --limit=1 --json databaseId,status,url,headBranch,event --jq '.[0]'` to find the latest run
2. **Watch if in progress** - If the run is still in progress, run `gh run watch <id> --exit-status` in the background and wait for it to complete
3. **Report result** - Tell me whether the deploy passed or failed, show the run URL, and summarize which jobs ran (e.g. which components were deployed)
