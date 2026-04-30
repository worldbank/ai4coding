# Day 2: Overview

Author

Affiliation

[Eduard Bukin](https://github.com/EBukin) [](mailto:ebukin@worldbank.org)

Distributional Impact of Policies. Fiscal Policy and Growth Department

# Goals for Day 2

- **Address questions** from the self-study period and Day 1.
- **Explore context engineering** with `#tools`, `MCP`, `instructions`, `/prompts`, `@agents`, `skills`, and other relevant features.
- **Learn Planning mode** to execute complex, multi-step tasks with an AI agent.
- **Delegate** a complex analytical task to an AI agent, supervise its execution, and course-correct when it goes off track.
- **Customize** your Positron assistant with instructions, prompt files, and skills.

# Agenda

Day 2: Advanced AI features

| Time | Topic |
|----|----|
| 9:00-9:40 | 1\. [Welcome and Self-Study Q&A](#welcome) |
| 9:40-10:20 | 2\. [Scaffolding on Self-study Example 3 (live)](#scaffolding) |
| 10:20-10:30 | **Break** |
| 10:30-11:00 | 3\. [Tools and MCP (slides + demos)](#tools-mcp) |
| 11:00-11:30 | 4\. [Agents and customization (slides + demos)](#agents) |
| 11:30-12:00 | 5\. [Planning mode and exercises (slides + live)](#planning) |

We will use the same examples as in the self-study exercises. Please note that you may need to create several fresh copies of the same example to practice different features:

- [Example 1](../selfstudy/example-1.llms.md)
- [Example 3](../selfstudy/example-3.llms.md)

# Before You Arrive

Post your questions, challenges, and discoveries from the self-study exercises in the Teams chat.

------------------------------------------------------------------------

# Resources

Course data is available in the OneDrive folder: [ai4coding-data](https://worldbankgroup-my.sharepoint.com/:f:/g/personal/ebukin_worldbank_org/IgBy2yGjpLJPRbM67FJpBFVgAbMRYhEPmS30H2RJSBFO_gE).

Course examples and materials are available in this repository: [ai4coding](https://github.com/worldbank/ai4coding) or on OneDrive: [ai4coding-materials](https://worldbankgroup-my.sharepoint.com/:f:/g/personal/ebukin_worldbank_org/IgCXQVakSxEpT7VJFmKp_qtnAXx8RX9iemnwfGwITkEA3bE).

------------------------------------------------------------------------

# Day 2: Materials

**Slides**

View slides in a [new tab](..\day2/ai4coding-d2-1/index.llms.md).

## 1. Welcome, review of Day 1, and agenda

Review of Day 1 topics, Q&A from self-study exercises, and overview of today’s agenda.

------------------------------------------------------------------------

## 2. Scaffolding on Self-study Example 3 (live)

Live walkthrough of [Self-study: Example 3](../selfstudy/example-3.llms.md) — reproduce the analysis, check alignment with DIME coding standards, and revise the code using an agentic workflow.

**Workflow steps:**

1.  **Understand** — ask the AI to explain inputs, outputs, strengths, and weaknesses.
2.  **Adjust and reproduce** — change output paths and debug iteratively.
3.  **Analyze standards** — check alignment with DIME coding standards.
4.  **Revise** — apply suggested changes (self-study).

------------------------------------------------------------------------

## 3. Tools and MCP (slides + demos)

Explore how **tools** extend agents with specialized functionality and how **MCP** (Model Context Protocol) connects AI to external systems.

- Built-in tools, MCP tools, and extension tools.
- Using tools explicitly in chat with `#tool-name`.
- **Permission levels**: Default Approvals, Bypass Approvals, and Autopilot (preview).
- Configuring and using MCP servers (e.g., Stata MCP, Data360 MCP).
- **WB caveat**: MCP extensions are not available via the WB Software Center; servers must be configured manually in `.vscode/mcp.json`.
- Key distinction: MCP is a protocol exposing tools + resources + prompts; tools are individual callable functions within the IDE.
- Demo: debugging with tools and MCP side-by-side.

------------------------------------------------------------------------

## 4. Agents and customization (slides + demos)

Understanding agents, subagents, and the agent loop. Customizing AI behavior with instructions, prompt files, custom agents, and skills.

- The agent loop: Understand → Act → Validate.
- Agent types: local, background, and cloud.
- `.instructions.md` — global rules injected into every request.
- `.prompt.md` — reusable task templates invoked with `/my-prompt`.
- `.agent.md` — custom personas with curated tool access.
- `SKILL.md` — scoped expertise auto-loaded on description match.
- Demo: creating instruction files, prompt files, and importing skills.

------------------------------------------------------------------------

## 5. Planning mode and exercises (slides + live)

Use **Plan mode** to research and design before writing code — a 4-phase workflow: Discovery → Alignment → Design → Refinement.

- Activating plan mode with `/plan` in chat.
- Demo: planning the revision of an analysis do-file.
- Exercise: plan and execute [Example 1](../selfstudy/example-1.llms.md) and [Example 3](../selfstudy/example-3.llms.md) end-to-end.
