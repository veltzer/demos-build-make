# This example shows the differece between : and # in bash
# : is a command. This means it changes the exit code $? to 0 (as do true and false).
# it can also be terminated with a semicolon and followed by another command on the same line.
# # is not a command. It leaves the exit code $? intact.
# it also cannot be followed with another command on the same line.

.PHONY: colon
colon:
	$(info doing [$@])
	false; : s d g; echo $$?

.PHONY: hash
hash:
	$(info doing [$@])
	false; # s d g
	echo $$?
