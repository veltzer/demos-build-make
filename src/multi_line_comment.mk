# This is a basic example exploring how to do multi line comments in GNU make(1)
# References:
# http://stackoverflow.com/questions/4493291/how-to-add-multi-line-comments-in-makefiles

# This is a multi line\
comment that can go on\
for many more lines...

ifeq (0,1)
This is also a multi line
comment since it will never be executed
endif

.PHONY: all
all:
	$(info Hi from make!)
