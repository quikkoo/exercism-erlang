SHELL = /bin/sh

MODULE = hello-world

REBAR = rebar3
RM = rm -rf

all: test

check:
	$(REBAR) dialyzer

test: check
	$(REBAR) eunit
	$(REBAR) cover

clean:
	$(RM) _build *.lock
