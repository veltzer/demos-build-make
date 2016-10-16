SOURCES:=$(shell find . -name "*.c" | sed 's/ /\\ /g')
OBJECTS:=$(SOURCES:.c=.o)

PROG:=main.elf

.PHONY: all
all: $(PROG)

$(PROG): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS)

this\ is\ main.o: this\ is\ main.c
	$(CC) -c -o "$@" "$<"
now\ this\ is\ weird.o: now\ this\ is\ weird.c
	$(CC) -c -o "$@" "$<"

.PHONY: clean
clean:
	-rm -f $(OBJECTS) $(PROG)

.PHONY: debug
debug:
	$(info SOURCES is $(SOURCES))
	$(info OBJECTS is $(OBJECTS))
