# This example shows why you want .DELETE_ON_ERROR in your makefile
# by default, when make fails in a receipe it DOES NOT remove the target
# file. Some tools do this when they fail, others dont.
#
# In this example, if you remove the .DELETE_ON_ERROR line, make will revert
# to it's default behaviour and WILL NOT remove the erroneous /tmp/tmp file.

.DELETE_ON_ERROR:

/tmp/tmp:
	$(info doing [$@])
	cat /etc/passwd /tmp/notexists > $@
