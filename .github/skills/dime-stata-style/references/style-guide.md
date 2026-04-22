# DIME Analytics Stata Style Guide — full reference

Verbatim extract of the DIME Analytics Stata Style Guide from the DIME Data
Handbook appendix (chapter 8). Source:
<https://worldbank.github.io/dime-data-handbook/>.

The in-repo copy is [methods/dime-handbook-appendix.qmd](../../../../methods/dime-handbook-appendix.qmd).
This file preserves the handbook wording, the full rationale, and every
GOOD / BAD / ACCEPTABLE / UGLY example, so the skill can be applied without
network access and without re-reading the full appendix.

---

## Table of contents

1. [What makes code "good"](#1-what-makes-code-good)
2. [Commenting code](#2-commenting-code)
3. [Abbreviating commands](#3-abbreviating-commands)
4. [Abbreviating variable names](#4-abbreviating-variable-names)
5. [Writing loops](#5-writing-loops)
6. [Using white space](#6-using-white-space)
7. [Writing conditional expressions](#7-writing-conditional-expressions)
8. [Writing file paths](#8-writing-file-paths)
9. [Using line breaks](#9-using-line-breaks)
10. [Using boilerplate code](#10-using-boilerplate-code)
11. [Miscellaneous](#11-miscellaneous)

---

## 1. What makes code "good"

Good code has **two** elements:

1. It is **correct** — it runs without errors and produces the intended output.
2. It is **useful and comprehensible** — to someone who has not seen it
   before, or to the author weeks, months, or years later.

Good code has **three** major dimensions:

- **Structure** — the environment and file organisation in which the code
  lives. Functional blocks should be independent enough that they can be
  shuffled, repurposed, or deleted without breaking other blocks.
- **Syntax** — the literal language of the code. Commands are used in a
  common, conventional way so another reader can follow the author's intent
  without reverse-engineering.
- **Style** — non-functional elements (spacing, indentation, naming) that
  make code quickly and accurately understandable on first read.

Habit to build: **keep `help` open at all times**. Re-reading help files is
not a beginner behaviour — it is how experienced Stata users stay accurate.
`help [command]` opens the relevant file (e.g. `help isid`).

---

## 2. Commenting code

Comments do not change execution but are essential for readers (including
future-you). There are three comment forms, plus bookmarks (Stata 17+).

### Multi-line comment — for files or long sections

```stata
/*
    This is a do-file with examples of comments in Stata. This
    type of comment is used to document all of the do-file or a large
    section of it.
*/
```

### Single-line comment — for a task of a few lines

```stata
* Standardize settings, explicitly set version, and clear memory
* (This comment is used to document a task covering at maximum a few lines of code)
ieboilstart, version(13.1)
`r(version)'
```

### Inline comment — for a single line

```stata
* Open the dataset
sysuse auto.dta // Built in dataset (This comment is used to document a single line)
```

### Bookmark — navigable anchor (Stata 17+)

```stata
**# Settings (This comment creates a navigable bookmark)
ieboilstart, version(13.1)
`r(version)'
```

### Comment style: *why*, not *what*

Prefer self-documenting code over explanatory comments; when you do comment,
explain *why*.

**WORST — cryptic**

```stata
y = x * 480
```

**BAD — cryptic code explained by a *what* comment**

```stata
* Calculate income by multiplying the number of hours weeks worked by the weekly wage
y = x * 480
```

**BETTER — self-documenting code**

```stata
**# Construct yearly income

local min_wage   12
local work_hours 40

income = weeks_worked * `weekly_work_hours' * `hourly_wage'
```

**BEST — self-documenting code with a *why* comment**

```stata
**# Construct yearly income

local min_wage   12 // Minimum wage in Illinois for 2022. Source: https://www2.illinois.gov/idol/Laws-Rules/FLS/Pages/minimum-wage-law.aspx
local work_hours 40

income = weeks_worked * `weekly_work_hours' * `hourly_wage'
```

---

## 3. Abbreviating commands

Stata allows many built-in commands to be shortened, but abbreviating below
three characters is confusing — two-letter abbreviations rarely "pronounce" in
a way that connects back to the command's purpose.

**Rules**

- Abbreviations must be **at least three characters** — exceptions: `tw`
  (`twoway`) and `di` (`display`).
- Use an abbreviation only when it is widely accepted.
- **Never abbreviate**: `local`, `global`, `save`, `merge`, `append`, `sort`.
- Options may be abbreviated to their shortest allowed form — always fine.
- User-written commands typically do not support abbreviation.

**Accepted abbreviations of common Stata commands**

| Abbreviation | Command |
| :---: | :---: |
| `tw` | `twoway` |
| `di` | `display` |
| `gen` | `generate` |
| `mat` | `matrix` |
| `reg` | `regress` |
| `lab` | `label` |
| `sum` | `summarize` |
| `tab` | `tabulate` |
| `bys` | `bysort` |
| `qui` | `quietly` |
| `noi` | `noisily` |
| `cap` | `capture` |
| `forv` | `forvalues` |
| `prog` | `program` |
| `hist` | `histogram` |

---

## 4. Abbreviating variable names

Variable names must **never** be abbreviated; always spell them in full. If a
new variable is added later whose name shares a prefix, old abbreviations stop
being unique and the code silently changes behaviour.

`ieboilstart` executes `set varabbrev off` by default, so any code that relies
on variable abbreviation will break.

Wildcards and lists (`*`, `?`, `-`) in variable lists are also **discouraged**,
for the same reason: if the dataset is reordered or a column is added, the
resolved list can change silently. To capture "all variables matching X", use
`unab` or `lookfor` to build the list into a local macro explicitly, then
verify it before using it.

---

## 5. Writing loops

Naming the local generated by `foreach` / `forvalues` descriptively makes code
far easier to read, especially inside nested loops. One-letter indexes are
acceptable only for:

- generic examples,
- iteration counters using `i`,
- matrix row/column indexes using `i` and `j`.

**GOOD**

```stata
* Loop over crops
foreach crop in potato cassava maize {
    * do something to `crop'
}
```

**GOOD — nested loops, with closing-brace comments**

```stata
* Loop over crops
local crops potato cassava maize
foreach crop of local crops {
    * Loop over plot number
    forvalues plot_num = 1/10 {
        * do something to `crop' in `plot_num'
    } // End plot loop
} // End crop loop
```

**BAD**

```stata
* Loop over crops
foreach i in potato cassava maize {
   * do something to `i'
}
```

---

## 6. Using white space

In Stata, whitespace is free and changes nothing functionally — but it makes a
large difference to readability. Researchers already align columns in
PowerPoint and Excel; do the same in code.

### Vertical alignment

**ACCEPTABLE**

```stata
* Create dummy for being employed
gen employed = 1
replace employed = 0 if (_merge == 2)
lab var employed "Person exists in employment data"
lab def yesno 1 "Yes" 0 "No"
lab val employed yesno
```

**GOOD — alignment makes `employed` visibly the subject**

```stata
* Create dummy for being employed
gen      employed = 1
replace  employed = 0 if (_merge == 2)
lab var  employed "Person exists in employment data"
lab def           yesno 1 "Yes" 0 "No"
lab val  employed yesno
```

### Indentation

- Any block inside `{ ... }` (loop, `if`, `else`) is indented **four spaces**
  relative to the opening keyword.
- Nested blocks add another four spaces per level.
- Closing `}` aligns with the opening keyword, not the block body.
- Continuation lines after `///` are indented under the initial command.
- Use **literal spaces**, not tabs. The tab character the Stata do-file editor
  inserts does not render consistently across platforms (notably on GitHub).

**GOOD**

```stata
* Loop over crops
foreach crop in potato cassava maize {
    * Loop over plot number
    forvalues plot_num = 1/10 {
        gen crop_`crop'_`plot_num' = "`crop'"
    }
}

* or
local sampleSize = `c(N)'
if (`sampleSize' <= 100) {
    gen use_sample = 0
}
else {
    gen use_sample = 1
}
```

**BAD — no indentation**

```stata
* Loop over crops
foreach crop in potato cassava maize {
* Loop over plot number
forvalues plot_num = 1/10 {
gen crop_`crop'_`plot_num' = "`crop'"
}
}
```

---

## 7. Writing conditional expressions

Rules:

- **Wrap every condition in at least one set of parentheses.**
- Negate with `!`, not `~`.
- Use **explicit truth checks**: `if 'value' == 1`, not `if 'value'`.
- Use `missing('var')` rather than `'var' >= .`.
- Always consider whether missing values will affect the evaluation; modify
  the condition as needed.

**GOOD**

```stata
replace gender_string = "Woman" if  gender == 1
replace gender_string = "Man"   if (gender ~= 1)
```

**BAD**

```stata
replace gender_string = "Woman" if  (gender == 1)
replace gender_string = "Man"   if ((gender != 1) & !missing(gender))
```

> Note: the handbook's "GOOD" example here uses `~=`. The rule above is "use
> `!` and not `~`" — when in doubt, prefer `!=`. The key teaching point is to
> *reason about the missing-value case* explicitly, rather than piling on
> `!missing(...)` defensively.

### `if` vs `if-else`

Use `if-else` when the two cases are mutually exclusive. It communicates
mutual exclusivity, is less error-prone, and is easier to update if the
condition changes.

**GOOD**

```stata
if (`sampleSize' <= 100) {
    * do something
}
else {
    * do something else
}
```

**BAD**

```stata
if (`sampleSize' <= 100) {
    * do something
}
if (`sampleSize' > 100) {
    * do something else
}
```

---

## 8. Writing file paths

Rules:

- Always enclose paths in **double quotes**.
- Always use **forward slashes** (`/`) in folder hierarchies.
- File **names**: lowercase, dash-separated, e.g. `my-file.dta`.
- Always include the **extension** (`.dta`, `.do`, `.csv`, …).
- Paths must be **absolute** (start at root: `C:/`, `/Users/`, …).
- Paths must be **dynamic** — built from global macros set once in a master
  do-file.
- **Do not use `cd`** unless a command genuinely requires it. Many Stata
  commands implicitly change the working directory, so `cd` produces
  silently-wrong behaviour across a long do-file.

Backslashes fail for two reasons: (a) Mac/Linux cannot read them, and (b) `\`
is Stata's escape character, so `"C:\Users\username\`proj'"` references a
literal folder called `` `proj' `` instead of expanding the local.

**GOOD**

```stata
global myDocs    = "C:/Users/username/Documents"
global myProject = "${myDocs}/MyProject"
use "${myProject}/my-dataset.dta", clear
```

**BAD — relative path via `cd`**

```stata
cd "C:/Users/username/Documents/MyProject"
use MyDataset.dta
```

**BAD — static absolute path**

```stata
use "C:/Users/username/Documents/MyProject/MyDataset.dta"
```

Why dynamic globals win: migrating to a new machine or collaborator requires
only updating one line — the global — rather than every path. Multiple folder
globals are fine and encouraged (e.g. `${rawData}`, `${cleanData}`,
`${outputs}`).

---

## 9. Using line breaks

A line wider than ~80 characters is hard to read. Stata's editor shows a
guideline at that length.

- Use `///` to continue the same logical command on the next line. Stata
  treats the next line as a continuation.
- Do **not** rely on the editor's auto-wrap — active `///` placement keeps
  the line breaks where the code is most readable.
- Break at points that make functional sense (e.g. one option per line).
- Writing inline comments after `///` (or `//`) is helpful, especially when
  the line break separates logical parts of a single command.
- `///` marks need not be vertically aligned, though alignment often helps
  readability — and continuation lines should be indented under the command.

`#delimit` is reserved for advanced programming and is **officially
discouraged** in analytical code (Cox 2005). `/* */` should not be used to
wrap a line of code — that form is for comments only, and wrapping with it is
distracting and error-prone.

**GOOD**

```stata
graph hbar invil      /// Proportion in village
     if (priv == 1)   /// Private facilities only
   , over(statename, sort(1) descending)    /// Order states by values
     blabel(bar, format(%9.0f))             /// Label the bars
     ylab(0 "0%" 25 "25%" 50 "50%" 75 "75%" 100 "100%") ///
     ytit("Share of private primary care visits made in own village")
```

**BAD — `#delimit`**

```stata
#delimit ;
graph hbar
    invil if (priv == 1)
  , over(statename, sort(1) descending) blabel(bar, format(%9.0f))
    ylab(0 "0%" 25 "25%" 50 "50%" 75 "75%" 100 "100%")
    ytit("Share of private primary care visits made in own village");
#delimit cr
```

**UGLY — wrapping with `/* */`**

```stata
graph hbar /*
*/    invil if (priv == 1)
```

---

## 10. Using boilerplate code

Boilerplate is the short block at the top of every do-file that harmonises
settings across Stata installations. No two Stata installations are guaranteed
to behave identically, but boilerplate closes most of the gap.

`ieboilstart` (from `ietoolkit`) is the DIME-recommended boilerplate. In two
lines it:

- pins the Stata version (`version(...)`),
- turns `more` off so output never pauses,
- turns `varabbrev` off so abbreviated variables error,
- maximises allowed memory and matrix size (avoids rejection on Stata/IC vs
  Stata/SE or across Stata 14 vs 15 vs 17),
- clears all stored information, approximating a fresh session.

**GOOD**

```stata
ieboilstart, version(13.1)
`r(version)'
```

**ACCEPTABLE — manual equivalent**

```stata
set more off , perm
clear all
set maxvar 10000
version 13.1
```

Install any user-written commands at the top of the **master** do-file. That
way collaborators never have to hunt for packages.

---

## 11. Miscellaneous

- **Multiple graphs** should be combined as `tw (xx)(xx)(xx)`, not
  `tw xx||xx||xx`.
- **Spacing around binary operators**: one space on each side of every binary
  operator *except* `^`. Write `gen z = x + y` and `gen z = x^2`.
- **Order-of-operations spacing**: when precedence matters, tighten spacing
  and add parentheses to make precedence visible. Prefer
  `hours + (minutes/60) + (seconds/3600)` over
  `hours + minutes / 60 + seconds / 3600`.
- **Long expression line breaks**: `+` and `-` start the new line; `*` and
  `/` stay inline. Example:

  ```stata
  gen newvar = x ///
               - (y/2) ///
               + a * (b - c)
  ```

- **Printing output is slow.** Use `qui` to suppress output from `sum`, `tab`,
  `reg`, etc. when you only need the stored r-class results — it is also
  faster than printing.
- Use `run file.do` rather than `do file.do` inside a master do-file, to
  avoid flooding the Results window.

---

## Reference

DIME Analytics (World Bank). *Development Research in Practice — The DIME
Analytics Data Handbook*, Appendix: DIME Analytics Coding Guide, Chapter 8.
<https://worldbank.github.io/dime-data-handbook/>.

Cox, N. J. (2005). *Suggestions on Stata programming style*. The Stata
Journal, 5(4), 560–566.
