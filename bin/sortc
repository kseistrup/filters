#!/bin/sh
# -*- sh -*-

# filters/sortc (2020-01-11)
#
# Sort unique lines according to their number of occurrence.
# Think “sort | uniq -c | sort -rn” without the initial sort.
#
# Copyright ©2020 Klaus Alexander Seistrup <klaus@seistrup.dk>.
# Released under the GNU General Public License v3+.
# Please see https://github.com/kseistrup/filters for details.

awk '
  { seen[$0]++ }

  END {
    for (key in seen)
      print sprintf("%7d\t%s", seen[key], key)
  }
' | sort -rn

# eof
