# This makefile shows how to show all make variables
# note that since make incorporates environment variables
# then you will see all environment variables as well.

.PHONY: all
all:
	$(info .VARIABLES is $(.VARIABLES))

.PHONY: all_values
all_values:
	$(foreach v, $(.VARIABLES), $(info $(v) = $($(v))))
