---
name: file-review
description: >
  Spell-check, grammar-correct, and critically review a Quarto (.qmd) or Markdown (.md)
  file for clarity and ambiguity. Then cross-check referenced and referencing documents
  for integration issues. Use this skill whenever the user asks to review, proofread,
  spell-check, or improve a documentation or course file — including checking that
  related documents are consistent and well-integrated.
metadata:
  author: World Bank AI4Coding Course
  version: "1.0"
license: MIT
---

# File Review Skill

A structured workflow for reviewing and improving documentation and course content files.

---

## Phase 1: Spell and Grammar Corrections

Apply these corrections **directly** to the file using the file editing tools:

### Common errors to fix

| Issue | Fix |
|-------|-----|
| YAML front matter syntax errors (e.g. `title":`) | Fix the YAML key |
| "Adopted from" when citing a source | → "Adapted from" |
| Missing punctuation at the end of list items or after links | Add period |
| "could be done in the following way" | → "can be done as follows" |
| "permits you to" | → "lets you" or "allows you to" |
| "To follow with the course" | → "To follow along with the course" |
| "Move into X exercise templates by, either:" | Rewrite: "Copy exercise templates into X using either:" |
| "One Drive" (split) | → "OneDrive" (one word) |
| `ex0...\` without explanation | → Full example path, e.g. `ex01\`, with note "the relevant exercise subfolder" |
| Bare step heading with no verb (e.g. "4. Course data") | Add verb: "4. Access course data:" |
| "Only if there are any problems, you may..." | → "If you encounter problems, ..." |
| Absolute image paths (`/images/...`) in `.qmd` files | → Relative paths (`images/...`) |
| Image alt text with leading/trailing whitespace | Remove the whitespace |
| Image captions that reference wrong software | Correct to match actual content |
| Spurious unclosed `:::` divs | Remove or close correctly |
| Inconsistent capitalisation of product names | Standardise (e.g. "GitHub Copilot", "OneDrive", "Positron") |

### After making corrections

Summarise what was changed and why, briefly.

---

## Phase 2: Cross-Document Integration Review

After correcting the file, **read the related documents**:

1. Check the current file's links — follow any `[text](path.qmd)` references and read those files.
2. Check documents that link *to* the current file — look in `index.qmd` and all other pages. use `#search` to find any references to the current file. Read those referencing files.
3. Look for duplicated content across files.

### Integration issues to look for

| Issue | Suggestion |
|-------|-----------|
| Same content duplicated in two files | Replace one with a link to the canonical version |
| Two files that cover the same topic with inconsistent wording | Align wording or consolidate |
| A page described as existing but not linked from where users will land | Add a link |
| Setup steps spread across multiple pages with no clear reading order | Add a numbered sequence or "next step" link |
| A warning/callout in one file updated but the duplicate in another file not updated | Sync both, or remove the duplicate |
| A section that promises content (e.g. key-concepts list at top) that the body doesn't deliver | Either remove the promise or add the content |
| Prerequisites mentioned in one file but not flagged in a related file | Add a cross-reference |

---

## Phase 3: Clarity and Usability Suggestions

**Do not edit** — present these as a numbered suggestion list to the user.

For each suggestion, note:
- **What**: the specific issue or gap
- **Where**: which file and section
- **Why**: how it would help the reader
- **How**: a concrete proposed fix

Then summarise them briefly at the end is a form of a table or bullet list proposing
and actionable plan for user review.

### Checklist of things to evaluate

- [ ] Can a first-time reader follow the steps without prior knowledge?
- [ ] Are all paths, folder names, and tool names consistent across files?
- [ ] Are all steps written as imperatives (action verbs)?
- [ ] Does each section heading accurately describe the content below it?
- [ ] Are linked resources actually accessible (public URLs, not private shares)?
- [ ] Is there a logical reading order? Does the document say what comes next?
- [ ] Are warnings/callouts placed *before* the step they warn about?
- [ ] Are optional steps clearly marked as optional?
- [ ] Are temporary workarounds (e.g. OneDrive restriction) dated so readers know when they expire?

---

## Output Format

Structure your response as:

### ✅ Corrections applied
Brief list of what was fixed directly in the file.

### 💡 Suggestions for improvement
Numbered list. For each item:
- **File**: which file(s) are affected
- **Issue**: what the problem is
- **Suggested fix**: concrete proposed change
