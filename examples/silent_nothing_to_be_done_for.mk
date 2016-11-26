# This makefile shows how to shut make up in various ways...
#
# References:
# - http://stackoverflow.com/questions/3417391/suppress-nothing-to-be-done-for-all

# this emits:
# make: Nothing to be done for 'all'.
.PHONY: problem
problem:

# this is the most efficient solution since : is a shell built-in and a no-op.
.PHONY: solution1
solution1:
	@:

# now there is no message from make and the 'true' command is not shown
# true is a shell builtin as well.
.PHONY: solution2
solution2:
	@true

# same, the exec seems to be superfluous
.PHONY: solution3
solution3:
	@exec true

# same
.PHONY: solution4
solution4:
	@exit 0

# the most inefficient solution number 1
.PHONY: solution5
solution5:
	@echo -n

# the most inefficient solution number 2
.PHONY: solution6
solution6:
	@echo > /dev/null

