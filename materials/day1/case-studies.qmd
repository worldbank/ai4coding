---
title: "Day 1 — Case Studies"
---

**What you will practice:**

- Refactoring messy code with AI assistance, step by step
- Writing a reproducibility package and code documentation using an AI agent

Work through the case studies in order. Each one builds on the previous.

---

## Case Study 1: Code Refactoring

### Goal

Take a working but poorly structured do-file (or R script) and use AI assistance to:

- Remove hard-coded paths and replace them with macros / variables
- Rename variables and macros to be self-descriptive
- Add inline comments explaining each analytical step
- Break one long script into logically separated sections

### Why this matters

Refactoring is the safest place to start using AI: the analytical logic is already correct,
so you can focus on learning the workflow without worrying about wrong results.

### Steps

1. Open the example script in Positron (*placeholder — link to exercise file*)
2. Read through it and identify three to five things that should be improved
3. Ask the AI assistant to suggest improvements, one issue at a time
4. Review each suggestion before accepting — do you understand what changed and why?
5. Run the refactored code and verify it produces the same results as the original

::: callout-tip
Ask the model to explain each change: `"Explain in one sentence why you made this change."` — this builds your intuition faster than just accepting suggestions.
:::

### Discussion points

- Did the AI ever suggest something wrong or misleading? How did you catch it?
- What kind of prompt gave the best results?
- Which changes would you not have thought of yourself?

---

## Case Study 2: Reproducibility Package

### Goal

Use an AI agent to turn a finished analysis script into a well-documented,
reproducible package that another economist could run on a new computer.

Deliverables:

- A `README.md` describing what the code does, what data it needs, and how to run it
- Inline comments throughout the script explaining the analytical choices
- A folder structure that separates raw data, processed data, and outputs

### Why this matters

Writing reproducibility documentation is tedious but important.
AI agents are excellent at this task because it is mostly structured writing — not analytical judgment.

### Steps

1. Open the example analysis script (*placeholder — link to exercise file*)
2. Start an agent session and ask it to read the script and draft a `README.md`
3. Review the draft: is the description accurate? Is anything missing?
4. Ask the agent to add comments to the script explaining each major step
5. Ask the agent to propose a folder structure and move the files accordingly

::: callout-warning
The agent may make assumptions about your data or methodology that are incorrect. Always read the generated text carefully — you are the subject-matter expert, not the model.
:::

### Discussion points

- How much editing did the AI-generated README require?
- Were the inline comments accurate, or did they misrepresent the analysis?
- What instructions or context in your prompt produced the best output?
