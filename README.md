# AI for Coding

A World Bank course on AI-assisted coding with Positron, GitHub Copilot, and Stata.

Author: Eduard Bukin ([ebukin@worldbank.org](mailto:ebukin@worldbank.org))

## Course Structure and Objective

The purpose of this course is to equip economists who regularly use Stata and 
other modern statistical programming languages to leverage AI-assisted coding 
tools effectively and responsibly. The course introduces participants to 
AI coding assistants (GitHub Copilot) within the Positron IDE.
The course consists of two 3-hour sessions with a self-study period in between.

**By the end of the course, participants will be able to:**

- Use AI assistants for code understanding, refactoring, and revision.
- Understand how LLMs work and what other concepts mean: tokens, prompts, context windows, agents
- Identify what AI can and cannot do reliably in a coding workflow
- Secure sensitive data and apply responsible AI guardrails
- Plan and execute complex, multi-step analytical tasks with an AI agent
- Apply context engineering techniques: `#tools`, `skills`, `/prompts`, `/agents`, and `MCP` connectors
- Supervise AI agent execution and course-correct when it goes off track

### Prerequisites

Before the first session, participants complete:

1. **Software Setup** — Stata 19+ MP, R 4.5+, Python 3.13+ with `uv`, Positron, Quarto 1.9+, Git
2. **GitHub & Copilot** — personal GitHub account, WB org membership, Copilot access and premium requests
3. **Positron Extensions** — Positron Stata (or Stata MCP), stataglow, databot
4. **Positron Assistant** — enable assistant, connect to GitHub Copilot provider

### Day 1 — Introduction to AI-Assisted Coding (3 hours)

| Time   | Topic                                                                         |
| ------ | ----------------------------------------------------------------------------- |
| 10 min | Welcome, introductions, course and materials overview                         |
| 30 min | Software overview: Positron, GitHub Copilot, and Stata setup                  |
| 40 min | AI in action with Stata (R): my typical data workflow using AI                |
| 10 min | Break                                                                         |
| 30 min | AI overview: how GitHub Copilot and LLMs work, key concepts, and capabilities |
| 30 min | Cookbook: securing sensitive data, guardrails, and responsible AI use         |
| 30 min | Self-study exercises overview and Q&A                                         |

### Self-Study Period (2–3 days)

Independent practice with structured case studies: reproduce old code, reproduce from an example, or try a new language.

### Day 2 — Everyday AI-Assisted Coding (3 hours)

| Time   | Topic                                                                                            |
| ------ | ------------------------------------------------------------------------------------------------ |
| 20 min | Q&A from self-study: challenges and discoveries                                                  |
| 30 min | Exercise: planning and executing complex tasks with parallel agentic workflows                   |
| 30 min | Context engineering: `#tools`, `skills`, `MCP`, and other relevant features                      |
| 10 min | Break                                                                                            |
| 45 min | Exercise: using the right `#tools`, integrating AI `skills`, developing `/prompts` and `/agents` |
| 30 min | Q&A and discussion                                                                               |
| 5 min  | Feedback survey                                                                                  |
| 10 min | Closing remarks and next steps                                                                   |

## License

This project is licensed under the MIT License together with the [World Bank IGO Rider](WB-IGO-RIDER.md). The Rider is purely procedural: it reserves all privileges and immunities enjoyed by the World Bank, without adding restrictions to the MIT permissions. Please review both files before using, distributing or contributing.
