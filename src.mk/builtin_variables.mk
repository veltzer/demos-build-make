# this makefile shows some builtin variables in GNU make

.PHONY: all
all:
	$(info CURDIR is $(CURDIR))
	$(info CC is $(CC))
	$(info CFLAGS is $(CFLAGS))
	$(info CPP is $(CPP))
