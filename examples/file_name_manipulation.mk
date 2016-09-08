# this is an example of how to remove a folder from a file name

FILENAME:=foo/bar/zoo.suf
OTHER:=$(FILENAME:foo/%=%)

all:
	@echo $(FILENAME:foo/%=%)
	@echo $(OTHER)
