# Example of running 'bash' instead of 'sh' as shell

SHELL:=/bin/bash

WHAT_SHELL:=$(shell echo $$SHELL)
BASH_ONLY:=$(shell let "x=3" && echo $$x)

.PHONEY: all
all:
	$(info WHAT_SHELL is $(WHAT_SHELL))
	$(info BASH_ONLY is $(BASH_ONLY))
