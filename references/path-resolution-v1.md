# Path Resolution v1

Resolution order:
1. explicit config
2. value derived from `planning_root`
3. hard default

Normalization:
- resolve as repo-relative paths
- reject `..` traversal outside repo

Missing-folder policy:
- if `allow_auto_create_dirs=true`: create missing `todo`, `archive`, `blueprints`
- if `allow_auto_create_dirs=false`: error with missing path list

Missing-file bootstrap policy:
- when initializing workflow in a new project, create missing starter files:
  - `<specs_file>`
  - `<planning_readme_file>`

Deterministic archive targets:
- story: `<archive_dir>/<EPIC_ID>/<story-filename>.md`
- epic: `<archive_dir>/<EPIC_ID>/<epic-filename>.md`

Non-path behavior defaults:
- `execution_mode` defaults to `step_by_step` when not explicitly configured
