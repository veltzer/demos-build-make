# This makefile shows how to stop gnu make from doing things in parallel.
# Run this makefile twice:
# - first time with "make -f [name_of_file.mk] -j 2" with the last line commented.
# - second time with "make -f [name_of_file.mk] -j 2" with the last line uncommented.

.PHONY: all
all: a b

.PHONY: a
a:
	sleep 5

.PHONY: b
b:
	sleep 5


.NOTPARALLEL:
