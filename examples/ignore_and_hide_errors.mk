# lets try to hide errors

# the error is ignored by make(1) but produces very verbose output
# which we don't want to see
.PHONY: problem
problem:
	$(info doing [$@])
	-rm /tmp/nonexists
	@echo after

# better, now the command and stderr of the command do not show
# but make still prints:
# ignore_and_hide_errors.mk:51: recipe for target 'solution1' failed
.PHONY: solution1
solution1:
	$(info doing [$@])
	@-rm /tmp/nonexists 2> /dev/null
	@echo after

# this works but only because rm(1) is kind enough to have a '-f' flag.
# not all command support that.
.PHONY: solution2
solution2:
	$(info doing [$@])
	@rm -f /tmp/nonexists
	@echo after

# this trick will work for every command
.PHONY: solution3
solution3:
	$(info doing [$@])
	@rm /tmp/nonexists 2> /dev/null > /dev/null | exit 0
	@echo after
