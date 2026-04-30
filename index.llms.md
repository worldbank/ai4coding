# AI for Coding

Author

Affiliation

[Eduard Bukin](https://github.com/EBukin) [](mailto:ebukin@worldbank.org)

Distributional Impact of Policies. Fiscal Policy and Growth Department

## What this course is about

AI coding assistants can do much more than autocomplete. With the right setup, they read your data dictionaries, generate analysis code in Stata, R, or Python, check it against coding standards, and iterate until the output is correct — while you stay in control of every step.

This course teaches you how. Two 3-hour live sessions, a self-study period in between, and structured exercises take you from first setup to delegating multi-step analytical tasks to an AI agent.

## What you will learn

|  |  |
|----|----|
| **Understand** | How LLMs, tokens, context windows, and agents work — and where they fail |
| **Apply** | AI assistance to read, revise, and reuse existing code; plan and execute complex tasks with agentic workflows; engineer context with `#tools`, `skills`, and `/agents` |
| **Take control** | Safeguard sensitive data, follow WB responsible-use guidelines, and supervise AI-generated code through iterative review |

All materials — slides, written guides, exercises, and some pre-recorded sessions are available on this site for self-paced review.

## Recorded materials

This course took place on April 20 and 23, 2026 at World Bank HQ in Washington, DC at the [Fiscal Policy and Growth (FPG) department](https://worldbankgroup.sharepoint.com/sites/FPG) of [Prosperity Vice Presidency](https://worldbankgroup.sharepoint.com/sites/WBgge/).

All recordings are available on the [AI‑Assisted Coding for Economists: Learning Hub](https://worldbankgroup.sharepoint.com/:u:/r/sites/FPG/SitePages/PublishingPages/ai4econ-coding-1776997693304.aspx?csf=1&web=1&e=jx31Xp) (internal WB access only).

## Acknowledgments

It was prepared and delivered by [Eduard Bukin](mailto:ebukin@worldbank.org) [github.com/ebukin](https://github.com/ebukin) with amazing support of Lead Economist [Maria Eugenia Genoni](mailto:mgenoni@worldbank.org), Knowledge Management Officer [Jeeyeon Seo](mailto:jseo@worldbank.org), team assistants [Phoebe Yuxuan Wang](mailto:ywang68@worldbank.org) and [Claudia Gutierrez](mailto:cgutierrez1@worldbank.org), and Manager of [Distributional Impact of Policies group](https://worldbankgroup.sharepoint.com/sites/wbpoverty) [Gabriela Inchauste](mailto:ginchauste@worldbank.org).

This course was preceded by the seminar: [Revolutionize Your Analysis in Stata and R: AI Agent-Assisted Workflow with GitHub Copilot and Claude](https://worldbankgroup.sharepoint.com/sites/FPG/SitePages/SystemPages/Detail.aspx/Events/mode=view?_Id=2&SiteURL=/sites/FPG) held in February 2026, which was a part of the [GeoPov team’s](https://worldbankgroup.sharepoint.com/:u:/r/sites/FPG/SitePages/PublishingPages/GeoPov-1770874931043.aspx?csf=1&web=1&e=aAiQuQ) learning [initiative](https://worldbank.github.io/geoPovLearn/seminars/). Initial seminar benefited tremendously from brainstorming, trials and errors with [Henry Stemmler](mailto:hstemmler@worldbank.org) and Senior Economist [Nga Thi Viet Nguyen](mailto:nnguyen3@worldbank.org).

## Prerequisites — Complete Before Day 1

Set up your environment before the first session. Follow each step in order:

1.  [**Software Setup**](prerequisites/software.llms.md) — Stata 19+ MP, R 4.5+, Python 3.13+ with `uv`, Positron, Quarto 1.9+, Git
2.  [**Stata for Positron Extensions**](prerequisites/extensions.llms.md) — integrate Stata into Positron
3.  [**GitHub & Copilot**](prerequisites/github.llms.md) — personal GitHub account and GitHub Copilot subscription
4.  [**Positron Assistant**](prerequisites/assistant.llms.md) — enable the assistant and connect to GitHub Copilot

> **WARNING:**
>
> If something doesn’t work, check the troubleshooting section for each step:
>
> - [Software Setup \> Troubleshooting](prerequisites/software.llms.md#troubleshooting)
> - [Stata Extension \> Troubleshooting](prerequisites/extensions.llms.md#sec-troubleshooting-stataextension)
> - [GitHub & Copilot \> Troubleshooting](prerequisites/github.llms.md#sec-troubleshooting-ghcopilot)
> - [Positron Assistant \> Troubleshooting](prerequisites/assistant.llms.md#sec-troubleshooting-assistant)
>
> If you hit a dead end, contact <ITHelp@worldbankgroup.org>.

## Day 1: Introduction and Common Workflows

[**Go to Day 1 →**](day1/index.llms.md)

Verify your setup works, then dive straight into live demos — cleaning data with AI, reproducing existing analysis, and safeguarding sensitive data. You’ll leave with a working environment and a clear mental model of when AI helps and when it doesn’t.

## Self-Study

[**Go to Self-Study Exercises →**](selfstudy/index.llms.md)

2–3 days of independent practice. Share challenges and questions in the Teams chat.

- [Example 0](selfstudy/example-0.llms.md) — Test your setup
- [Example 1](selfstudy/example-1.llms.md) — Explore Positron and GitHub Copilot
- [Example 2](selfstudy/example-2.llms.md) — Understanding data with AI
- [Example 3](selfstudy/example-3.llms.md) — Reproduce, Revise, and Reuse existing analysis

## Day 2: Advanced AI Features

[**Go to Day 2 →**](day2/index.llms.md)

We start with your questions from self-study, then move to the advanced toolkit: delegate multi-step tasks to an AI agent, connect external tools via MCP, and build reusable prompt files and skills tailored to your analytical workflow.
