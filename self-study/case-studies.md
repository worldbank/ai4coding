---
title: "Self-Study — Case Studies"
---

Complete at least one of the three case studies below and submit your write-up before Day 2.
All three are designed to take 1–2 hours with AI assistance.

---

## Case Study 1: Reproducing Old Code with New Data {#reproducing-old-code}

### Goal

Take a do-file (or R script) written for a previous dataset and use AI assistance to
adapt it to a new dataset with a different variable naming convention or structure.

### Why this matters

Updating legacy code is one of the most common and time-consuming tasks in applied
economics. AI assistance dramatically reduces the time spent on variable mapping,
reshape operations, and merge logic.

### Steps

1. Open your old script and the new dataset side by side in Positron
2. Ask the AI assistant to compare the variable names and propose a mapping table
3. Let the agent update the script to use the new variable names throughout
4. Run the updated script and compare outputs against the original results
5. Document any discrepancies and how you resolved them

### Reflect and write up

- What kinds of changes did the AI handle well? What required manual intervention?
- Did the agent introduce any silent errors (wrong variable, wrong merge key)?
- How did you verify correctness?

---

## Case Study 2: Reproducing an Analysis from an Example {#reproducing-from-example}

### Goal

Use an AI agent to help you reproduce a published analysis or an example from a report,
using a publicly available or synthetic dataset.

### Why this matters

This is a common onboarding task when joining a new project. AI assistance can
read the example, propose the code structure, and handle the tedious variable
construction — letting you focus on understanding the methodology.

### Steps

1. Choose an analysis example (*placeholder — we will provide options before the self-study period*)
2. Share the example (or a description) with the AI assistant
3. Ask the agent to draft the code step by step, one section at a time
4. Run and verify each section before proceeding to the next
5. Compare your final output to the example's published results

::: callout-tip
Do not ask the agent to write the entire analysis in one prompt.
Break it into logical steps — data loading, cleaning, variable construction, estimation, output —
and verify each before moving on.
:::

### Reflect and write up

- How many iterations did it take to get each section right?
- At what point did you need to stop using AI and think for yourself?
- What context (dataset description, code book, example output) was most helpful to provide?

---

## Case Study 3: Trying a Different Language {#trying-a-different-language}

### Goal

Take a Stata do-file you know well and use AI to translate it into R (or Python),
then verify the outputs match.

### Why this matters

Translation between languages is one of the tasks where AI adds the most value with the
lowest risk: the logic is already correct, and you can verify the output exactly.
It is also one of the most common barriers to expanding your toolkit.

### Steps

1. Pick a short but non-trivial do-file (data cleaning + one estimation) that you understand well
2. Ask the AI assistant: `"Translate this Stata do-file to R using tidyverse conventions. Explain each equivalent command."`
3. Read through the translation — does the logic look correct?
4. Run the R script and compare the outputs (summary statistics, regression coefficients) to the Stata output
5. Note any differences and ask the AI to explain them

::: callout-note
Some differences are expected: default standard error calculations, missing value handling, and factor encoding
can differ between Stata and R. Ask the AI to explain any numerical discrepancies before concluding there is a bug.
:::

### Reflect and write up

- What did the AI get right immediately? What required correction?
- What did you learn about R (or Python) that you didn't know before?
- Would you be comfortable using the translated script in a real analysis?
