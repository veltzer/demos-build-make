# This is the best solution for adding a dependency to all receipes
#
# References:
# - https://www.gnu.org/software/make/manual/html_node/Special-Variables.html

.EXTRA_PREREQS+=$(foreach mk, ${MAKEFILE_LIST},$(abspath ${mk}))

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
