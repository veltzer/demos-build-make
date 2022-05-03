# this is an example of how to remove a folder from a file name
#
# References:
# - https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html

FILENAME:=foo/bar/zoo.suf

PATTERN:=$(FILENAME:foo/bar/%=%)
NOT_DIR:=$(notdir $(FILENAME))
BASENAME:=$(basename $(FILENAME))

all:
	@echo $(PATTERN)
	@echo $(NOT_DIR)
	@echo $(BASENAME)
