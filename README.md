# planning-workflow

Reusable Codex skill for structured epic/story planning in any repository.

## What You Get

- `SKILL.md` with workflow instructions.
- Config + path-resolution references.
- Templates and closure checklist.
- Command playbook.

## Install (Local Codex)

Recommended:

- Run `make install-skill` from this repository.

This installs or updates the skill at:

- `~/.codex/skills/planning-workflow/`

Manual alternatives:

- Copy this folder to `~/.codex/skills/planning-workflow/`, or
- Keep this repo and symlink it to that location.

## Make Targets

- `make install-skill` to install or update the skill at `~/.codex/skills/planning-workflow` with one command.
- `make validate` to verify required skill files are present.
- `make show-version` to print the current spec version from `VERSION.md`.

## Update Workflow

1. Update docs/spec files in this repo.
2. Run `make validate`.
3. Run `make install-skill` to deploy the latest version locally.

## Default Workflow

1. Initialize planning structure in new projects (`todo/`, `archive/`, `blueprints/`, `SPECS.md`, planning `README.md`).
2. Refine epic in `docs/planning/todo/`.
3. Generate small stories (3-5 points).
4. Implement one story at a time.
5. Close story by moving `todo -> archive/<EPIC_ID>/` in same commit as changes.
6. Close epic after all stories are archived.

## Config Defaults

- `planning_root: docs/planning`
- `todo_dir: docs/planning/todo`
- `archive_dir: docs/planning/archive`
- `execution_mode: step_by_step` (`step_by_step` or `continuous`)

See `references/config-contract-v1.md` for full contract.

## License

MIT
