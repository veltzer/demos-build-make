# This example shows how to check if a program exists from within make
# References:
# - https://stackoverflow.com/questions/5618615/check-if-a-program-exists-from-a-makefile


ifeq (, $(shell which git))
$(info you don't have git)
else
$(info you have git)
endif

.PHONY: all
all:
	$(info nothing here)
