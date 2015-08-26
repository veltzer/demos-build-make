# This makefile shows how to shut make up in various ways...

# this emits:
# make: Nothing to be done for 'all'.
.PHONY: all
all:
	$(info doing [$@])

# now there is no message from make
.PHONY: all2
all2:
	$(info doing [$@])
	true

# even better - don't show the 'true' command
.PHONY: all3
all3:
	$(info doing [$@])
	@true

# same, the exec seems to be superfluous
.PHONY: all4
all4:
	$(info doing [$@])
	@exec true

# same
.PHONY: all5
all5:
	$(info doing [$@])
	@exit 0

# command that always fails
.PHONY: fail
fail:
	$(info doing [$@])
	@exit 1

# lets try to hide errors

# the errors is very verbose and but is ignored by make
.PHONY: hideerror
hideerror:
	$(info doing [$@])
	-rm /tmp/nonexists

# better, now the command and stderr of the command do not show
# but make still prints:
# silent2.mk:51: recipe for target 'hideerror2' failed
.PHONY: hideerror2
hideerror2:
	$(info doing [$@])
	@-rm /tmp/nonexists 2> /dev/null

# this works but only because rm(1) is kind enough to have a '-f' flag.
# not all command support that.
.PHONY: hideerror3
hideerror3:
	$(info doing [$@])
	@rm -f /tmp/nonexists

# this trick will work for every command
.PHONY: hideerror4
hideerror4:
	$(info doing [$@])
	@rm /tmp/nonexists 2> /dev/null | exit 0
