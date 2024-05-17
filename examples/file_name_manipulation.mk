# This is an example of various file manipulation tricks
#
# References:
# - https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html

FILENAME:=foo/bar/zoo.suf

JUST_LAST:=$(FILENAME:foo/bar/%=%)
NO_FIRST:=$(FILENAME:foo/%=%)
NOT_DIR:=$(notdir $(FILENAME))
BASENAME:=$(basename $(FILENAME))

all:
	$(info FILENAME is $(FILENAME))
	$(info JUST_LAST is $(JUST_LAST))
	$(info NO_FIRST is $(NO_FIRST))
	$(info NOT_DIR is $(NOT_DIR))
	$(info BASENAME is $(BASENAME))
