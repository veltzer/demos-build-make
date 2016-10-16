This example demostrates how to use make with weird file names
(in this case, file names with spaces in them).

The real advise is this: don't do spaces in file names and you'll be fine.

References:
http://www.cmcrossroads.com/article/gnu-make-meets-file-names-spaces-them

Conclusions:
- addsuffix, addprefix and almost all gnu make(1) functions don't work well with spaces.
- the simple make(1) substitution like 'OBJECTS:=$(SOURCES:.c=.o)' does work.
- you need to escape automatic variables if they have escaped spaces in them ("$@" instead of $@)
	in the body of your rules.
- pattern rules of both kinds, 2 element or 3 element, (%.o: %c or $(OBJECTS): %.o: %.c) don't work well with spaces.
	This means you have to write templates for each and every source file!
- when looking for source files using $(shell find ...) you cannot use tr(1) to transform spaces into escaped
	spaces since tr(1) only translates one character into a single character. Use sed(1) instead.
- $(foreach ...) does not respect space escapes (\ ). You have to do tricks in order to make
	it work.
	The trick used here is convert all spaces to + signs before $(foreach ...) and then
	convert back when activating a piece of code on each of the elements iterated
	by $(foreach ...)
