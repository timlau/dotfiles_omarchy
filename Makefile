
STOW_DIRS= mpv omarchy starship fish
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

