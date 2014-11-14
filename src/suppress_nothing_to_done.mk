# this is an example of how to suppress the "nothing to be done for" message
# of make(1)
# try:
# make -f suppress_nothing_to_done.mk
# as opposed to:
# make -f suppress_nothing_to_done.mk other

.PHONY: all
all:
	@true

.PHONY: other
other:
