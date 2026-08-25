# this is a second solution to make sure all targets are recreated whenever
# the makefile changes. In this solution you just have to have a 'clean'
# like target. The advantage of this solution over the one which requires
# a variable to be added to *every rule* is just that. This one is localized.
#
# This will work for most targets, that is targets that are actual files
# and that are removed by clean, and any targets that depend on them.
# Side-effect targets and some PHONY targets will slip through the net.
#
# References:
# http://stackoverflow.com/questions/3871444/making-all-rules-depend-on-the-makefile-itself

MY_MAKEFILE_NAME:=$(lastword $(MAKEFILE_LIST))

ALL:=/tmp/copy_of_passwd /tmp/copy_of_hosts

.PHONY: all
all: $(ALL)

.PHONY: clean
clean:
	rm -f $(ALL)

/tmp/copy_of_passwd: /etc/passwd
	cp $< $@

/tmp/copy_of_hosts: /etc/hosts
	cp $< $@

# the solution starts here

# /tmp/dummy is included, which makes it a makefile -- and make always tries
# to remake its own makefiles before running any goal, including 'clean'.
# So the sub-make below would itself try to remake /tmp/dummy and re-invoke
# this same rule, never reaching the 'touch' that would stop it: an infinite
# recursion whenever /tmp/dummy is missing or older than this makefile, which
# is exactly the case this solution exists to handle. RECURSED=1 skips the
# include in the child, so the sub-make does the clean and returns.
ifndef RECURSED
-include /tmp/dummy
endif

/tmp/dummy: $(MY_MAKEFILE_NAME)
	$(MAKE) --silent RECURSED=1 -f $(MY_MAKEFILE_NAME) clean
	touch $@
