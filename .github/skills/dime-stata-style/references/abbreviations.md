# Stata command abbreviations — accepted vs. forbidden

Quick-reference for the DIME Analytics Stata Style Guide rule on command
abbreviations. Rule summary:

- Abbreviations must be **at least three characters**, with only two
  exceptions: `tw` (`twoway`) and `di` (`display`).
- An abbreviation is acceptable only when it is **widely accepted** — i.e.
  appears in the table below.
- **Never abbreviate** `local`, `global`, `save`, `merge`, `append`, `sort`.
- User-written commands (SSC packages, `ietoolkit`, `iefieldkit`, etc.)
  typically do **not** support abbreviation at all — always write them out.
- **Options** may always be abbreviated to their shortest allowed form.
- Variable names must **never** be abbreviated (separate rule — see
  `style-guide.md` §4).

---

## Accepted abbreviations

| Abbreviation | Full command |
|:------------:|:------------:|
| `tw`         | `twoway`     |
| `di`         | `display`    |
| `gen`        | `generate`   |
| `mat`        | `matrix`     |
| `reg`        | `regress`    |
| `lab`        | `label`      |
| `sum`        | `summarize`  |
| `tab`        | `tabulate`   |
| `bys`        | `bysort`     |
| `qui`        | `quietly`    |
| `noi`        | `noisily`    |
| `cap`        | `capture`    |
| `forv`       | `forvalues`  |
| `prog`       | `program`    |
| `hist`       | `histogram`  |

If a command is not in this table, write it in full — even if Stata itself
accepts a shorter form.

---

## Forbidden abbreviations

Always spell these in full. Shortening them produces code that is harder to
search for, harder for less-experienced Stata users to recognise, and in some
cases genuinely ambiguous.

| Write in full | Don't abbreviate to |
|:-------------:|:-------------------:|
| `local`       | `loc`               |
| `global`      | `gl`                |
| `save`        | `sa`                |
| `merge`       | `mer`, `m`          |
| `append`      | `app`               |
| `sort`        | `so`                |

---

## Worked examples

**GOOD** — uses only accepted abbreviations, spells out the rest:

```stata
ieboilstart, version(13.1)
`r(version)'

sysuse auto.dta, clear

qui sum  price
local mean_price = r(mean)

gen      price_above_mean = (price > `mean_price')
lab var  price_above_mean "Car priced above the sample mean"

bys foreign: reg price mpg rep78 headroom
```

**BAD** — forbidden abbreviations and over-shortened commands:

```stata
ieboilstart, v(13.1)     // 'v' is not an accepted option abbreviation here
`r(v)'

sysuse auto.dta, c       // 'c' for clear is sub-three-character

qui su   price           // 'su' is two-character — prefer 'sum' or 'summarize'
loc mean_price = r(mean) // 'loc' for local — never abbreviate local

g    price_above_mean = (price > `mean_price') // 'g' for generate — sub-three

so foreign                                      // 'so' for sort — never
app using "other.dta"                           // 'app' for append — never
```

---

## Options

Option abbreviations are always fine at the shortest form the help file
allows. `help <command>` underlines the minimum unambiguous prefix for each
option in the syntax diagram. So, for example, `replace` as an option to
`save` can be abbreviated to `replac`, `repla`, `repl`, or `rep` as the help
file permits — the style rule about three-character minimums applies to
**commands**, not options.
