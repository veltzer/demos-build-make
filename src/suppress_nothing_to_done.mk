# this is an example of how to suppress the "nothing to be done for" message
# of make(1)
#
# Note that all of these options make make(1) think that its doing something
# and therefore think that stuff is always out of date which breaks 'make -q'
#
# try:
# make -f suppress_nothing_to_done.mk silent1
# as opposed to:
# make -f suppress_nothing_to_done.mk noisy
#
# References:
# http://stackoverflow.com/questions/3417391/suppress-nothing-to-be-done-for-all

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

.PHONY: noisy
noisy:
	$(info doing [$@])
