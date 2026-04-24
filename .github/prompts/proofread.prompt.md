---
agent: agent
description: Strict proofreading pass — fix spelling, grammar, punctuation, and product-name capitalisation in one or more .qmd or .md files. Does not touch style, tone, flow, or cross-document consistency.
---

Proofread the target content using the `proofread` skill.

Load and follow the skill exactly:

```skill
[proofread skill](./../skills/proofread/SKILL.md)
```

## Determining what to proofread

- **If a single file is active or attached**: proofread that file.
- **If a folder is specified or attached**: list all `.qmd` and `.md` files in the folder (non-recursively unless the user asks for recursive). Proofread each file in turn.
- **If multiple files are attached**: proofread each file in the order they were provided.

When proofreading multiple files, track progress with a todo list and report a brief status after each file is done before moving to the next.

## Scope reminder

Exactly what the skill says — no more, no less:

- **In scope:** spelling, grammar, punctuation, product-name capitalisation.
- **Out of scope:** fluency, flow, tone, wordiness, terminology consistency across a document, YAML structure, link/image validity, cross-document checks.

If the user asks for any out-of-scope item, finish the proofread pass and then point them at `/file-review` for the higher-level review.

## Output

Apply edits directly to each file, then produce the per-file summary report described in the skill (fixes by category with line numbers, and flags left for author review).
