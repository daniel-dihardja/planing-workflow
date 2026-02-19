.PHONY: help install-skill validate show-version

SKILL_NAME := planning-workflow
CODEX_HOME ?= $(HOME)/.codex
SKILLS_DIR := $(CODEX_HOME)/skills
TARGET_DIR := $(SKILLS_DIR)/$(SKILL_NAME)

help:
	@echo "Available targets:"
	@echo "  make install-skill  - Install or update this skill in $$HOME/.codex/skills"
	@echo "  make validate       - Validate required skill files exist"
	@echo "  make show-version   - Print current spec version from VERSION.md"

install-skill:
	@set -e; \
	mkdir -p "$(SKILLS_DIR)"; \
	src="$$(cd "$(CURDIR)" && pwd -P)"; \
	if [ -L "$(TARGET_DIR)" ]; then \
		link_target="$$(cd "$(TARGET_DIR)" && pwd -P)"; \
		if [ "$$link_target" = "$$src" ]; then \
			echo "Skill already installed via symlink: $(TARGET_DIR) -> $$src"; \
			exit 0; \
		fi; \
	fi; \
	mkdir -p "$(TARGET_DIR)"; \
	if command -v rsync >/dev/null 2>&1; then \
		rsync -a --exclude '.git/' --exclude '.DS_Store' "$(CURDIR)/" "$(TARGET_DIR)/"; \
	else \
		cp -f SKILL.md VERSION.md README.md LICENSE .gitignore Makefile "$(TARGET_DIR)/"; \
		mkdir -p "$(TARGET_DIR)/agents" "$(TARGET_DIR)/references"; \
		cp -f agents/openai.yaml "$(TARGET_DIR)/agents/openai.yaml"; \
		cp -f references/*.md "$(TARGET_DIR)/references/"; \
	fi; \
	echo "Installed/updated skill at: $(TARGET_DIR)"

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
