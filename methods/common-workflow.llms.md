# AI Workflow

Author

Affiliation

[Eduard Bukin](https://github.com/ebukin) [](mailto:ebukin@worldbank.org) [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-1003-1260)

Distributional Impact of Policies. Fiscal Policy and Growth Department

Published

April 17, 2026

## Overview

AI coding assistants are probabilistic: the quality of their output depends heavily on the quality of the context you provide. Through experience across many data preparation and analysis projects, we have found that a structured, eight-step workflow consistently produces better results than ad-hoc prompting. Each step builds on the previous one, gradually narrowing the AI’s degrees of freedom until it has enough context to generate correct, reproducible code.

The workflow applies regardless of language (Stata, R, Python) or domain (survey harmonization, administrative data cleaning, indicator construction). Adapt the details to your project, but follow the sequence.

1.  **Set the objective and constraints** — State the task, the target specification, and the language so the AI has clear guardrails from the start.
2.  **Define inputs and outputs** — Specify the unit of observation, file format, ID requirements, variable labeling conventions, and parameterized file paths.
3.  **Create a data dictionary** — Generate metadata from the raw files so the AI can reason about variable structure without seeing actual microdata.
4.  **Gather external metadata** — Supplement file-level metadata with codebooks, catalogs, or survey documentation that describe units, recall periods, and skip patterns.
5.  **Verify understanding (checkpoint)** — Ask the AI to produce a mapping table (target variable, source variable, transformation, open questions) and resolve every question before coding begins.
6.  **Develop code iteratively** — Request a master script first, then one module at a time; run, test assertions, and iterate on failures.
7.  **Independent verification** — In a *separate* AI session, have a fresh agent audit the code and summary statistics against the target specification.
8.  **Document the work** — Produce a report covering the objective, data sources, variable mapping, decisions, limitations, and a reproducibility checklist.

> **NOTE:**
>
> Steps 3 and 4 involve handling raw data files. Before proceeding with those steps, review the [Safeguarding Data](../methods/safeguard-data.llms.md) page to ensure that no sensitive microdata is inadvertently exposed to the AI.

## Detailed workflow

Each step below includes a rationale, a reusable prompt template, and an actionable checklist. Placeholders in `[square brackets]` must be replaced with your project-specific values. The prompts are language-neutral; where a language-specific detail matters, short Stata / R / Python alternatives are noted.

### Step 1. Set the objective and constraints

> **NOTE:**
>
> A clear, specific objective anchors the entire conversation. A vague prompt like *“help me clean some data”* gives the AI no guardrails and leads to generic, unusable output. Stating the task, the target specification, and the programming language up front constrains the AI to the correct domain from the first message.

``` numberSource
You are my [your language] co-programmer. The objective is to
[describe the task, e.g., harmonize / clean / construct indicators
from] [survey or dataset name] ([years or waves]) into a single
analysis-ready dataset following [target specification or standard].

Do not write any code yet.
```

> **TIP:**
>
> - The AI echoes back the dataset name, years, and target specification in its own words.
> - If it asks clarifying questions, answer them.
> - If it immediately starts writing code, reply: *“Do not write any code yet.”*

### Step 2. Define inputs and outputs

> **NOTE:**
>
> Ambiguous output specifications are the most common source of wrong results. Being explicit about the unit of observation, file format, ID requirements, and variable conventions prevents the AI from making assumptions that silently corrupt the data. Following [DIME Wiki Master Dataset](https://dimewiki.worldbank.org/Master_Dataset) and [ID Variable Properties](https://dimewiki.worldbank.org/ID_Variable_Properties) conventions ensures consistency across the project.

``` numberSource
The final output should be a [.dta / .parquet / .rds] master dataset
following these conventions:

- Each row is a [unit of observation, e.g., individual-year];
  each column is a harmonized variable.
- The dataset must have a unique, fully identifying ID variable.
  ID variables must have no missing values and must uniquely
  identify observations.
- All variables must have labels (up to 80 characters).
- All categorical variables must be stored numerically with value
  labels attached.
- Missing values must use [your language's convention for
  labeled/tagged missings] with labels explaining the reason.
- Higher-level IDs (e.g., household ID in an individual dataset)
  must be included to enable merging across units.

Harmonize only these modules: [list modules, e.g., demographics,
income, consumption].

The code must be modular, well-commented, and reproducible.
Do not write any code yet.
```

``` numberSource
Input data is located at `[your data path]` in subfolders
`[wave1]/` and `[wave2]/`. Files are read-only. All paths must be
specified as parameters (global macros / config file / constants
module) so the code runs on any machine without modification.
Do not write any code yet.
```

> **TIP:**
>
> - The AI confirms the unit of observation, ID structure, and labeling conventions without writing code.
> - File paths use parameterized references, not hard-coded strings.
> - If your data mixes units of observation (e.g., household-level consumption merged onto individual-level records), verify the AI understands the merge strategy.

### Step 3. Create a data dictionary

> **NOTE:**
>
> A data dictionary lets the AI reason about variable names, types, labels, and distributions without ever seeing actual observations. This is a key [data safeguarding](../methods/safeguard-data.llms.md) practice: the AI gets enough context to write correct code while microdata never enters its context window.

``` numberSource
Write [your language] code that creates a data dictionary for each
[wave / year]. For every variable, capture: name, storage type,
display format, label, number of missing values, number of distinct
values, and min/max for numeric variables.

The code should:
1. Accept a parameter specifying the path to raw data.
2. Loop over all [.dta / .csv / .parquet] files in the relevant
   subfolders.
3. Save each dictionary as a markdown file in
   `[output path, e.g., data/dictionary/{filename}.md]`.
4. Never print or display actual observation-level data.

Do not write any code yet. First, restate the objective,
constraints, and success criteria in your own words. Report any
uncertainties. Only when I confirm, proceed to write the code.
```

> **TIP:**
>
> - The AI’s restatement mentions all four constraints (parameterized path, loop over files, markdown output, no raw data display).
> - After running the generated code, open a few `.md` files and verify that variable names, types, and labels look correct.
> - Confirm no files were missed.

### Step 4. Gather external metadata

> **NOTE:**
>
> File-level labels often lack detail on recall periods, units of measurement, or survey design. External documentation — codebooks, catalogs, questionnaires — fills those gaps. If the AI cannot browse the web, download the documentation yourself and paste the relevant sections into the chat.
>
> Before proceeding, review the [Safeguarding Data](../methods/safeguard-data.llms.md) page to ensure that no sensitive information is inadvertently shared when pasting documentation or providing URLs.

``` numberSource
Fetch the variable-level metadata for [survey name] from:
- [wave 1]: [URL to catalog or codebook]
- [wave 2]: [URL to catalog or codebook]

Extract: variable names, definitions, units of measurement, recall
periods, universe (who was asked), and coding notes. Save a summary
in `[output path, e.g., data/dictionary/metadata-wave1.md]`.

If you cannot access these URLs, tell me and I will paste the
relevant metadata manually.
```

> **TIP:**
>
> - If web access failed, paste the relevant sections yourself (at minimum: variable list with definitions, coding scheme for categorical variables, notes on recall periods or skip patterns).
> - Verify that the saved metadata files are complete and correctly attributed to the right wave.

### Step 5. Verify understanding before coding

> **NOTE:**
>
> This is a **checkpoint**, not a coding step. Before investing time in code generation, the AI must demonstrate that it understands the data structure, the target specification, and the mapping between them. Misunderstandings caught here save hours of debugging later.

``` numberSource
Before we write any code, summarize your understanding of:

1. The structure of the raw data (which files, key variables,
   units of observation).
2. The target variables for each module ([list modules]).
3. Any variables that are ambiguous, missing, or require
   assumptions.

Present this as a mapping table with columns:
target variable | source file | source variable(s) |
transformation needed | open questions.

Do not write any code yet.
```

> **TIP:**
>
> The mapping table is the single most important artifact of this workflow. Review every row:
>
> - Is the source variable correct?
> - Is the proposed transformation reasonable?
> - Are the open questions genuine, or does the AI need more context?
>
> Resolve **every** open question before proceeding to Step 6.

### Step 6. Develop code iteratively

> **NOTE:**
>
> Asking for all code at once typically produces something that looks plausible but fails on edge cases. Instead, request a master script first (following [DIME Wiki Master Do-files](https://dimewiki.worldbank.org/Master_Do-files) conventions), then one module at a time. Run each module, check assertions, and iterate on failures before moving to the next.
>
> For coding standards, see [DIME Wiki Data Cleaning](https://dimewiki.worldbank.org/Data_Cleaning) and [Stata Coding Practices](https://dimewiki.worldbank.org/Stata_Coding_Practices) (or their equivalents for R and Python).

``` numberSource
Based on the confirmed mapping table, develop the data cleaning
code in [your language]. The master script must include:

1. Intro header (project purpose, inputs, outputs, unit of
   observation).
2. Package/dependency installation section.
3. Settings (version check, seed for reproducibility).
4. Root folder parameters with user switching so each team member
   sets only their own path.
5. Project folder parameters for all sub-folders, relative to the
   root.
6. Units and assumptions (conversion rates, control variable lists)
   stored as parameters.
7. Logging.
8. Sub-scripts with toggles so individual modules can be turned
   on/off.
9. Final merge of module outputs into a single dataset.

Write the master script first. Do not write the module scripts yet.
```

> **TIP:**
>
> - The master script contains all nine sections listed above.
> - All paths are parameterized; no hard-coded paths remain.
> - Toggles allow each module to run independently.
>
> After confirming the master script, request each module individually:

``` numberSource
Now write [module script name] following the confirmed mapping table
and the coding standards defined in the master script. Process all
[waves / years]. Read all paths from parameters. After every merge
or reshape, verify the unit of observation.
```

> **TIP:**
>
> 1.  Read through the code — does every transformation match the confirmed mapping table?
> 2.  Run the code on one wave first.
> 3.  Check assertion results: failures indicate a coding bug or a mistaken assumption.
> 4.  Report failures back to the AI and iterate until the module passes cleanly.

### Step 7. Independent verification

> **IMPORTANT:**
>
> This step **must** be performed in a **different** AI session (a new chat window or a different AI tool) than the one that wrote the code. The original agent is biased toward confirming its own work and will tend to overlook its own mistakes. A fresh agent reviews the code and results without prior context.

> **NOTE:**
>
> Independent verification is a standard practice in data work for the same reason that financial audits are independent: the person who produced the work cannot objectively evaluate it. In AI-assisted workflows this is even more important, because LLMs are prone to confirmation bias within a conversation.

``` numberSource
Act as an independent data auditor. I will provide:

1. The target variable specifications for [list modules].
2. The cleaning code for each module.
3. Summary statistics of the cleaned output (which I will paste).

For each target variable, check:
- Does the code correctly map from source to target?
- Are value labels and coding consistent with the specification?
- Are edge cases handled (missings, top/bottom coding, skip
  patterns)?
- Are assertions sufficient?

Also check general data quality standards:
- Are ID variables uniquely and fully identifying?
- Are all survey codes replaced with labeled missing values?
- Are all categorical variables stored numerically with value
  labels?
- Are all variables labeled?
- Are file paths parameterized (no hard-coded paths)?

Report issues as a numbered list: variable name, problem, and
suggested fix.
```

> **TIP:**
>
> - Generate summary statistics (means, frequencies, cross-tabs) for key variables and paste them into the auditor session. The auditor prompt works best with concrete numbers, not just code.
> - Address every issue the auditor raises before finalizing the code.

### Step 8. Document the work

> **NOTE:**
>
> Code without documentation is a liability. The [DIME Wiki Reproducible Research](https://dimewiki.worldbank.org/Reproducible_Research) guidelines emphasize four pillars: data documentation, data publication, code publication, and output publication. A final report captures decisions that are invisible in the code and ensures that someone unfamiliar with the project can reproduce the results.

``` numberSource
Write a project report in `[output path, e.g., docs/report.md]`
covering:

1. **Objective**: what was produced and to which specification.
2. **Data sources**: dataset name, years, download URLs, file
   inventory.
3. **Data documentation**: data dictionary, metadata sources, and
   any corrections incorporated during cleaning --- including
   records of AI-suggested changes that were accepted or rejected.
4. **Variable mapping**: the confirmed mapping table from Step 5.
5. **Decisions and assumptions**: for each variable where a
   judgment call was needed, record the choice and rationale.
6. **Known limitations**: variables that could not be processed,
   quality concerns, or caveats for downstream users.
7. **Reproducibility checklist**:
   - Required language version.
   - Required packages / dependencies.
   - Folder structure and parameter setup.
   - Instructions for a new user: change user ID in the master
     script, set path, and run.
   - Seed value (if any randomization or sampling is involved).
8. **Code publication readiness**: confirm that no hard-coded paths
   remain, all scripts run from the master, and output is fully
   reproducible.
```

> **TIP:**
>
> The ultimate test: can a colleague clone your project folder, change only their user ID in the master script, and reproduce every output? If not, the documentation is incomplete.
