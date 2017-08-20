# This is an example of how to subtract lists one from the other
# Notes that the list that is subtracted can have elements
# which dont exist in the original list
# Also note the order between the arguments: first argument is the list of elements
# to be subtracted while the second list is the list from which they are subtracted.

L1:=a b c d e f g
L2:=b d f x

RES:=$(filter-out $(L2), $(L1))

.PHONY: all
all:
	$(info RES is $(RES))
