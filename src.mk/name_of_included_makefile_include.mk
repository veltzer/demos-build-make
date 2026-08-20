# the colon in the next line is very important since the idea is
# to execute the statement as it is being read rather than later.
# (that is the difference between := and =).
# Why? because someone may have already included more files until
# this statement will be executed...

SETUP_NAME:=$(lastword $(MAKEFILE_LIST))

# This fragment is meant to be included, but the lint also runs it
# standalone, and make needs at least one target. Define a trivial phony
# target only when this file is the main makefile - if it were defined
# unconditionally it would become the *default goal* of any makefile
# that includes this fragment near its top.
ifeq ($(words $(MAKEFILE_LIST)),1)
.PHONY: nothing
nothing:
	@true
endif
