SOURCES:=$(shell find . -name "*.c" | sed 's/ /\\ /g')
OBJECTS:=$(SOURCES:.c=.o)

MANUAL:=0

PROG:=main.elf

.PHONY: all
all: $(PROG)

$(PROG): $(OBJECTS)
	$(CC) -o $@ $(OBJECTS)

# this is the manual way to write the rules, but you don't
# really want to do that
ifeq ($(MANUAL), 1)
this\ is\ main.o: this\ is\ main.c
	$(CC) -c -o "$@" "$<"
now\ this\ is\ weird.o: now\ this\ is\ weird.c
	$(CC) -c -o "$@" "$<"
else # MANUAL
define template
$(1:.c=.o): $(1)
	$$(CC) -c -o "$$@" "$$<"
endef
s+ = $(subst \ ,+,$1)
+s = $(subst +,\ ,$1) 
#$(foreach SRC,$(call s+,$(SOURCES)),$(info $(call +s,$(SRC))))
$(foreach SRC,$(call s+,$(SOURCES)),$(eval $(call template,$(call +s,$(SRC)))))
endif # MANUAL

.PHONY: clean
clean:
	-rm -f $(OBJECTS) $(PROG)

.PHONY: debug
debug:
	$(info SOURCES is $(SOURCES))
	$(info OBJECTS is $(OBJECTS))
