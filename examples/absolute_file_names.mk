# this example shows how to turn file name from relative to absolute
# References:
# - https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html


.PHONY: all
all:
	$(info $(abspath does_not_exist))
