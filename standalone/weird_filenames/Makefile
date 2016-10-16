SOURCES:=$(shell find . -name "*.c" | sed 's/ /\\ /g')
OBJECTS:=$(SOURCES:.c=.o)

PROG:=main.elf

.PHONY: all
all: $(PROG)

$(PROG): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS)

#this\ is\ main.o: this\ is\ main.c
#	$(CC) -c -o "$@" "$<"
#now\ this\ is\ weird.o: now\ this\ is\ weird.c
#	$(CC) -c -o "$@" "$<"

define template
$(2): $(1)
	echo foo
endef
	#$$(CC) -c -o "$$@" "$$<"

s+ = $(subst \ ,+,$1)
+s = $(subst +,\ ,$1) 

#$(foreach SRC,$(SOURCES),$(eval $(call template,$(SRC),$(SRC:.c=.o))))
$(foreach SRC,$(call s+,$(SOURCES)),$(info $(call +s,$(SRC))))

.PHONY: clean
clean:
	-rm -f $(OBJECTS) $(PROG)

.PHONY: debug
debug:
	$(info SOURCES is $(SOURCES))
	$(info OBJECTS is $(OBJECTS))
