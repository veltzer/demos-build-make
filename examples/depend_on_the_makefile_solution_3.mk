# This is the best solution for adding a dependency to all receipes
#
# References:
# - https://www.gnu.org/software/make/manual/html_node/Special-Variables.html


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

# do you want dependency on the Makefile itself ?
DO_ALLDEP:=1
# .EXTRA_PREREQS+=$(foreach mk, ${MAKEFILE_LIST},$(abspath ${mk}))
# .EXTRA_PREREQS=depend_on_the_makefile_solution_3.mk
ifeq ($(DO_ALLDEP),1)
.EXTRA_PREREQS+=$(foreach mk, ${MAKEFILE_LIST},$(abspath ${mk}))
endif # DO_ALLDEP
