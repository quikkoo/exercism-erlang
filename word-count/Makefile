SHELL = /bin/sh

MODULE = word-count

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
