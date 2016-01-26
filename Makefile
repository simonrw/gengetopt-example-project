run := perform
args_stub := cmdline
COMMON := -O2

all: $(run)

$(run): $(args_stub).o main.o
	$(CC) $^ -o $@ $(COMMON)

%.o: %.c
	$(CC) -c $< -o $@ $(COMMON)

main.c: $(args_stub).c

$(args_stub).c: arguments.ggo
	gengetopt --file-name $(args_stub) --unamed-opts < $<

clean:
	@-rm *.o
	@-rm $(args_stub).*
	@-rm $(run)


.PHONY: clean
.SECONDARY:
.SUFFIXES:
