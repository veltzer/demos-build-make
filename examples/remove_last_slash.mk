# This makefile shows how to remove the last slash from a list of files/directories
# Rerefences:
# - https://stackoverflow.com/questions/33126425/how-to-remove-the-last-trailing-backslash-in-gnu-make-file


WITH_SLASH=$(dir /etc/passwd /var/log/message)
WITHOUT_SLASH=$(WITH_SLASH:/=)
WITHOUT_SLASH_2=$(patsubst %/,%,$(WITH_SLASH))

.PHONY: all
all:
	$(info WITH_SLASH is $(WITH_SLASH))
	$(info WITHOUT_SLASH is $(WITHOUT_SLASH))
	$(info WITHOUT_SLASH_2 is $(WITHOUT_SLASH_2))
