
STOW_DIRS= mpv omarchy
COMMIT_MSG ?= . Updated configuration files

all:
	@echo "Nothing to do"

# re-stow directories
stow-all:
	@for dir in $(STOW_DIRS); do \
		echo " ->> Running stow on $$dir"; \
		stow --target=${HOME} -R  $$dir; \
	done	

# un-stow directories
unstow-all:
	@for dir in $(STOW_DIRS); do \
		echo " ->> Running stow (delete) on $$dir"; \
		stow --target=${HOME} -D $$dir; \
	done	

# pull the latest changes from git
pull:
	@git pull origin main --quiet

# push changes to git if any changes are detected
commit:
ifneq ($(shell git diff-index --quiet HEAD; echo $$?), 0)
	@echo " ->> Changes detected, committing..."
	@git add . --no-verbose
	@git commit -m "$(COMMIT_MSG)" --quiet
	@git push --quiet origin main
endif



