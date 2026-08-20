# This makefile explores the issue of environment variables in makefiles.
# - how to use them in rule context ?
#   	this is the env_in_rule example. Notice that you have to use two dollar
#   	signs so as to make make know that you are not using a makefile variable
#   	but rather want to leave the interpretation of the variable to the shell
#   	which will be run.
# - how to use them in non rule contexts ?
#	just use them as regular variables.
# - how to check if an environment variable is defined at all?
#	just use the "ifdef/ifndef" like below
#
# References:
# - https://stackoverflow.com/questions/8071493/using-ifeq-and-ifndef-in-gnu-make
# - https://www.gnu.org/software/make/manual/html_node/Conditional-Syntax.html

.PHONY: env_in_rule
env_in_rule:
	@echo $$PWD

MY_PWD1:=$(PWD)
MY_PWD2=$(PWD)

ifdef GITHUB_WORKFLOW
$(info yes)
else
$(info no)
endif

ifndef BLA
$(info yes)
endif

.PHONY: env_in_body
env_in_body:
	@echo $(MY_PWD1)
	@echo $(MY_PWD2)
