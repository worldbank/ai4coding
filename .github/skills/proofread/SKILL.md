---
name: proofread
description: >
  Apply strict spelling, grammar, punctuation, and product-name capitalisation
  fixes to Quarto markdown (.qmd) and markdown (.md) files in this course.
  Mechanical and objective only — does NOT touch style, tone, wordiness, flow,
  or any subjective judgement call; for those, use the `file-review` prompt.
  Use whenever the user asks to proofread, copy-edit for correctness, fix
  typos, or clean up mechanical text errors in course materials. This skill
  knows how to preserve Quarto-specific syntax (YAML front matter, fenced
  divs, CSS class attributes, code blocks, shortcodes, image attributes) so
  markup is never damaged.
metadata:
  author: AI4Coding Course (Eduard Bukin)
  version: "1.0"
license: MIT
---

# Proofread Skill

Strict, mechanical proofreading of `.qmd` and `.md` files in this course. The
goal is a file where every spelling, grammar, punctuation, and product-name
error a careful human reader would catch is either fixed (when the fix is
unambiguous) or flagged for the author (when it is not).

The guiding principle is **safety first**: a flag the author resolves in ten
seconds is always better than a silent rewrite that changes their meaning.

---

## What this skill does and does not do

**In scope — apply fixes directly:**

1. **Spelling** — typos and misspellings, enforced to **US English** (the
   repo's house convention).
2. **Grammar** — subject-verb agreement, article usage (`a`/`an`/`the`),
   prepositions, tense, pronoun reference, clear sentence fragments where the
   intended reading is unambiguous.
3. **Punctuation** — missing or stray commas, apostrophes (`it's` vs `its`),
   em-dashes, ellipses, quotation marks, spacing around punctuation, double
   spaces after a period.
4. **Product-name capitalisation** — proper names of tools, languages, and
   services (see [product-name table](#product-and-tool-name-capitalisation)).

**Out of scope — never edit as part of this skill:**

- Style, wordiness, tone, register.
- Sentence or paragraph restructuring, clarity rewrites.
- Parallelism across a list or flow between sections.
- Consistency of terminology across a document (e.g. "MCP" treated as
  singular in one bullet and plural in another — flag the inconsistency,
  do not silently pick one).
- YAML errors that are not about prose (missing keys, bad indentation).
- Broken image paths or broken hyperlinks.

Those belong in the `file-review` prompt, not here. If the user asks for any
of them, say so and point them at `/file-review`.

---

## The "fix or flag" rule

If a fix would change the meaning of the sentence, **do not guess — flag it**.
Leave the original text on its line; put a flag on the line immediately above:

```markdown
<!-- REVIEW: sentence is missing a word between "in a" and "are"; intent unclear -->
the number of interactions you can have with the AI in a are costly
```

Flagging is the safe default. A human reading a one-line flag can fix it in
seconds; an aggressive auto-rewrite can silently alter meaning and is much
harder to catch in review.

Use `<!-- REVIEW: <short reason> -->` for proofread flags. Do not invent new
tag names; other prompts (`file-review`, `revise-slides`) use `FLOW`, `FORMAT`,
`BROKEN-LINK`, etc. — keep those reserved.

---

## Things to preserve exactly — do not touch

The proofread pass must never alter any of the following. They are either
configuration, identifiers, or markup — not prose:

| Construct | Example | Why |
|---|---|---|
| YAML front-matter values | `theme: [simple, custom.scss]` | configuration, parsed literally |
| Fenced code blocks | ```` ```{.stata} ... ``` ```` | code must compile verbatim |
| Inline code spans | `` `useradd` `` | command or identifier, not prose |
| URL inside `[text](url)` | `[docs](https://x.com/y)` | fix `text`, never `url` |
| Fenced div attributes | `::: {.column width="50%"}` | Pandoc markup |
| CSS class spans | `[word]{.fg}` | preserve the class; fix the word only |
| Image attributes | `![](x.png){fig-align="center"}` | Pandoc markup |
| Shortcodes | `{{< fa icon >}}` | Quarto shortcode syntax |
| Math | `$x^2$`, `$$ ... $$` | LaTeX, not prose |
| Existing HTML flags | `<!-- REVIEW: ... -->`, `<!-- FLOW: ... -->` | author or prior-pass annotations |
| File paths in prose | `.vscode/mcp.json`, `day1/index.qmd` | do not re-case filenames |
| Package / module names | `ieboilstart`, `ggplot2`, `reghdfe` | code identifiers, even in prose |

**You may — and should — proofread:**

- Prose inside callout blocks (`::: {.callout-tip} ... :::`).
- Slide titles and section headings.
- Image alt text: `![alt text here](...)`.
- Link text: `[link text here](url)`.
- Figure captions and table cell prose.
- YAML `title`, `subtitle`, and `description` values if they are prose sentences.

---

## US English spellings

This repo is US English. Common substitutions:

| UK | US |
|---|---|
| specialised | specialized |
| optimise / optimised | optimize / optimized |
| organise / organised | organize / organized |
| customise / customised | customize / customized |
| analyse | analyze |
| colour | color |
| behaviour | behavior |
| centre | center |
| programme (software) | program |
| grey | gray |
| defence | defense |
| licence (noun) | license |
| travelled / travelling | traveled / traveling |
| catalogue | catalog |
| capitalisation | capitalization |

The `-ize` / `-ise` split is the most common source of drift — enforce `-ize`.
Double-consonant endings before a suffix (travelled, cancelled) collapse to a
single L in US usage.

**Do not rewrite quotations, proper names, or direct quotes from UK sources.**
If a citation, a block quote, or a product name (`The Centre for X`) contains
British spelling, leave it.

---

## Product and tool name capitalisation

Canonical forms used in this course:

| Write | Not |
|---|---|
| GitHub | github, Github |
| GitHub Copilot | github copilot, Github CoPilot |
| VS Code | vs code, VSCode |
| Visual Studio Code | visual studio code |
| Positron | positron |
| Quarto | quarto |
| RevealJS | revealjs (except inside code/YAML like `revealjs:`) |
| Markdown (the format) | markdown |
| JavaScript | javascript, Javascript |
| Python | python (when naming the language) |
| Stata | stata (when naming the software) |
| R (the language) | r (context-dependent; leave as-is inside code) |
| Anthropic | anthropic |
| World Bank | world bank |
| MCP / Model Context Protocol | mcp, Mcp |
| VS Code Marketplace | vs code marketplace |

**Context rule:** inside code blocks, YAML keys/values, and file paths, do
not change casing. `revealjs:`, `{.stata}`, `custom.scss` are identifiers, not
prose.

---

## Grammar points worth checking deliberately

These slip past spell-check and cause most trouble in course materials:

- **Subject-verb agreement with abbreviations.** Treat the abbreviation as
  its expansion: "MCP is…" (the *protocol* is), "LLMs are…" (the *models* are).
  If the same document uses both forms, that's an inconsistency — flag it
  (`<!-- REVIEW: "MCP" used as plural here and singular at L58 - pick one -->`),
  do not silently pick.
- **`it's` vs `its`.** `it's` = "it is"; `its` = possessive.
- **`affect` vs `effect`.** Usually `affect` is the verb, `effect` the noun.
- **`e.g.`, `i.e.`, `etc.`** in running prose take a comma after in US style:
  `e.g., this`. Inside parentheses: `(e.g., this)`.
- **Serial (Oxford) comma** — use it: `tools, resources, and prompts`.
- **Possessives with trailing -s** — `World Bank's`, not `World Banks'` unless
  genuinely plural possessive.
- **Double spacing after a period** — collapse to a single space.
- **Capitalised word mid-sentence** — a capitalised word that is not a
  proper noun is usually a leftover from a rewrite; fix or flag.

---

## Punctuation specifics

- **Em-dash** (`—`) — match the file's existing convention (spaced ` — ` vs
  unspaced `—`). Do not enforce one style across files.
- **En-dash** (`–`) — number ranges only: `pp. 10–12`, `2024–2026`.
- **Hyphen** (`-`) — compound modifiers: `semi-academic`, `large-language-model`.
- **Quotes** — leave smart vs straight quotes as-is; do not auto-convert.
- **Contractions** — leave as-is. Tone and register are out of scope; rewriting
  `don't` to `do not` is a style change, not a correction.

---

## Workflow

1. **Read the whole file top-to-bottom once before editing.** This lets you
   spot inconsistency cases ("MCP is" at L58, "MCP are" at L144) and decide
   between fix-both vs flag-and-stop.
2. **Apply fixes category by category, not all at once per line.** Spelling
   first, then grammar, then punctuation, then capitalisation. A single-pass
   line-by-line edit is more likely to introduce a new typo while fixing a
   grammar issue.
3. **Flag what you cannot confidently fix** with `<!-- REVIEW: ... -->` on the
   line above. Never delete the original text when flagging.
4. **Do not reflow paragraphs.** Keep line-break layout intact so the diff is
   small and reviewable.
5. **Produce a summary report** at the end of the response (format below).

---

## Output format

After applying edits, write:

```
### Proofread summary for <filename>

**Fixes applied:** <count> total
- Spelling: <N> (e.g. `limitataions → limitations` at L28)
- Grammar: <N>
- Punctuation: <N>
- Capitalisation: <N>

**Flags left for author review:** <count>
- L36 — `<!-- REVIEW: sentence is missing a word... -->`
- L162 — `<!-- REVIEW: "WB Disables:" reads as a sentence fragment... -->`
```

If multiple files were proofread, produce one block per file and close with a
single-line grand total.

---

## What the reviewer will check

The human reviewer reading the diff after this skill runs will look for:

- **No meaning-changing edits.** Ambiguous sentences should be flagged, not
  rewritten.
- **No touched code blocks, URLs, YAML values, or Pandoc markup.**
- **No cross-document claims** — this skill works file-by-file.
- **Every flag has a short, specific reason** — not just `<!-- REVIEW -->`.

If you are unsure whether a change is safe, flag instead. That is always the
right call for this skill.
