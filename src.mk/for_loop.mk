# This is an example exploring how to do a for loop in a make recipe.
# The reason this needs to be demonstrated because shell syntax gets
# mixed with make syntax and things need to be escaped properly.

MYVAR:=a b c d e

.PHONY: all
all:
	@for x in $(MYVAR); do echo $$x;done
