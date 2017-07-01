# This example shows how to calculate a relative path in GNU make
#
# References:
# http://stackoverflow.com/questions/3341482/in-a-makefile-how-to-get-the-relative-path-from-one-absolute-path-to-another

# DOES not work if path has spaces
OneDirectoryUp=$(patsubst %/$(lastword $(subst /, ,$(1))),%,$(1))

# FindParentDir2(dir0, dir1, prefix)  returns prefix if dir0 and dir1
# start with prefix, otherwise returns
# FindParentDir2(dir0, dir1, OneDirectoryUp(prefix))
FindParentDir2=$(if $(or $(patsubst $(3)/%,,$(1)), $(patsubst $(3)/%,,$(2))), $(call FindParentDir2,$(1),$(2),$(call OneDirectoryUp,$(3))), $(3))

FindParentDir=$(call FindParentDir2,$(1),$(2),$(1))

# how to make a variable with a space, courtesy of John Graham-Cumming
# http://blog.jgc.org/2007/06/escaping-comma-and-space-in-gnu-make.html
space:=
space+=

# dir1 relative to dir2 (dir1 and dir2 must be absolute paths)
RelativePath=$(subst $(space), , $(patsubst %, ../, $(subst /, , $(patsubst $(call FindParentDir,$(1),$(2))/%, %, $(2)))))$(patsubst $(call FindParentDir,$(1),$(2))/%, %, $(1))

# example of how to use (will give ..)
$(call RelativePath,/home/yale,/home/yale/workspace)
