# this example shows how to distinguish between architectures in a makefile

arch_m=$(shell uname -m)
arch_i=$(shell uname -i)
arch_p=$(shell uname -p)
arch=$(shell arch)

ifeq ($(arch),i686)
$(info yes I am on $(arch))
endif

ifeq ($(arch),x64_86)
$(info yes I am on $(arch))
endif

.PHONY: all
all:
	@true

.PHONY: debug
debug:
	$(info arch_m is $(arch_m))
	$(info arch_i is $(arch_i))
	$(info arch_p is $(arch_p))
	$(info arch is $(arch))
