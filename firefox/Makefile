.PHONY: install

USERNAME := $(shell whoami)
FF_PROFILE_DIR := $(wildcard /Users/$(USERNAME)/Library/Application\ Support/Firefox/Profiles/*default-release-*)

install:
	@if [ -d "$(FF_PROFILE_DIR)" ]; then \
		echo "Installing user.js to $(FF_PROFILE_DIR)"; \
	    cp -i ./user.js "$(FF_PROFILE_DIR)/"; \
	else \
		echo "user.js not copied:"
		echo "Directory not found: $(FF_PROFILE_DIR)"; \
	fi
