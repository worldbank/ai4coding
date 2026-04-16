---
title: "Day 2 — Case Studies"
---

**What you will practice:**

- Planning and executing a complex multi-step task with an AI agent
- Agentic code development: writing, testing, and debugging with AI
- Positron Data Bot: fast exploratory data analysis with a custom AI agent

Complete at least one case study and submit your write-up within one week of Day 2.

---

## Case Study 1: Planning and Executing a Complex Task

### Goal

Use an AI agent to plan and execute a multi-step analytical pipeline from scratch:
data loading → cleaning → variable construction → estimation → formatted output table.

### Why this matters

This is the canonical "delegate to AI" use case. Done correctly, you provide the goal
and the data description; the agent proposes the plan; you approve each step; the agent executes.

### Steps

1. Describe your task to the agent in one paragraph, including the data structure and expected output
2. Ask the agent to propose a step-by-step plan **before writing any code**
3. Review and correct the plan explicitly (`"Step 3 should use PSU-level clustering, not household-level."`)
4. Execute one step at a time; verify the output before instructing the agent to continue
5. At the end, ask the agent to write a one-paragraph description of what the code does

### Reflect and write up

- How many corrections did you need to make to the initial plan?
- At which step did you most need to apply your own analytical judgment?
- How does the final code quality compare to what you would have written manually?

---

## Case Study 2: Agentic Code Development — Testing and Debugging

### Goal

Use an AI agent to write unit tests for an existing script, then use it to find and fix a
deliberately introduced bug.

### Why this matters

Testing is universally acknowledged as important and universally skipped when deadlines approach.
AI agents can write tests faster than most analysts write code — removing the main excuse.

### Steps

1. Open an existing script (*placeholder — exercise file with a hidden bug provided by the trainer*)
2. Ask the agent to write five assertions that check the key outputs of the script
3. Run the assertions — do any fail?
4. If the bug is not caught yet, ask the agent: `"What could go wrong in this script that the tests do not cover?"`
5. Once the bug is identified, ask the agent to fix it and explain the root cause

::: callout-tip
Ask the agent to think through failure modes **before** it writes the tests.
A good prompt: `"Before writing the tests, list five ways this script could produce wrong results silently."`
:::

### Reflect and write up

- Did the agent catch the bug? On which attempt?
- Were any of the agent's tests themselves incorrect?
- How has this changed your view of using AI for code review?

---

## Case Study 3: Positron Data Bot

### Goal

Set up and use a custom AI agent configured for fast exploratory data analysis (EDA)
on a household survey dataset.

### What the Data Bot does

The Positron Data Bot is a custom agent configuration (`.github/copilot-instructions.md`)
that gives GitHub Copilot standing instructions for EDA tasks:

- Always report missing value counts before any analysis
- Always label tables and plots with variable labels from the codebook
- Always flag if a variable is top-coded, bottom-coded, or has suspicious distributions
- Output a short narrative paragraph summarising each table or plot

### Steps

1. Copy the Data Bot instruction template (*placeholder — template provided in exercises*)
2. Open a dataset and tell the agent: `"Run a standard EDA on this dataset following your instructions."`
3. Review the output: are the narratives accurate? Did the bot flag anything you missed?
4. Ask the bot to investigate one unexpected finding further

### Reflect and write up

- What did the bot notice that you would have overlooked in a quick manual scan?
- What customisations would you make to the instructions for your own data?
- Could you use this workflow on a real project? What would need to change?
