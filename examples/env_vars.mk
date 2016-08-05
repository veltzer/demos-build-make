# This makefile explores the issue of environment variables in makefiles.
# - how to use them in rule context ?
#   	this is the env_in_rule example. Notice that you have to use two dollar
#   	signs so as to make make know that you are not using a makefile variable
#   	but rather want to leave the interpretation of the variable to the shell
#   	which will be run.
# - how to use them in non rule contexts ?
#	just use them as regular variables.
#
#	Mark Veltzer

.PHONY: env_in_rule
env_in_rule:
	@echo $$PWD

MY_PWD1:=$(PWD)
MY_PWD2=$(PWD)

.PHONY: env_in_body
env_in_body:
	@echo $(MY_PWD1)
	@echo $(MY_PWD2)
