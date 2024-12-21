# This example shows that -j is dangerous in that it spawns a lot of threads
# which is way more than the number of cores that you have.

MAKEFLAGS += -j

.PHONY: all
all: 0.jpg 1.jpg 2.jpg 3.jpg 4.jpg 5.jpg 6.jpg 7.jpg 8.jpg 9.jpg 10.jpg

%.jpg:
	$(info doing [$@])
	@sleep 5
