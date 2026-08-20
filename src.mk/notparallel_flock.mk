# This makefile shows how to stop gnu make from doing things in parallel using flock(1)
# Run this makefile like this:
# - time make -f [name_of_file.mk] -j 2
# you will see that this example takes 10 seconds.

.PHONY: all
all: a b

.PHONY: a
a:
	flock /tmp/flock sleep 5

.PHONY: b
b:
	flock /tmp/flock sleep 5
