# This example shows that failing commands with $(shell) will not cause an error
# code to be returned from make.
# You can resolve it by checking that the variable is defined after the shell command like this:
# ifndef VAR 
# $(error VAR not set (maybe a shell command failed?))
# endif


# This is the command that will fail
foo:=$(shell there_is_no_such_command)

.PHONY: all
all:
	@true
