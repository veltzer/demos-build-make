main.elf: main.c libadd.so
	gcc -o $@ main.c -L. -ladd
libadd.so: add.o
	gcc -shared -o $@ $<
add.o: add.c
	gcc -c -fpic -o $@ $<

.PHONY: clean
clean:
	rm -f *.o libadd.so main.elf
