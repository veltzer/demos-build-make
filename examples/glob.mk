# This is an example of how to define variable in GNU make that come out of a globbing
# pattern applied on the file system
# 
# References:
# - https://www.gnu.org/software/make/manual/html_node/Wildcard-Function.html

PAT = $(wildcard *.mk)

.PHONY: all
all:
	$(info PAT is $(PAT))
