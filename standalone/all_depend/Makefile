# This example shows how to make everything depend on the makefiles
# If you want to test this just change the makefile (a comment change
# will do) and see if it builds again...
#
# References:
# - https://stackoverflow.com/questions/3871444/making-all-rules-depend-on-the-makefile-itself

CFLAGS:=-O3 -Wall
CC:=gcc
LDFLAGS:=

program.elf: main.o other.o
	$(CC) $(LDFLAGS) main.o other.o -o $@
# these rules are not strictly necessary because make(1) has built in pattern
# rules which state the below already...
main.o: main.c
	$(CC) $(CFLAGS) -c -o $@ $<
other.o: other.c
	$(CC) $(CFLAGS) -c -o $@ $<

.PHONY: clean
clean:
	-rm -f *.o program.elf

.EXTRA_PREREQS+=$(foreach mk, ${MAKEFILE_LIST},$(abspath ${mk}))
