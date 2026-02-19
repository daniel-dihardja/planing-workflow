# Config Contract v1

Required keys:
- `planning_root`
- `todo_dir`
- `archive_dir`

Optional keys:
- `blueprints_dir`
- `specs_file`
- `planning_readme_file`
- `epic_file_prefix`
- `story_file_prefix`
- `epic_archive_id_pattern`
- `allow_auto_create_dirs`
- `execution_mode`

Defaults:
- `planning_root: docs/planning`
- `todo_dir: docs/planning/todo`
- `archive_dir: docs/planning/archive`
- `blueprints_dir: docs/planning/blueprints`
- `specs_file: docs/planning/SPECS.md`
- `planning_readme_file: docs/planning/README.md`
- `epic_file_prefix: epic-`
- `story_file_prefix: story-`
- `epic_archive_id_pattern: EPIC-<DOMAIN>-<TOPIC>`
- `allow_auto_create_dirs: true`
- `execution_mode: step_by_step`

Validation:
- paths must remain inside repository root
- archive id must follow uppercase hyphen style
- fail fast when `allow_auto_create_dirs=false` and required folders are missing
- `execution_mode` must be one of: `step_by_step`, `continuous`
