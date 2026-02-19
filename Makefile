.PHONY: help install-skill validate show-version

SKILL_NAME := planning-workflow
CODEX_HOME ?= $(HOME)/.codex
SKILLS_DIR := $(CODEX_HOME)/skills
TARGET_DIR := $(SKILLS_DIR)/$(SKILL_NAME)

help:
	@echo "Available targets:"
	@echo "  make install-skill  - Install this skill into $$HOME/.codex/skills via symlink"
	@echo "  make validate       - Validate required skill files exist"
	@echo "  make show-version   - Print current spec version from VERSION.md"

install-skill:
	@mkdir -p "$(SKILLS_DIR)"
	@ln -sfn "$(CURDIR)" "$(TARGET_DIR)"
	@echo "Installed: $(TARGET_DIR) -> $(CURDIR)"

validate:
	@test -f SKILL.md || (echo "Missing SKILL.md" && exit 1)
	@test -f agents/openai.yaml || (echo "Missing agents/openai.yaml" && exit 1)
	@test -f references/config-contract-v1.md || (echo "Missing references/config-contract-v1.md" && exit 1)
	@test -f references/path-resolution-v1.md || (echo "Missing references/path-resolution-v1.md" && exit 1)
	@test -f references/operation-playbook-v1.md || (echo "Missing references/operation-playbook-v1.md" && exit 1)
	@test -f references/templates-and-checklists-v1.md || (echo "Missing references/templates-and-checklists-v1.md" && exit 1)
	@test -f VERSION.md || (echo "Missing VERSION.md" && exit 1)
	@echo "Validation passed."

show-version:
	@grep -E "^Current spec version:" VERSION.md | head -n 1
