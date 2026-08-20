# This makefile tests .NOTPARALLEL as advertised here: https://www.gnu.org/software/make/manual/html_node/Parallel-Disable.html
# It does NOT WORK!

.PHONY: all
all: c d
notparallel: a b
.NOTPARALLEL: notparallel

.PHONY: a
a:
	echo "$@ started"
	sleep 5
	echo "$@ finished"

.PHONY: b
b:
	echo "$@ started"
	sleep 5
	echo "$@ finished"

# .PHONY: c
c:
	echo "$@ started"
	sleep 5
	echo "$@ finished"

# .PHONY: d
d:
	echo "$@ started"
	sleep 5
	echo "$@ finished"
