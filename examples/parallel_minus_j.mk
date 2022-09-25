# This example shows how make -j works.
# Try to run this with:
# - no value to -j (this will launch endless parallel jobs)
# - no -j flag at all (1 job in parallel)
# - other values (1,2,3,...) (runs maximum the number of jobs you want)

SOURCES:=$(shell find . -type f -and -name "*.mk")
TARGETS:=$(addsuffix .target, $(SOURCES))

.PHONY: all
all: $(TARGETS)

$(TARGETS): %.mk.target: %.mk
	$(info doing [$@])
	@sleep 2

.PHONY: debug
debug:
	$(info SOURCES is $(SOURCES))
	$(info TARGETS is $(TARGETS))
