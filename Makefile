.PHONY: all
all:
	@true

.PHONY: clean_hard
clean_hard:
	$(info doing [$@])
	git clean -qffxd
