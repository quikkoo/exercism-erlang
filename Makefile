SHELL = /bin/sh

all:
	$(MAKE) -C anagram $@
	$(MAKE) -C bob $@
	$(MAKE) -C etl $@
	$(MAKE) -C hello-world $@
	$(MAKE) -C word-count $@

check:
	$(MAKE) -C anagram $@
	$(MAKE) -C bob $@
	$(MAKE) -C etl $@
	$(MAKE) -C hello-world $@
	$(MAKE) -C word-count $@

test:
	$(MAKE) -C anagram $@
	$(MAKE) -C bob $@
	$(MAKE) -C etl $@
	$(MAKE) -C hello-world $@
	$(MAKE) -C word-count $@

clean:
	$(MAKE) -C anagram $@
	$(MAKE) -C bob $@
	$(MAKE) -C etl $@
	$(MAKE) -C hello-world $@
	$(MAKE) -C word-count $@
