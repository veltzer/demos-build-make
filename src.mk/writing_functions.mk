# this example demos how to write functions in a makefile...

# a simple function that receives two arguments and reverses
# their order
reverse = $(2) $(1)

all:
	@echo $(call reverse,world,hello)
