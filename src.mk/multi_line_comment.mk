# This is a basic example exploring how to do multi line comments in GNU make(1)
# It turns out ifeq doens't work that well for multi-line comments since the text
# between the 'ifeq' and the 'endif' is still parsed by make and still needs
# to conform to standard make notation which means that you still need to "#"
# every single line in which case the 'ifeq' is redundant.
#
# References:
# http://stackoverflow.com/questions/4493291/how-to-add-multi-line-comments-in-makefiles

# This is a multi line\
comment that can go on\
for many more lines...

ifeq (0,1)
This is also a multi line
comment since it will never be executed
else this will cause a problem
$(func 4)
endif

.PHONY: all
all:
	$(info Hi from make!)
