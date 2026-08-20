# This example shows that ifndef will consider a defined but empty variable as not
# defined

FOO:=
ifndef FOO
$(error what?)
endif

.PHONY: all
all:
	@true
