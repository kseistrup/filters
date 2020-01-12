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

.PHONY: all
all: $(FILTERS) $(MANPAGES)

install: $(FILTERS) $(ZMANPAGES)
	$(INSTALL) -m 0755 $(FILTERS) $(BINDIR)
	$(INSTALL) -m 0644 $(ZMANPAGES) $(MANDIR)

man/%.1: man/%.1.md
	@$(SCDOC) <$< >$@

man/%.1.gz: man/%.1
	@$(GZIP) -c $< >$@

.PHONY: mostlyclean distclean clean
mostlyclean:
	@rm -vf *~ bin/*~ man/*~
clean: mostlyclean
	@rm -vf $(ZMANPAGES)
distclean: clean
	@rm -vf $(MANPAGES)

# eof
