# This is an example of how to subtract lists one from the other
# Notes:
# - the list that is subtracted can have elements which dont exist in the original list
# - order between the arguments: first argument is the list of elements  to be subtracted
#   while the second list is the list from which they are subtracted.
# - note that the order of elements in the two lists NEED NOT BE THE SAME
#
# References:
# - https://stackoverflow.com/questions/7402205/remove-item-from-a-makefile-variable

L1:=a b c d e f g
L2:=d b f x

RES:=$(filter-out $(L2), $(L1))

.PHONY: all
all:
	$(info RES is $(RES))
