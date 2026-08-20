# This makefile knows how to know the name of the current file you are in...
# Like all examples in this repo, it is run from the root of the repo,
# so the include path is relative to the root.

include src.mk/name_of_included_makefile_include.mk

.PHONY: all
all:
	@echo included name was $(SETUP_NAME)
