# This example explores the $(MAKECMDGOALS) variable
# try to run the following:
# make -f makecmdgoals.mk
# make -f makecmdgoals.mk a.phony
# make -f makecmdgoals.mk a.phony b.phony

.PHONY: all
all:
	$(info MAKECMDGOALS is $(MAKECMDGOALS))

%.phony:
	$(info MAKECMDGOALS is $(MAKECMDGOALS))
