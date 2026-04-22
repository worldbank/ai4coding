---
agent: agent
description: Review one or more .qmd or .md files (or all files in a folder) for structural issues (YAML, image paths), cross-document integration, and clarity. For spelling and grammar, run `/proofread` first.
---

Review the target content for structural issues, cross-document integration, and clarity suggestions.

**Mechanical text fixes (spelling, grammar, punctuation, product-name capitalisation) are not in scope for this prompt** — they are handled by the `proofread` prompt and skill. If the target file has not been proofread yet, say so and recommend running `/proofread` first before continuing.

## Determining what to review

- **If a single file is active or attached**: review that file.
- **If a folder is specified or attached**: list all `.qmd` and `.md` files in the folder (non-recursively unless the user asks for recursive). Review each file in turn, completing all three phases before moving to the next.
- **If multiple files are attached**: review each file in the order they were provided.

When reviewing multiple files, track progress with a todo list and report a brief status after each file is done before moving to the next.

## Phases (apply to each file)

1. **Phase 1 — Structural corrections**: Fix YAML front-matter errors (missing required fields, bad indentation) and broken image paths directly in the file. Do **not** touch spelling, grammar, punctuation, or product-name capitalisation — those belong to `/proofread`.
2. **Phase 2 — Cross-document check**: Read files linked from the current file and files that reference it. Identify duplicated content, inconsistencies, and missing links.
3. **Phase 3 — Suggestions**: Present a numbered list of clarity and usability improvements (do not edit the file for these — suggest only).

## Output format

For each file reviewed, use:

### `filename.qmd`

#### ✅ Corrections applied
Brief list of direct edits made (YAML and image paths only).

#### 💡 Suggestions for improvement
Numbered list — for each item: **File** / **Issue** / **Suggested fix**.

---

If multiple files were reviewed, finish with a **Summary table** listing each file, the number of corrections made, and the number of suggestions raised.