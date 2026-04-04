
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
	@git add . --no-verbose
	@git commit -m "$(COMMIT_MSG)" --quiet
	@git push --quiet origin main



