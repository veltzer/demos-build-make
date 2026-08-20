# This example shows how to calculate a relative path in GNU make
#
# References:
# http://stackoverflow.com/questions/3341482/in-a-makefile-how-to-get-the-relative-path-from-one-absolute-path-to-another

# DOES not work if path has spaces
OneDirectoryUp=$(patsubst %/$(lastword $(subst /, ,$(1))),%,$(1))

# FindParentDir2(dir0, dir1, prefix) returns prefix if dir0 and dir1
# start with prefix, otherwise returns
# FindParentDir2(dir0, dir1, OneDirectoryUp(prefix))
# The trailing slash appended to $(1) and $(2) makes the test also accept
# a directory that IS the prefix (e.g. dir0 == prefix). Note: no spaces
# after the commas - they would leak into the returned value.
FindParentDir2=$(if $(or $(patsubst $(3)/%,,$(1)/),$(patsubst $(3)/%,,$(2)/)),$(call FindParentDir2,$(1),$(2),$(call OneDirectoryUp,$(3))),$(3))

FindParentDir=$(call FindParentDir2,$(1),$(2),$(1))

# how to make a variable with a space, courtesy of John Graham-Cumming
# http://blog.jgc.org/2007/06/escaping-comma-and-space-in-gnu-make.html
space:=
space+=

# one "../" for every component of dir2 below the common parent
Ups=$(subst $(space),,$(patsubst %,../,$(subst /, ,$(patsubst $(call FindParentDir,$(1),$(2))/%,%,$(2)/))))

# dir1 relative to dir2 (dir1 and dir2 must be absolute paths):
# the ups from dir2 to the common parent, then dir1 below the parent;
# the final patsubst strips the trailing slash
RelativePath=$(patsubst %/,%,$(call Ups,$(1),$(2))$(patsubst $(call FindParentDir,$(1),$(2))/%,%,$(1)/))

# examples of how to use
$(info $(call RelativePath,/home/yale,/home/yale/workspace))
$(info $(call RelativePath,/a/b/c,/a/b/d))
$(info $(call RelativePath,/a/b/c/d,/a/x))

.PHONY: all
all:
	@true
