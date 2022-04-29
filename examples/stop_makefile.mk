# This is an example of who to stop a makefile
# the 'error' function exists with the exit code 2.
# the 'warning' function like the 'info' function do not stop make but rather
# just continue execution.
# the 'shell' function will not break the execution of make even if the command
# that it runs returns a failed error code.
#
# References:
# - https://www.gnu.org/software/make/manual/html_node/Make-Control-Functions.html#Make-Control-Functions

$(warning this is my warning message)

$(shell ls /fubar)

$(error this is my error message)

$(info I am here)
