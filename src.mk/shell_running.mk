# this makefile demostrates how to always run a shell command
# (with no regard to targets being built)
# you can check the changing date of the /tmp/shell_running.stamp file using
# the stat(1) cmd line tool.
# note that this runs at *parse time*, even under 'make -n', which is why the
# stamp lives in /tmp: the build lints this file with 'make -n', and a stamp in
# the tree would be an undeclared output.

FOOBAR:=$(shell touch /tmp/shell_running.stamp)

.PHONY: all
all:
	$(info hello)
