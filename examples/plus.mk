# this is an example exploring the + special symbol for make rules.
# + NEGATES the effect of flags such as
# ‘-t’ (‘--touch’), ‘-n’ (‘--just-print’), or ‘-q’ (‘--question’)
# and forces make to run the command in question even if it is running in one
# of these modes, all of which instruct make not to execute commands.
#
# Why would you need this?
# Well, imagine a make running a sub-make. Even if are running in one of
# the special modes that avoid execution you still want to execute the sub-make,
# dont you?
# BTW: you don't need the '+' to correctly execute a sub-make even under one of
# these modes because if you use the $(MAKE) built in variable any command
# it is involved in will be executed, as seen below.
#
# to see what this example does you must run it so:
# make -n -f plus.mk
#
# References:
# http://stackoverflow.com/questions/3477292/what-do-and-do-as-prefixes-to-recipe-lines-in-make

.PHONY: all
all: with_plus without_plus

.PHONY: with_plus
with_plus:
	$(info doing [$@])
	@+/bin/echo hi
	@/bin/echo $(MAKE) 

.PHONY: without_plus
without_plus:
	$(info doing [$@])
	@/bin/echo hi
	@/bin/echo $(MAKE) 
