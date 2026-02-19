# Operation Playbook v1

## Standard Flow
1. Create/refine epic in `todo/`; commit epic refinement.
2. Generate stories in `todo/`; commit story creation.
3. Implement one story.
4. Close story (move to archive + atomic commit) according to `execution_mode`:
   - `step_by_step`: wait for confirmation before commit and before starting the next story.
   - `continuous`: commit closure and continue automatically.
5. Repeat for remaining stories.
6. Close epic (mark Done + move epic + commit).

## Example Closure Commands

```bash
mv <todo_dir>/story-<id>-<topic>.md <archive_dir>/<EPIC_ID>/story-<id>-<topic>.md

git add <implementation files> \
        <archive_dir>/<EPIC_ID>/story-<id>-<topic>.md \
        <todo_dir>/story-<id>-<topic>.md

git commit -m "docs(planning): complete <STORY_ID> <short-title>"
```
