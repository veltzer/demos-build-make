# This example shows how to calculate a relative path in GNU make
#
# References:
# http://stackoverflow.com/questions/3341482/in-a-makefile-how-to-get-the-relative-path-from-one-absolute-path-to-another

FILES:=/home/mark/git /home /home/mark/git/repo
RELATIVE:=/home/mark

RELATIVES:=$(shell realpath --relative-to $(RELATIVE) $(FILES))

.PHONY: all
all:
	$(info FILES is $(FILES))
	$(info RELATIVE is $(RELATIVE))
	$(info RELATIVES is $(RELATIVES))
