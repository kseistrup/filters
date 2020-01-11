#!/usr/bin/env python
# -*- python -*-
"""
# filters/unik (2020-01-11)
#
# Print unique lines, keeping original line order.
# Think “sort | uniq” without sorting first.
#
# Copyright ©2018-20 Klaus Alexander Seistrup <klaus@seistrup.dk>.
# Released under the GNU General Public License v3+.
# Please see https://github.com/kseistrup/filters for details.
"""

from sys import (stdin, stdout)

SEEN = set()

for line in stdin:
    if line in SEEN:
        continue
    stdout.write(line)
    SEEN.add(line)

# eof
