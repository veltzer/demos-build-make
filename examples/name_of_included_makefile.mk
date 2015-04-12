# This makefile knows how to know the name of the current file you are in...

include name_of_included_makefile_include.mk

.PHONY: all
all:
	@echo included name was $(SETUP_NAME)
