F(1) "Filters"

# NAME

f - easily select a range of fields separated by blanks

# SYNOPSIS

*f* [_OPTIONS_] [_FIELDS_]

# OPTIONS

*-h*, *--help*
	Print a short help text and exit

# DESCRIPTION

*f* is shell script that combines *awk*'s field separation with
*cut*'s ability to select a range of fields.

_FIELDS_ can have one of the following forms:

N	Nth field, counted from 1++
N-	from Nth to last (included) field++
N-M	from Nth to Mth (included) field++
 -M	from first to Mth (included) field++
nf	synonym for the last field

# EXAMPLES

$ echo 1 2 3 4 5 | f 3++
3++
$ echo 1 2 3 4 5 | f 2-4++
2 3 4++
$ echo 1 2 3 4 5 | f nf++
5

If the _FIELDS_ argument is omitted, lines are printed verbatim.

# SEE ALSO

*awk*(1), *cut*(1)

# AUTHORS

Maintained by Klaus Alexander Seistrup <klaus@seistrup.dk>. Please
see https://github.com/kseistrup/f for full source and bug reports.
