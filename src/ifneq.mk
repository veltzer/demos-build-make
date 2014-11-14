# This example shows how to use the 'ifneq' make syntax.

ifneq (0,1)
$(info yes, 0 is not 1) 
endif

ifneq (0,0)
else
$(info yes, 0 is 0) 
endif

.PHONY: all
all:
