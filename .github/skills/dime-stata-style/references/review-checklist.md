# DIME Stata Style — review checklist

A compact, ordered checklist for auditing a Stata do-file (or a code block in
a `.qmd` / `.Rmd`) against the DIME Analytics Stata Style Guide. Work through
it top-to-bottom. For each violation, record:

    line_number — rule name — current code — suggested fix

Group findings in the final report **by rule**, highest-impact first. A reader
learns more from "every variable name in the file is abbreviated, here's the
fix pattern" than from ten scattered nits.

The order below roughly matches behavioural risk: the earlier items silently
change what the code does; the later ones only hurt readability.

---

## A. Behavioural-risk rules (fix first)

### A1. Boilerplate is present at the top of the file

- [ ] File opens with `ieboilstart, version(...)` followed by `` `r(version)' ``
      — or, if `ieboilstart` is unavailable, the ACCEPTABLE manual equivalent:
      `set more off , perm` / `clear all` / `set maxvar 10000` / `version X`.
- [ ] If the file depends on user-written commands, the master do-file
      installs them (`ssc install ...`) before running sub-scripts.

### A2. File paths are quoted, forward-slashed, absolute, and dynamic

- [ ] Every path is wrapped in double quotes.
- [ ] No backslashes in paths (backslashes break on Mac/Linux *and* escape
      locals: `"C:\Users\\\`proj'"` will not expand).
- [ ] File names are lowercase-with-dashes (`my-file.dta`) — not spaces, not
      CamelCase.
- [ ] Every path includes the file extension (`.dta`, `.do`, `.csv`, …).
- [ ] All paths are absolute and built from **global macros** declared in the
      master do-file.
- [ ] `cd` is not used (unless a specific command genuinely requires it).

### A3. Variable names are never abbreviated

- [ ] No variable is referenced by an abbreviation.
- [ ] No wildcards (`*`, `?`, `-`) in variable lists. Where "all vars matching
      X" is really needed, the file uses `unab` or `lookfor` to build an
      explicit local, then uses that local.

### A4. Conditional expressions handle missing values

- [ ] Every condition is wrapped in at least one `( ... )`.
- [ ] Negation uses `!`, not `~`.
- [ ] Truth checks are **explicit**: `if x == 1`, not `if x`.
- [ ] Missingness uses `missing(var)`, not `var >= .`.
- [ ] For each condition involving a possibly-missing variable, the author
      considered what happens when it *is* missing. `if x != 1` is `true` on
      missing — this is almost always wrong.
- [ ] Mutually exclusive branches use `if { } else { }`, not two separate
      `if`s.

### A5. Command abbreviations are within the accepted set

- [ ] No command is abbreviated to fewer than three characters, except `tw`
      and `di`.
- [ ] Abbreviations used are from the accepted list (see
      `abbreviations.md`).
- [ ] `local`, `global`, `save`, `merge`, `append`, `sort` appear in full
      form.
- [ ] User-written commands (e.g. `ietoolkit`, `iefieldkit`) are written in
      full.

---

## B. Readability rules

### B1. Comments: *why*, not *what*

- [ ] The file opens with a multi-line `/* ... */` comment describing its
      purpose.
- [ ] Each logical section starts with a `**#` bookmark (Stata 17+) or a
      single-line `*` comment header.
- [ ] Comments explain *why* a line or block is the way it is — magic
      numbers, data quirks, design decisions.
- [ ] No comments that merely restate what the code does (`* Calculate income
      by multiplying the number of hours by the weekly wage` above `y = x *
      480`).
- [ ] Inline `//` comments are used for single-line clarifications only.

### B2. Loops

- [ ] The name of the index in every `foreach` / `forvalues` describes what
      it loops over (`crop`, `plot_num`, `household_member`) — not `i` or
      `j`.
- [ ] `i` / `j` appear only in generic examples, iteration counters, or
      matrix row/column indexing.
- [ ] Nested loops end with a `} // End <name> loop` comment for clarity.

### B3. White space and indentation

- [ ] Every block inside `{ ... }` is indented **four literal spaces** (not
      tabs). Nested blocks add another four per level.
- [ ] Closing `}` aligns with the opening keyword, not the block body.
- [ ] Continuation lines after `///` are indented under the initial command.
- [ ] Columns of related statements (sequences of `gen` / `replace` / `lab
      var` / `lab val` acting on the same variable) are vertically aligned so
      the subject of the block is visually obvious.

### B4. Line breaks

- [ ] No line is meaningfully longer than ~80 characters without a `///`.
- [ ] Line continuation uses `///` — never `#delimit`, never `/* */` to wrap.
- [ ] `///` lines break at sensible points (one option per line, comma on its
      own line, etc.), not arbitrarily.
- [ ] When useful, each `///` line carries a trailing inline comment
      explaining that option.
- [ ] In multi-line arithmetic, `+` and `-` start the new line; `*` and `/`
      stay inline.

### B5. Operators and graphs

- [ ] Binary operators have one space on each side, except `^` (`x^2`, not
      `x ^ 2`).
- [ ] Spacing / parentheses make operator precedence visible
      (`hours + (minutes/60) + (seconds/3600)`).
- [ ] Multi-graph commands use `tw (xx)(xx)(xx)`, not `tw xx||xx||xx`.

### B6. Output and performance hygiene

- [ ] `sum`, `tab`, `reg` used purely to store r-class results are prefixed
      with `qui`.
- [ ] Master do-files use `run file.do` rather than `do file.do` for
      sub-scripts.

---

## C. Final pass: does it read well?

- [ ] Someone encountering this file for the first time can tell, within ~30
      seconds, what it does and in what order.
- [ ] Each section can be moved, commented out, or reused independently
      without breaking the next section.
- [ ] A typo in a variable name, a missing option, or a wrong sign would be
      visually obvious — not buried in a wall of unaligned text.

---

## Reporting the review

Open the report with a one-sentence summary ("Overall the file is close to
DIME style; three recurring issues — abbreviated variables, missing
boilerplate, and `cd`-based paths — account for most findings"), then list
findings grouped by rule. Close with a prioritised fix list:

1. Behavioural-risk fixes (section A) — apply immediately.
2. Structural fixes (B1–B3) — apply in one pass.
3. Cosmetic fixes (B4–B6) — optional polish.

This ordering keeps the learner focused on fixes that change correctness or
portability before ones that only change appearance.
