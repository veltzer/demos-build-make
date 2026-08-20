# This example shows how to set the number of parallel jobs that make
# uses from within the makefile itself.
# Note that this is only possible from gmake 4.3 and onwards.
# References:
# - https://stackoverflow.com/questions/42291992/how-can-i-specify-the-default-number-of-jobs-to-run-from-in-a-makefile

MAKEFLAGS := --jobs=$(shell nproc)

SOURCES:=$(shell find . -type f -and -name "*.mk")
TARGETS:=$(addsuffix .target, $(SOURCES))

.PHONY: all
all: $(TARGETS)

$(TARGETS): %.mk.target: %.mk
	$(info doing [$@])
	@sleep 2

.PHONY: debug
debug:
	$(info SOURCES is $(SOURCES))
	$(info TARGETS is $(TARGETS))
