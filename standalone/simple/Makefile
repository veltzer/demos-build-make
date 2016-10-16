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
