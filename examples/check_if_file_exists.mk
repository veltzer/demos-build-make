# This is a basic example to be used as basis for building other examples
# 
# References:
# - https://stackoverflow.com/questions/5553352/how-do-i-check-if-file-exists-in-makefile-so-i-can-delete-it

check-have-file = $(shell if test -f $1; then echo 1; else echo 0; fi)

ifeq ($(call check-have-file,/etc/passwd),1)
$(info folder /etc/passwd exists)
endif

ifneq ($(call check-have-file,/dontexist),1)
$(info folder /dontexist doesnt exist)
endif

.PHONY: all
all:
	$(info check-have-file(/etc/passwd) is $(call check-have-file,/etc/passwd))
	$(info check-have-file(/dontexist) is $(call check-have-file,/dontexist))
