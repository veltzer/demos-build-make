# This is a basic example to be used as basis for building other examples

check-have-folder = $(shell if test -d $1; then echo 1; else echo 0; fi)

ifeq ($(call check-have-folder,/var),1)
$(info folder /var exists)
endif

ifneq ($(call check-have-folder,/dontexist),1)
$(info folder /dontexist doesnt exist)
endif

.PHONY: all
all:
	$(info check-have-folder(/etc) is $(call check-have-folder,/etc))
	$(info check-have-folder(/dontexist) is $(call check-have-folder,/dontexist))
