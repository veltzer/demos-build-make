# This example shows how to use the $(shell find ...)
# construct correctly from within make(1)
# The idea is to use the '-printf "%P\n"' parameter

SOURCES_WITH_DOT:=$(shell find . -type f -and -name "*.mk")
SOURCES_CORRECT:=$(shell find . -type f -and -name "*.mk" -printf "%P\n")

.PHONY: all
all:

.PHONY: debug
debug:
	$(info SOURCES_WITH_DOT is $(SOURCES_WITH_DOT))
	$(info SOURCES_CORRECT is $(SOURCES_CORRECT))
