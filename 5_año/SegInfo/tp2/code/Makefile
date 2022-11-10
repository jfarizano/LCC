all: stack exploit exploit2

stack:
	gcc stack.c -o stack -z execstack -fno-stack-protector
	sudo chown root stack
	sudo chmod 4755 stack

dashtest:
	gcc dash_shell_test.c -o dash_shell_test
	sudo chown root dash_shell_test
	sudo chmod 4755 dash_shell_test

exploit:
	gcc exploit.c -o exploit

exploit2:
	gcc exploit2.c -o exploit2

badfile: exploit
	./exploit

badfile2: exploit2
	./exploit2

.PHONY: clean
clean:
	rm -f *.out
	rm -f exploit
	rm -f stack
	rm -f badfile
	rm -f exploit2
	rm -f dash_shell_test
