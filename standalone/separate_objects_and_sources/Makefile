SOURCES:=$(shell find src -name "*.cc")
OBJECTS:=$(addprefix out/,$(addsuffix .o, $(basename $(SOURCES))))

.PHONY: all
all: $(OBJECTS)

$(OBJECTS): out/%.o: %.cc
	mkdir -p $(dir $@)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

.PHONY: clean
clean:
	rm -rf $(OBJECTS)

.PHONY: debug
debug:
	$(info SOURCES is $(SOURCES))
	$(info OBJECTS is $(OBJECTS))
