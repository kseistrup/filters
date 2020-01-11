#!/usr/bin/env -S awk -f
# -*- awk -*-

# filters/uniqc (2020-01-11)
#
# Print unique lines, prefixing lines by the number of occurrences.
# Think “sort | uniq -c” without having to sort the input first.
#
# Copyright ©2020 Klaus Alexander Seistrup <klaus@seistrup.dk>.
# Released under the GNU General Public License v3+.
# Please see https://github.com/kseistrup/filters for details.

{ seen[$0]++ }

END {
  for (key in seen)
    print sprintf("%7d\t%s", seen[key], key)
}

# eof
