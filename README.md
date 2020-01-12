# Filters

Tiny scripts that could [almost] have been one-liners, but aren't.

* **f** - easily select a range of fields separated by blanks
* **sortc** - sort unique lines according to their number of occurrence
* **unik** - print unique lines, keeping the original sort order
* **uniqc** - prefix unique lines with number of occurrences

----

## Requirements

* `awk`
* `bash`
* `sort`

Compiling the manpages from scratch requires

* `scdoc`

Using `Makefile` to install everything requires

* `make`
* `install`
* `gzip`

## Install

Install scripts to `/usr/local/bin` and manpages to `/usr/local/share/man/man1`:

```sh
$ sudo make install
```

Install scripts to `$PREFIX/bin` and manpages to `$PREFIX/share/man/man1`:

```sh
$ sudo make PREFIX=/usr install  # /usr/bin etc.
```

— or simply copy everything manually:

```sh
$ sudo mkdir -p /usr/local/bin/              # make sure $BINDIR exists
$ sudo cp -fax bin/* /usr/local/bin/
$ sudo mkdir -p /usr/local/man/man1          # make sure $MANDIR exists
$ sudo cp -fax man/*.1 /usr/local/man/man1/
```
