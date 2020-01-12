# OH, HAI!

PREFIX    ?= /usr/local
BINDIR    ?= $(DESTDIR)$(PREFIX)/bin/
MANDIR    ?= $(DESTDIR)$(PREFIX)/share/man/man1/

FILTERS   := $(wildcard bin/*)
SCDOCS    := $(wildcard man/*.1.md)
MANPAGES  := $(SCDOCS:.1.md=.1)
ZMANPAGES := $(MANPAGES:.1=.1.gz)

GZIP       = gzip
SCDOC      = scdoc
INSTALL    = install

AWK       ?= $(shell sh -c 'command -v awk  || echo "/usr/bin/awk"')
BASH      ?= $(shell sh -c 'command -v bash || echo "/usr/bin/bash"')
ENV       ?= $(shell sh -c 'command -v env  || echo "/usr/bin/env"')
SH        ?= $(shell sh -c 'command -v sh   || echo "/bin/sh"')

.PHONY: all
all: $(FILTERS) $(MANPAGES)

install: $(FILTERS) $(ZMANPAGES)
	$(INSTALL) -m 0755 $(FILTERS) $(BINDIR)
	$(INSTALL) -m 0644 $(ZMANPAGES) $(MANDIR)

man/%.1: man/%.1.md
	@$(SCDOC) <$< >$@

man/%.1.gz: man/%.1
	@$(GZIP) -c $< >$@

patch-awk: bin/unik bin/uniqc
	@sed "s|#!/usr/bin/awk|#!$(AWK)|g" -i $<
patch-bash: bin/f
	@sed "s|#!/usr/bin/bash|#!$(BASH)|g" -i $<
patch-env: $(FILTERS)
	@sed "s|#!/usr/bin/env|#!$(ENV)|g" -i $<
patch-sh: bin/sortc
	@sed "s|#!/bin/sh|#!$(SH)|g" -i $<

.PHONY: mostlyclean distclean clean
mostlyclean:
	@rm -vf *~ bin/*~ man/*~
clean: mostlyclean
	@rm -vf $(ZMANPAGES)
distclean: clean
	@rm -vf $(MANPAGES)

# eof
