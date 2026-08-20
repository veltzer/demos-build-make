# This makefile shows how to ignore errors in the build process
# There seem to be 3 ways of achieving this:
# - using the .IGNORE target
# - use the '-' sign for commands
# - use the shell and do [cmd] || true
#   and maybe [cmd]; true
# The first two will produce ugly output by make(1) that states
# that the real command failed but that this was ignored by make.
# If you want the output clean use options number 3.

.PHONY: all
all: ignore_dot ignore_minus ignore_or ignore_semicolon ignore_lines
	$(info doing [$@])

.PHONY: ignore_dot
.IGNORE: ignore_dot
ignore_dot:
	$(info doing [$@])
	false

.PHONY: ignore_minus
ignore_minus:
	$(info doing [$@])
	-false

.PHONY: ignore_or
ignore_or:
	$(info doing [$@])
	false || true

.PHONY: ignore_semicolon
ignore_semicolon:
	$(info doing [$@])
	false; true

# this one will not work
.PHONY: ignore_lines
ignore_lines:
	$(info doing [$@])
	false
	true
