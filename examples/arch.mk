# this example shows how to distinguish between architectures in a makefile

arch=$(shell uname -m)

ifeq ($(arch),i686)
$(info yes I am on $(arch))
endif

ifeq ($(arch),x64_86)
$(info yes I am on $(arch))
endif

.PHONY: all
all:
	@true
