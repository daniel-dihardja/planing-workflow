# planning-workflow

Reusable Codex skill for structured epic/story planning in any repository.

## What You Get

- `SKILL.md` with workflow instructions.
- Config + path-resolution references.
- Templates and closure checklist.
- Command playbook.

## Install (Local Codex)

Copy this folder to:

- `~/.codex/skills/planning-workflow/`

Or keep this repo and symlink it to that location.

## Default Workflow

1. Refine epic in `docs/planning/todo/`.
2. Generate small stories (3-5 points).
3. Implement one story at a time.
4. Close story by moving `todo -> archive/<EPIC_ID>/` in same commit as changes.
5. Close epic after all stories are archived.

## Config Defaults

- `planning_root: docs/planning`
- `todo_dir: docs/planning/todo`
- `archive_dir: docs/planning/archive`
- `execution_mode: step_by_step` (`step_by_step` or `continuous`)

See `references/config-contract-v1.md` for full contract.

## License

MIT
