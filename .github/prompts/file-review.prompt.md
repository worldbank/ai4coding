---
mode: agent
description: Spell-check, grammar-correct, and critically review one or more .qmd or .md files (or all files in a folder), then suggest cross-document integration improvements.
---

Review the target content using the `file-review` skill.

Load and follow the skill exactly:

```skill
[file-review skill](./../skills/file-review/SKILL.md)
```

## Determining what to review

- **If a single file is active or attached**: review that file.
- **If a folder is specified or attached**: list all `.qmd` and `.md` files in the folder (non-recursively unless the user asks for recursive). Review each file in turn, one at a time, completing all three phases before moving to the next.
- **If multiple files are attached**: review each file in the order they were provided.

When reviewing multiple files, track progress with a todo list and report a brief status after each file is done before moving to the next.

## Phases (apply to each file)

1. **Phase 1 — Corrections**: Fix spelling, grammar, punctuation, YAML errors, image paths, and product name capitalisation directly in the file.
2. **Phase 2 — Cross-document check**: Read files linked from the current file and files that reference it. Identify duplicated content, inconsistencies, and missing links.
3. **Phase 3 — Suggestions**: Present a numbered list of clarity and usability improvements (do not edit the file for these — suggest only).

## Output format

For each file reviewed, use:

### `filename.qmd`

#### ✅ Corrections applied
Brief list of direct edits made.

#### 💡 Suggestions for improvement
Numbered list — for each item: **File** / **Issue** / **Suggested fix**.

---

If multiple files were reviewed, finish with a **Summary table** listing each file, the number of corrections made, and the number of suggestions raised.
