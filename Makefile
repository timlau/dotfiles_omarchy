
STOW_DIRS = starship fish zed yazi ghostty hypr nvim omarchy worktrunk
ORG_FILES = ~/.dummy
COMMIT_MSG ?= . Updated configuration files

all:
	@echo "Nothing to do"

# re-stow directories
stow:
	@for dir in $(STOW_DIRS); do \
		echo "    -> Running stow on $$dir"; \
		stow --target=${HOME} -R  $$dir; \
	done

# un-stow directories
unstow:
	@for dir in $(STOW_DIRS); do \
		echo "    -> Running stow (delete) on $$dir"; \
		stow --target=${HOME} -D $$dir; \
	done

remove-originals:
	rm -rf $(ORG_FILES)

# pull the latest changes from git
git-pull:
	@git pull origin --quiet

# push changes to git if any changes are detected
git-commit:
ifneq ($(shell git diff-index --quiet HEAD; echo $$?), 0)
	@echo " ->> Changes detected, committing..."
	@git add . --no-verbose
	@git commit -m "$(COMMIT_MSG)" --quiet
	@git push --quiet origin 
endif

# restore the settings from git and gnome
sync: git-commit git-pull
	@echo " ->> Settings are synced and updated"


