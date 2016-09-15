SHELL = /bin/sh

MODULE = bob

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
