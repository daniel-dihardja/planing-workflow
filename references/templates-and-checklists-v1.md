# Templates and Checklists v1

## Epic Template (minimal)

```md
# Epic: <Epic Name>

## Epic ID
EPIC-<DOMAIN>-<TOPIC>

## Owner
<owner>

## Status
Draft

## Goal
<single outcome>

## In Scope
- <item>

## Out of Scope
- <item>

## Story List
1. **<ID>: <name>**
- <purpose>

## Acceptance Criteria
- <verifiable outcome>
```

## Story Template (minimal)

```md
# Story <id>: <short title>

## Story Metadata
- Created Date: YYYY-MM-DD
- Status: `todo`
- Parent: <EPIC_ID>
- Story Points: `3-5`

## Goal
<outcome>

## Scope
- <item>

## Acceptance Criteria
- <verifiable outcome>

## Deliverables
- <artifact>
```

## Story Closure Checklist
- [ ] acceptance criteria met
- [ ] story status set to `done`
- [ ] implementation notes present
- [ ] test evidence present (or `Test impact: N/A`)
- [ ] story moved to `archive/<EPIC_ID>/`
- [ ] code/docs + moved story file committed together
