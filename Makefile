
STOW_DIRS= mpv starship fish zed yazi ghostty hypr

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
