# This example demonstrates how to use make(1)'s implicit
# rules to the maximum.
# You can see that we compile and link here WITHOUT writing any rule.
# We realy on makes default library of rules.
# Also notice that we support multiple targets!
# See the reference.
# The standard variables below are: CXXFLAGS and LDLIBS
# The variables SOURCES and TARGETS are mine.
#
# References:
# https://www.gnu.org/software/make/manual/html_node/Catalogue-of-Rules.html

SOURCES=$(shell find . -name "*.cc")
TARGETS=$(basename $(SOURCES))
CXXFLAGS+=-O2 -Wall -Werror
LDLIBS=-lcurses -lpthread

all: $(TARGETS)

.PHONY:
clean:
	-rm $(TARGETS)
