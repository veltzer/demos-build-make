# This is an example of various file manipulation tricks
#
# References:
# - https://www.gnu.org/software/make/manual/html_node/File-Name-Functions.html

FILENAME:=foo/bar/zoo.suf

LAST_FOLDER_WITH_SUFFIX:=$(FILENAME:foo/bar/%=%)
REMOVE_FIRST_FOLDER:=$(FILENAME:foo/%=%)
REMOVE_ALL_FOLDERS:=$(notdir $(FILENAME))
REMOVE_ONLY_SUFFIX:=$(basename $(FILENAME))
REMOVE_FOLDERS_AND_SUFFIX:=$(basename $(notdir $(FILENAME)))

all:
	$(info FILENAME is $(FILENAME))
	$(info LAST_FOLDER_WITH_SUFFIX is $(LAST_FOLDER_WITH_SUFFIX))
	$(info REMOVE_FIRST_FOLDER is $(REMOVE_FIRST_FOLDER))
	$(info REMOVE_ALL_FOLDERS is $(REMOVE_ALL_FOLDERS))
	$(info REMOVE_ONLY_SUFFIX is $(REMOVE_ONLY_SUFFIX))
	$(info REMOVE_FOLDERS_AND_SUFFIX is $(REMOVE_FOLDERS_AND_SUFFIX))
