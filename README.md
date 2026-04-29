# gitwf-listener

Receives GitHub Actions dispatch events from `gitwf-dispatcher`.

For each event it:
1. Creates a new branch (`log/<dispatch_type>-<run_id>`)
2. Runs `scripts/append-timestamp.sh` to log the event
3. Opens a PR targeting `main`

Supports two dispatch mechanisms:
- `repository_dispatch` — see `.github/workflows/on-repository-dispatch.yml`
- `workflow_dispatch` — see `.github/workflows/on-workflow-dispatch.yml`
