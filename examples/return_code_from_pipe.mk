# when running a pipe as a recipe command in make the exit code from the pipe
# is the exit code of the last component of the pipe as the following
# four examples (truefalse, truetrue, falsetrue, falsefalse) prove.
# So far so good.
# Now, if in make you want to disregard the error return code from a script you
# just put a minus in front of it.
# This does not work for a pipe as the 'minus_does_not_work' example shows.
# Putting a minus in front of the pipe component that fails (the last one)
# does not work either as the 'last_minus_does_not_work' example shows.
# So what do we do? we force the last component to return true using the shell
# built in 'exit'. Look at the 'exit_solution' example.
# 
# NOTE:
# On the command line this will not work since the 'exit 0' will cause the
# entire shell to terminate. In make that is OK since it terminates the shell
# that 'make' spawns but not make itself...

.PHONY: all
all:

.PHONY: exit_solution
exit_solution:
	true | false || exit 0

.PHONY: last_minus_does_not_work
last_minus_does_not_work:
	true | -false

.PHONY: minus_does_not_work
minus_does_not_work:
	-true | false

.PHONY: truefalse
truefalse:
	true | false

.PHONY: truetrue
truetrue:
	true | true

.PHONY: falsetrue
falsetrue:
	false | true

.PHONY: falsefalse
falsefalse:
	false | false
