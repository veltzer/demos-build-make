# this is an example of how to suppress the "nothing to be done for" message
# of make(1)
#
# Note that all of these solutions force make(1) to think that its doing something
# and therefor think that stuff is always out of date which breaks 'make -q'
#
# The second noisy example is what is called a make "empty command". It is also noisy
# it seems.
#
# try:
# make -f suppress_nothing_to_be_done.mk silent0
# as opposed to:
# make -f suppress_nothing_to_be_done.mk noisy0
#
# References:
# http://stackoverflow.com/questions/3417391/suppress-nothing-to-be-done-for-all

.PHONY: silent0
silent0:
	$(info doing [$@])
	@:

.PHONY: silent1
silent1:
	$(info doing [$@])
	@true

.PHONY: silent2
silent2:
	$(info doing [$@])
	@echo -n

.PHONY: silent3
silent3:
	$(info doing [$@])
	@echo > /dev/null

.PHONY: noisy0
noisy0:
	$(info doing [$@])

.PHONY: noisy1
noisy1: ;
