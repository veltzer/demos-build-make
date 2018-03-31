# In a lot of scenarios when make has nothing to do you get a message like
# make: Nothing to be done for 'all'.
# Sometimes you hate thing message and don't want it to appear.
# This example shows various solutions to this problem.
#
# References:
# - http://stackoverflow.com/questions/3417391/suppress-nothing-to-be-done-for-all

# this emits:
# make: Nothing to be done for 'all'.
.PHONY: problem
problem:

# the best solution performance wise
# A caveat is that ':' is rarely understood by people.
# no message from make
# ':' is the most low overhead, shell-builtin, returns ok status code
# the '@' is to not show the command being executed
.PHONY: solution1
solution1:
	@:

# the best solution which is well understood by everyone.
# no message from make
# 'true' is low overhead, shell-builtin, returns ok status code
# the '@' is to not show the command being executed
.PHONY: solution2
solution2:
	@true

# the 'exec' is superfluous in this solution.
# no message from make
# 'exec' is a low overhead, shell-builtin, returns ok status code
# the '@' is to not show the command being executed
.PHONY: solution3
solution3:
	@exec true

# a little too compilcated for my taste
# no message from make
# 'exit' is a low overhead, shell-builtin, returns ok status code
# the '@' is to not show the command being executed
.PHONY: solution4
solution4:
	@exit 0

# inefficient solution (-n causes echo not to really echo anything)
# no message from make
# 'echo' is a low overhead, shell-builtin, returns ok status code
# the '@' is to not show the command being executed
.PHONY: solution5
solution5:
	@echo -n

# inefficient solution (echoing newline into /dev/null)
# no message from make
# 'echo' is a low overhead, shell-builtin, returns ok status code
# the '@' is to not show the command being executed
.PHONY: solution6
solution6:
	@echo > /dev/null
