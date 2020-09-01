# this example shows how to turn file name from relative to absolute


.PHONY: all
all:
	$(info $(abspath does_not_exist))
