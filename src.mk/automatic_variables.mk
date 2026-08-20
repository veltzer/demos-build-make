# this example shows the automatic variables of make
# we learn that:
# $@ is the first target only
# $^ is all the ingredients
# $< is the leftmost ingredient

never_will_be_created1 never_will_be_create2: /etc/hosts /etc/passwd
	$(info $$@ is [$@])
	$(info $$^ is [$^])
	$(info $$< is [$<])
