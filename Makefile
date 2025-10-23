include ${MAKEFILE}

MOLECULE_REVISION ?= $$(git rev-parse --abbrev-ref HEAD)

build: requirements
	@uv run rke2 build
	@git status --porcelain | wc -l | grep -q '^0$$' || (echo "Uncommitted build detected, please run build stage and commit changes" && exit 1)

update:
	@uv run rke2 update
