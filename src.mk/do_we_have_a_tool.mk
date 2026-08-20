# this makefile shows how to find out if a tool is available or not
# we will find 'ls' and 'nonexist'
#
# References:
# http://stackoverflow.com/questions/7394290/makefile-return-value-from-the-shell-directive

HAVE_LS=$(shell hash ls 2> /dev/null && echo 1 || echo 0)
HAVE_NONEXISTS=$(shell hash nonexist 2> /dev/null && echo 1 || echo 0)

.PHONY: all
all:
	$(info HAVE_LS is $(HAVE_LS))
	$(info HAVE_NONEXISTS is $(HAVE_NONEXISTS))
