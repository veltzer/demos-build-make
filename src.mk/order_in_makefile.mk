# this example explores the order in a makefile
# the conclusion is that if you use a variable
# and then write a rule for it, then further changes
# to the variable will not affect the rule *unless*
# you write the rule again *without a recipee*.
# (see below)
# it does not matter if the variable is defined with
# ':=' or '='.
# the weird this is that you can add dependencies to targets
# after they have been declared with this syntax:
# [target]: [ingeredients]
# but you *cannot* add commands because then you will be
# overriding the old receipe and you get a warning for that
# from make(1).

ALL=/tmp/a.stamp /tmp/b.stamp

.PHONY: all
all: $(ALL)
	$(info doing [$@])
	$(info ALL is $(ALL))

ALL+=/tmp/c.stamp
all: $(ALL)

.PHONY: clean
clean:
	rm -f $(ALL)

/tmp/%.stamp:
	touch $@

.PHONY: debug
debug:
	$(info ALL is $(ALL))
