# this makefile demostrates how to always run a shell command
# (with no regard to targets being built)
# you can check the changing date of the out/tmp.stamp file using
# the stat(1) cmd line tool.
# note that this runs at *parse time*, even under 'make -n'.

FOOBAR:=$(shell mkdir -p out && touch out/tmp.stamp)

.PHONY: all
all:
	$(info hello)
