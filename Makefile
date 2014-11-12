include /usr/share/templar/make/Makefile

ALL:=$(TEMPLAR_ALL)
ALL_DEP:=$(TEMPLAR_ALL_DEP)

.DEFAULT_GOAL=all
.PHONY: all
all: $(ALL)

.PHONY: clean
clean:
	$(info doing [$@])
	$(Q)git clean -xdf > /dev/null

.PHONY: debug
debug:
	$(info ALL is $(ALL))
	$(info ALL_DEP is $(ALL_DEP))
