---
name: planning-workflow
description: Use this skill when the user wants to run a structured planning workflow in any repository (create/refine epic, generate small stories, implement and close stories with atomic commits, and close the epic). Applies to project-agnostic planning setups with configurable planning paths and execution modes.
---

# Planning Workflow Skill

Use this skill when users ask to set up or operate a planning workflow across epics/stories in a repository.

## What This Skill Does

- Creates/refines planning epics.
- Breaks epics into small stories (target 3-5 points).
- Enforces one-story-at-a-time implementation.
- Enforces closure discipline:
  - story must be moved from `todo/` to `archive/<EPIC_ID>/`
  - implementation changes and moved story file must be committed together
- Closes epic only after all stories are archived.

## Config (v1)

Use these config keys (with defaults):

- `planning_root` default: `docs/planning`
- `todo_dir` default: `<planning_root>/todo`
- `archive_dir` default: `<planning_root>/archive`
- `blueprints_dir` default: `<planning_root>/blueprints`
- `specs_file` default: `<planning_root>/SPECS.md`
- `planning_readme_file` default: `<planning_root>/README.md`
- `allow_auto_create_dirs` default: `true`
- `execution_mode` default: `step_by_step` (`step_by_step` or `continuous`)

Use repository-root `docs/planning` unless the project has an established docs convention.

For full config/validation details, read:
- `references/config-contract-v1.md`
- `references/path-resolution-v1.md`

## Operating Procedure

1. Refine epic in `todo/`.
2. Generate ordered small stories in `todo/` and commit story creation.
3. Implement one story.
4. Mark story `done`, move it to `archive/<EPIC_ID>/`, commit code+move together. Respect `execution_mode`:
   - `step_by_step`: wait for user confirmation before commit and before starting the next story.
   - `continuous`: commit closure atomically, then continue to the next story automatically.
5. Repeat until all stories are closed.
6. Mark epic `Done`, move epic to `archive/<EPIC_ID>/`, commit closure.

For details and examples, read:
- `references/operation-playbook-v1.md`

## Required Story/Epic Quality

Before implementation:
- Epic passes quality gate.
- Stories contain metadata, goal, scope, acceptance criteria, deliverables.

Before story closure:
- Story has `Implementation Notes`.
- Story has `Test Evidence` or `Test impact: N/A` for docs-only.

Use templates/checklists:
- `references/templates-and-checklists-v1.md`

## Guardrails

- One story in progress at a time.
- No completed story remains in `todo/`.
- No close without acceptance evidence.
- Do not split story move and implementation changes across separate commits.

## Notes for Cross-Project Reuse

- Keep all paths config-driven.
- Avoid project-domain terms in templates/examples unless user asks.
- If a project has different folder conventions, map them via config and proceed.
