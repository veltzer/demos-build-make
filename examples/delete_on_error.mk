# This example shows why you want .DELETE_ON_ERROR in your makefile
# by default, when make fails in a receipe it DOES NOT remove the target
# file. Some tools do this when they fail, others dont.
#
# In this example, if you remove the .DELETE_ON_ERROR line, make will revert
# to it's default behaviour and WILL NOT remove the erroneous /tmp/tmp file.
#
# the recommendation is to use this in any real life project as it ensures
# that if you use tools that leave cruft that cruft will be cleaned.
# naturally, if the tools leave cruft in the form of files whose name
# is not the target file then that cruft will not be removed by make(1)
#
# Note that this only works *WHEN YOUR RULE MAKES THAT TARGET THAT MAKE
# KNOWS ABOUT*. This is usually the case but still, in a lot of cases
# in order to make target A you have a more than one line and you
# create other files like B, C and D. In that case when the rule fails
# make will remove A for you but B, C and D will remain as cruft.
# 
# In order to remove them you need to follow the patten below.

.DELETE_ON_ERROR:

/tmp/tmp:
	$(info doing [$@])
	cat /etc/passwd /tmp/notexists > $@

/tmp/tmp2:
	$(info doing [$@])
	cat /etc/passwd > /tmp/A || { rm /tmp/A && false; }
	cat /etc/group > /tmp/B || { rm /tmp/A /tmp/B && false; }
	cat_mistake /tmp/A /tmp/B > $@ || { rm /tmp/A /tmp/B && false; }
