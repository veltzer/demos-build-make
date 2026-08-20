# these are examples of how to write recipies that always fail for make(1)
# once a line like the ones specified here are done the lines after them do
# not get executed...

.PHONY: fail1
fail1:
	$(info doing [$@])
	@exit 1
	@echo after

.PHONY: fail2
fail2:
	$(info doing [$@])
	@false
	@echo after
