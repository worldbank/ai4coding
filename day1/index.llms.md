# Day 1: Overview

Author

Affiliation

[Eduard Bukin](https://github.com/EBukin) [](mailto:ebukin@worldbank.org)

Distributional Impact of Policies. Fiscal Policy and Growth Department

# Goals for Day 1

- **Familiarize yourself** with the basics of AI-assisted coding and its workflow.
- **Get an intuitive understanding** of the key concepts behind the technology, how it works and what its capabilities and limitations are.
- **Set up the software environment** to be able to practice AI-assisted coding on your own during the self-study period following examples and supplementary materials.
- **See AI in action** by following along with live demonstrations: understanding data with AI and reproducing, revising, and reusing existing analysis.

# Agenda

Day 1: Introduction and common workflows

| Time | Topic |
|----|----|
| 9:00-9:10 | 1\. [Welcome and course overview (slides)](#welcome) |
| 9:10-9:40 | 2\. [Setup overview (slides)](#setup-overview) |
| 9:40-10:20 | 3\. Live: [Self-Study \> Example 0](../selfstudy/example-0.llms.md) |
| 10:20-10:30 | ☕ Break (10 min) |
| 10:30-10:50 | 4\. [Core AI-related concepts](#ai-concepts) |
| 10:50-11:00 | 5\. [Common workflows and data safeguarding (slides)](#ai-workflow) |
| 11:00-11:30 | 6\. [Example 2: Understanding data with AI (live)](#example-2) |

Self-study:

- [Example 1](../selfstudy/example-1.llms.md)
- [Example 3](../selfstudy/example-3.llms.md)

# Before You Arrive

(Try) [completing the setup](../prerequisites/index.llms.md). For common issues and troubleshooting, refer to the relevant sections in the setup materials:

- [Software Setup \> Troubleshooting](../prerequisites/software.llms.md#troubleshooting),
- [Stata for Positron Extensions \> Troubleshooting](../prerequisites/extensions.llms.md#sec-troubleshooting-stataextension),
- [GitHub & Copilot \> Troubleshooting](../prerequisites/github.llms.md#sec-troubleshooting-ghcopilot), and
- [Positron Assistant \> Troubleshooting](../prerequisites/assistant.llms.md#sec-troubleshooting-assistant) sections for common issues with the setup.

If you run into a dead end, contact <ITHelp@worldbankgroup.org>.

------------------------------------------------------------------------

# Resources

Course data is available in the OneDrive folder: [ai4coding-data](https://worldbankgroup-my.sharepoint.com/:f:/g/personal/ebukin_worldbank_org/IgBy2yGjpLJPRbM67FJpBFVgAbMRYhEPmS30H2RJSBFO_gE).

Course examples and materials are available in this repository: [ai4coding](https://github.com/worldbank/ai4coding) or on OneDrive: [ai4coding-materials](https://worldbankgroup-my.sharepoint.com/:f:/g/personal/ebukin_worldbank_org/IgCXQVakSxEpT7VJFmKp_qtnAXx8RX9iemnwfGwITkEA3bE).

If, once you open the link to the OneDrive folder, you see a message that you don’t have access, please request access by clicking the “Request Access” button on the page. I will be monitoring and approving access requests as they come in.

------------------------------------------------------------------------

# Day 1: Materials

## 1. Welcome and course overview

Motivation for AI-assisted coding in an IDE versus copy-pasting from chat-based tools. Overview of the course structure: two sessions, self-study in between, and the key tools — Positron and GitHub Copilot. Course goals: understand, practice, and take control of AI-assisted coding.

**Slides**

View slides in a [new tab](..\day1/ai4coding-slides-d1-1/index.llms.md).

------------------------------------------------------------------------

## 2. Setup overview

> **Important**: Set up your working folders properly!

> **WARNING:**
>
> **Do not use OneDrive for coding with Positron during this course! (temporary)**.
>
> - Positron is a new software for the WB.
> - Unfortunately we only discovered last week that WB security policies **block Positron from writing text files** on OneDrive.
> - Do not save your code-in-progress in a OneDrive folder.
> - New security policy will be implemented Friday, April 24 (Because of the spring meeting freeze).

**To follow along with the course and practice on your own, you need to:**

1.  On `C:\WBG\` **create a folder** called `ai`.
2.  Copy exercise templates into `C:\WBG\ai\ai4coding-practice\` using either:
    - **OneDrive (WB only)** folder [`ai4coding-examples`](https://worldbankgroup-my.sharepoint.com/:f:/g/personal/ebukin_worldbank_org/IgCXQVakSxEpT7VJFmKp_qtnAXx8RX9iemnwfGwITkEA3bE?e=U08qTX)
    - or **forking the GitHub repo** [worldbank/ai4coding-examples](https://github.com/worldbank/ai4coding-examples)
3.  Work in the relevant exercise subfolder, e.g. `C:\WBG\ai\ai4coding-practice\ex01\`.
4.  Access course data:
    - Shared through **OneDrive (WB only)** [`ai4coding-data`](https://worldbankgroup-my.sharepoint.com/:f:/r/personal/ebukin_worldbank_org/Documents/AI/AI-course-2026-April/ai4coding-data?csf=1&web=1&e=ITG6Sk)
    - It is read-only. You can sync it to your OneDrive (where appropriate) and use it from there.
    - If you encounter problems, copy the data to `C:\WBG\ai\ai4coding-data\`.

Detailed setup requirements: software (Positron, Python, R, Stata, Quarto), GitHub account and WB organization membership, GitHub Copilot access (WB plan or private), and Positron Assistant configuration. Working folder structure for exercises and data.

**Slides**

View slides in a [new tab](..\day1/ai4coding-slides-d1-2/index.llms.md).

------------------------------------------------------------------------

## 3. Live: Self-Study \> Example 0

Live walkthrough of [Self-Study \> Example 0](../selfstudy/example-0.llms.md) — open the `ex00-positron-test` folder in Positron, follow the README, and verify that your setup (Positron, Copilot, Stata extension) is working correctly.

------------------------------------------------------------------------

## 4. Core AI-related concepts

Key concepts behind how AI coding assistants work: IDEs, LLMs, context windows, tokens, and embeddings. How context size and quality affect response accuracy. Context saturation and best practices for managing it. Hallucinations — what causes them and how to mitigate them. Data exposure risks when using AI in an IDE. Preview of Day 2 topics: agents, tools, prompt files, and skills.

**Slides**

View slides in a [new tab](..\day1/ai4coding-slides-d1-3/index.llms.md).

------------------------------------------------------------------------

## 5. Common workflows and data safeguarding

A structured eight-step workflow for AI-assisted data analysis: from setting objectives and defining inputs/outputs, to iterative code development and independent verification. Why structure matters — vague prompts produce generic output; each step narrows the AI’s degrees of freedom.

Data safeguarding practices: key exposure channels (prompts, console output, file reads, shell commands) and five remedies — careful prompting, system instructions, metadata-only approach, data anonymization, and keeping raw data outside the project folder. WB AI Use Policy and responsible use guidelines.

**Slides**

View slides in a [new tab](..\day1/ai4coding-slides-d1-4/index.llms.md).

------------------------------------------------------------------------

## 6. Live: Self-Study \> Example 2

Live walkthrough of [Self-Study \> Example 2](../selfstudy/example-2.llms.md) — using AI to understand an unfamiliar dataset: building a data dictionary, documenting harmonization, generating modular cleaning code, and verifying results. Participants follow along in their own environment.

------------------------------------------------------------------------

## Self-Study Examples

- [Example 0](../selfstudy/example-0.llms.md) — Test your setup
- [Example 1](../selfstudy/example-1.llms.md) — Explore Positron and GitHub Copilot
- [Example 3](../selfstudy/example-3.llms.md) — Reproduce, Revise, and Reuse existing analysis
