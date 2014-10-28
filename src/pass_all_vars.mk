# This makefile shows how to pass all variables
# to some executable in some format. This is needed
# for various macro processors like gpp(1) or others.

# remember all built in vars (must be before parameter definitions)
# this is to remove these and get the variables defined in the rc file
BUILT_IN_VARS:=$(.VARIABLES)

FOO:=value for foo
BAR:=value for bar

# create a gpp command line of all vars (must be last after paramter definitions)
DEFINED_VARS:=$(filter-out $(BUILT_IN_VARS) BUILT_IN_VARS, $(.VARIABLES))
GPP_PARAMS:=$(foreach v, $(DEFINED_VARS), -D$(v)="$($(v))")

.PHONY: all
all:
	$(info GPP_PARAMS is $(GPP_PARAMS))

.PHONY: each
each:
	$(foreach v, $(DEFINED_VARS), $(info $(v) = $($(v))))
