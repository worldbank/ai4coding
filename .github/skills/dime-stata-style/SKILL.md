---
name: dime-stata-style
description: >
  Align Stata code (.do files, code blocks in .qmd/.Rmd, snippets in lectures)
  to the DIME Analytics Stata Style Guide from the DIME Data Handbook appendix.
  Use this skill whenever the user asks to write, review, clean up, refactor,
  lint, or teach Stata code — including requests to "follow DIME style", "apply
  World Bank / DIME best practices", "format this do-file", "audit this Stata
  script", or whenever Stata code is being produced for course materials in this
  repository. Also use when explaining *why* a piece of Stata code is (or is not)
  idiomatic. Always consult this skill before writing or editing Stata code in
  this project — do not rely on generic Stata habits, because the course teaches
  DIME conventions specifically.
metadata:
  author: Eduard Bukin
  version: "1.0"
  source: https://worldbank.github.io/dime-data-handbook/
license: MIT
---

# DIME Stata Style Skill

Guide for writing and reviewing Stata code that follows the **DIME Analytics Stata
Style Guide** (chapter 8 of the DIME Data Handbook appendix). This is the style
the course teaches — use it both when generating new `.do` code and when
reviewing or rewriting existing Stata snippets.

## Source of truth

The authoritative text lives in this repo at
[methods/dime-handbook-appendix.qmd](../../../methods/dime-handbook-appendix.qmd).
A distilled, example-first copy is bundled here so the rules are available even
if that file moves:

| Local file | What it covers |
|------------|----------------|
| `references/style-guide.md` | Full DIME Stata Style Guide, rule-by-rule, with GOOD/BAD examples |
| `references/review-checklist.md` | Compact audit checklist for reviewing an existing do-file |
| `references/abbreviations.md` | Accepted vs. forbidden command/variable abbreviations |

**Read the relevant reference file before proposing non-trivial edits** so the
advice matches the handbook verbatim.

---

## Decision tree

Match the user's request to the right flow:

1. **Writing new Stata code** → follow [Core rules](#core-rules) and the relevant
   sections of `references/style-guide.md`. Always start with
   [boilerplate](#10-boilerplate-and-master-do-files).
2. **Reviewing an existing do-file** → work through
   `references/review-checklist.md` top-to-bottom; report findings grouped by
   rule, with line numbers and suggested fixes.
3. **Refactoring / "align this to DIME style"** → first audit using the
   checklist, then rewrite section by section, preserving behaviour. Call out
   any behavioural changes explicitly (e.g. switching `if x` to `if x == 1`
   changes what happens when `x` is missing).
4. **Explaining a rule to a learner** → lead with the *why* (the handbook's
   rationale), then show a minimal GOOD/BAD pair. The course audience are peers
   learning to use Copilot/agents, so frame rules as things the human reviewer
   will check — not arbitrary taste.
5. **Stata question that isn't about style** (syntax, a command's behaviour)
   → answer the question, but still apply this style when producing code
   examples.

---

## Core rules

These are the rules that get violated most often. The full, formally worded
guide is in `references/style-guide.md` — this section is for quick recall.

### 1. Code must be correct *and* readable

Good Stata code has three dimensions the reviewer will judge:

- **Structure** — files, sections, and blocks are organised so a reader can
  locate and move pieces independently.
- **Syntax** — commands are used in a common, conventional way; no
  reverse-engineering required.
- **Style** — spacing, indentation, and naming communicate intent.

When in doubt, optimise for the stranger reading the code six months from now.

### 2. Comment for intent, not narration

Three comment forms (plus bookmarks added in Stata 17):

```stata
/*
    Multi-line comment — use for file-level or section-level documentation.
*/

* Single-line comment — documents up to a few lines of code.

sysuse auto.dta  // Inline comment — documents a single line.

**# Bookmark — creates a navigable anchor in the do-file editor.
```

Prefer **self-documenting code plus a *why* comment** over a *what* comment:

```stata
* WORST — cryptic
y = x * 480

* BAD — comment just restates the code
* Calculate income by multiplying hours by weekly wage
y = x * 480

* BEST — self-documenting code + a why comment on the magic number
**# Construct yearly income
local min_wage   12   // Minimum wage in Illinois for 2022
local work_hours 40
gen income = weeks_worked * `work_hours' * `min_wage'
```

### 3. Don't abbreviate commands below three characters

Acceptable short abbreviations: `tw` (`twoway`), `di` (`display`).
Acceptable three-letter+ abbreviations: `gen`, `mat`, `reg`, `lab`, `sum`,
`tab`, `bys`, `qui`, `noi`, `cap`, `forv`, `prog`, `hist`.

**Never abbreviate**: `local`, `global`, `save`, `merge`, `append`, `sort`.

User-written commands (e.g. from `ietoolkit`) generally don't support
abbreviation — write them out in full. See `references/abbreviations.md` for
the complete table.

### 4. Never abbreviate variable names

Spell every variable name out fully. `ieboilstart` turns `varabbrev` off, so
abbreviated variable names will error. Avoid wildcards (`*`, `?`, `-`) in
variable lists — the resolved list can change silently when the dataset
changes. Use `unab` or `lookfor` to build an explicit list in a local when you
need "all variables matching X".

### 5. Loop indexes describe what they iterate over

```stata
* GOOD
foreach crop in potato cassava maize {
    forvalues plot_num = 1/10 {
        * do something to `crop' on `plot_num'
    } // End plot loop
} // End crop loop

* BAD
foreach i in potato cassava maize {
    * do something to `i'
}
```

`i`/`j` are only acceptable for generic examples, iteration counters, and
matrix row/column indexes.

### 6. Use white space to make structure visible

Vertically align columns of similar statements so typos stand out:

```stata
* GOOD — alignment makes `employed` the visible subject
gen      employed = 1
replace  employed = 0 if (_merge == 2)
lab var  employed "Person exists in employment data"
lab def            yesno 1 "Yes" 0 "No"
lab val  employed  yesno
```

Indent **four spaces** (not tabs) inside every `{ ... }` block, and another
four for each level of nesting. Tabs render inconsistently across editors and
GitHub.

### 7. Conditional expressions: wrap, be explicit, handle missing

- Wrap every condition in at least one `( ... )`.
- Use `!` for negation, never `~`.
- Use **explicit truth checks**: `if x == 1`, not `if x`.
- Use `missing(var)` instead of `var >= .`.
- Think about missing values every time — `if x != 1` is `true` when `x` is
  missing; that is almost never what you want.
- When cases are mutually exclusive, use `if { } else { }` — not two separate
  `if`s, which is error-prone and obscures the intent.

### 8. File paths: quoted, forward-slashed, absolute, dynamic

```stata
* GOOD — absolute paths built from globals set in a master do-file
global myDocs    = "C:/Users/username/Documents"
global myProject = "${myDocs}/MyProject"
use "${myProject}/my-dataset.dta", clear

* BAD — relative path via cd (cd mutates implicitly and surprises later code)
cd "C:/Users/username/Documents/MyProject"
use MyDataset.dta

* BAD — static absolute path (breaks on every collaborator's machine)
use "C:/Users/username/Documents/MyProject/MyDataset.dta"
```

Rules:

- Always double-quote paths.
- Always use forward slashes `/` — backslashes break on Mac/Linux and are Stata
  escape characters (`"C:\Users\...\`proj'"` does not expand `` `proj' ``).
- File **names** are lowercase-with-dashes: `my-file.dta`.
- Always include the extension (`.dta`, `.do`, `.csv`).
- Avoid `cd`; prefer absolute + dynamic paths via globals.

### 9. Line breaks: use `///`, break around 80 characters

```stata
* GOOD
graph hbar invil      /// Proportion in village
     if (priv == 1)   /// Private facilities only
   , over(statename, sort(1) descending)    /// Order states by values
     blabel(bar, format(%9.0f))             /// Label the bars
     ylab(0 "0%" 25 "25%" 50 "50%" 75 "75%" 100 "100%") ///
     ytit("Share of private primary care visits made in own village")
```

- Never use `#delimit` in analytical code.
- Never wrap a line with `/* */` — reserve those for real comments.
- For long arithmetic expressions, put `+` and `-` at the *start* of the new
  line; keep `*` and `/` inline.

### 10. Boilerplate and master do-files

Every standalone do-file should open with boilerplate to harmonise settings
across machines and Stata versions:

```stata
* GOOD — ieboilstart handles version, more, varabbrev, matsize, memory, clearing
ieboilstart, version(13.1)
`r(version)'

* ACCEPTABLE — manual equivalent when ieboilstart is unavailable
set more off , perm
clear all
set maxvar 10000
version 13.1
```

Install user-written commands at the top of the master do-file so collaborators
don't have to hunt for packages. Use `run file.do` (not `do file.do`) from a
master script to avoid printing output to the Results window.

### 11. Operators, spacing, and quiet execution

- Spaces around binary operators except `^`: `gen z = x + y`, `gen z = x^2`.
- Order of operations may tighten spacing: prefer
  `hours + (minutes/60) + (seconds/3600)` over uniformly spaced arithmetic.
- Multiple graphs: `tw (xx)(xx)(xx)`, not `tw xx||xx||xx`.
- Use `qui` to suppress noisy output from `sum`, `tab`, `reg` when you only
  need the stored r-class results — it is also faster.

---

## Workflow: reviewing an existing do-file

1. Open `references/review-checklist.md` and keep it in view.
2. Read the file top-to-bottom. For each violation, record:
   `line_number — rule name — current code — suggested fix`.
3. Group findings by rule, highest-impact first (boilerplate, file paths,
   variable abbreviation > whitespace). Teaching-wise, fixing one rule across
   the whole file is more memorable than ten scattered nits.
4. Offer the rewrite as an edit, not as an opaque rewrite — show the diff.
5. Where a rule has a behavioural implication (missing values, `cd`, variable
   abbreviation), **name the behavioural risk**, not just the style rule.

## Workflow: writing new Stata code

1. Start with boilerplate (`ieboilstart, version(...)` + `` `r(version)' ``).
2. Declare globals for all paths at the top; never `cd`.
3. Name variables and loop indexes descriptively — no `i`, `j`, `tmp`, `x1`.
4. Wrap conditions in parens, use `!`/`missing()`, consider missing values.
5. Indent 4 spaces inside every block; align related assignments vertically.
6. Wrap long lines with `///` around 80 chars; close loops with a
   `} // End <name> loop` comment.
7. Comment the *why*, not the *what*. One `**#` bookmark per logical section.

---

## Communication notes for this course

- The audience are World Bank staff learning to use Copilot/agents effectively.
  When the agent is generating Stata code, the human reviewer is checking it
  against this style guide — so frame suggestions as "the reviewer will flag
  this" rather than as machine rules.
- Cite the handbook chapter (e.g. "DIME Handbook §8 — Writing loops") when
  the rationale is non-obvious; it helps learners build the mental model.
- Keep examples small and runnable on Stata's built-in datasets (`sysuse
  auto.dta`) where possible, so learners can copy-paste and try them.
