# Positron Extensions

Author

Affiliation

[Eduard Bukin](https://github.com/ebukin) [](mailto:ebukin@worldbank.org) [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-1003-1260)

Distributional Impact of Policies. Fiscal Policy and Growth Department

> **WARNING:**
>
> 1.  **Positron Stata** extension installed and configured.

> **Why?** Positron extensions add language support, tooling, and AI features to the editor. The extensions below are required for AI-assisted Stata workflows in this course.

**What you need to do:**

1.  Install extensions in positron:
    1.  [Positron Stata](https://open-vsx.org/vscode/item?itemName=ntluong95.positron-stata) extension (or alternative [Stata MCP](https://open-vsx.org/vscode/item?itemName=DeepEcon.stata-mcp)).
    2.  [stataglow](https://open-vsx.org/vscode/item?itemName=randrescastaneda.stataglow) extension for Stata syntax highlighting.
    3.  [databot](https://open-vsx.org/vscode/item?itemName=posit.databot) extension for AI-assisted data analysis in R (optional).
    4.  Other extensions as desired (e.g., Python, R, Quarto support).
2.  Set correct settings for some extensions, e.g.
    1.  Set [Stata installation path](vscode-server://settings/positron.stata.installationPath) in Positron settings.
    2.  Set Stata MCP server settings for autonomous agent use (optional).
    3.  Set [stataEdition](vscode-server://settings/positron.stata.stataEdition) to `mp`, `se`, or `be` depending on your Stata license.
3.  Verify that Stata runs correctly from Positron.

## Extensions overview

Positron/VS Code ships with minimal built-in functionality by design — extensions add support for specific languages, tools, and workflows without bloating the core editor.

Notable extensions for this course:

- [Positron Assistant](https://open-vsx.org/vscode/item?itemName=posit.assistant) — installed by default; provides AI code suggestions and completions via GitHub Copilot and other AI providers.
- [Claude Code](https://open-vsx.org/vscode/item?itemName=Anthropic.claude-code) — agentic AI coding using Anthropic’s Claude models.
- [Positron Databot](https://open-vsx.org/vscode/item?itemName=posit.databot) — AI-assisted data analysis and visualization.

## Installing any extensions

Open the **Extensions panel** with `Ctrl+Shift+X` or click the square icon ![Extensions panel](../../assets/img/extensions.png) on the left sidebar.

To install any extension:

1.  **Search** for it by name
2.  Click **Install**
3.  If prompted “Do you trust the publisher?”, click **Trust and Install**
4.  If needed, **reload Positron**: `Ctrl+Shift+P` → `Developer: Reload Window`

[![Extensions panel](../../assets/img/extensions-panel.png)](../../assets/img/extensions-panel.png "Extensions panel")

Extensions panel

### Positron–Stata integration

Stata has no built-in editor integration. Extensions bridge the gap by connecting Positron to Stata’s backend, enabling an AI-assisted coding workflow. Three components work together:

1.  **Stata 18+** with Model Context Protocol (MCP) support executes Stata code.
2.  **Python + `uv`** — sends code to Stata and captures output.
3.  **A Positron extension** — surfaces results in the editor UI.

> **WARNING:**
>
> - **Custom logs not supported** — `log using <filename>` conflicts with the extension’s own logging. Stata only allows one log at a time. Use `capture log using <filename>` to bypass this limitation.
> - **Bugs are possible** — report issues to the extension developers (links below).

### Which extension to install?

Two extensions provide Stata integration. Install one — not both.

| Extension | Recommendation | Highlights |
|----|----|----|
| [**Positron Stata**](https://open-vsx.org/extension/ntluong95/positron-stata) | **Recommended** | Native Positron integration (console, data viewer, plots) |
| [Stata MCP](https://open-vsx.org/extension/DeepEcon/stata-mcp) | Alternative | More mature; better for VS Code / Cursor users |
| [**stataglow**](https://open-vsx.org/vscode/item?itemName=randrescastaneda.stataglow) | Stata syntax highlighting | works with either extension |

**Key differences:**

| Feature | Positron Stata | Stata MCP |
|----|----|----|
| Console output in Positron | ✅ | ✅ |
| Data viewer | ✅ | ❌ |
| Multiple Stata sessions | ✅ | ❌ |
| AI agent integration | ✅ | ✅ |
| MCP support | ✅ | ✅ |
| Maturity | New (2026) | More mature (2023) |
| Good for… | Positron users who want native integration | VS Code / Cursor users who want MCP support |

## Positron Stata extension

Native Positron integration of Stata with console, data viewer, plots. Help and documentation are on GitHub along with issue reporting: [github.com/ntluong95/positron-stata](https://github.com/ntluong95/positron-stata).

To install it:

1.  Open the Extensions panel (`Ctrl+Shift+X`)

2.  Search for **Positron Stata** or `ntluong95.positron-stata`

3.  Click **Install** -\> **Trust and Install**

4.  Reload Positron: `Ctrl+Shift+P` → `Developer: Reload Window`

5.  Open settings in Positron (`Ctrl+,`).

6.  Search for [`positron.stata.installationPath`](vscode-server://settings/positron.stata.installationPath)

7.  Set the path to your Stata installation, e.g. `C:\Program Files\StataNow19\` (adjust if Stata is installed elsewhere).

8.  Create a new `.do` file and run example code to verify the extension is working (or open an existing one).

    - create `test.do` with:

      ``` numberSource
      sysuse auto
      summarize price
      display "Stata is working!"
      ```

    - Save the file (`Ctrl+S`) — **unsaved edits are not executed**.

    - Run the file (`Ctrl+Shift+D` or `Ctrl+Shift+P` → `Stata: Run Current File`)

## Installation

[![](../../assets/img/pos-stat-p1.gif)](../../assets/img/pos-stat-p1.gif)

## Verification

[![](../../assets/img/pos-stat-p2.gif)](../../assets/img/pos-stat-p2.gif)

## Key features

- Create and run `.do` files
- AI agent integration
- Console: execute Stata code and see output
- Environment: variables and globals
- Data: view, and explore
- Figures: display, manage, and export
- Have multiple Stata sessions

[![](../../assets/img/pos-stata-ext1.gif)](../../assets/img/pos-stata-ext1.gif)

## Stata MCP Extension

The [Stata MCP extension](https://open-vsx.org/extension/DeepEcon/stata-mcp) enables **Model Context Protocol (MCP)** for Stata. Help and documentation are on the [Open VSX page](https://open-vsx.org/extension/DeepEcon/stata-mcp).

To install it:

1.  Open the Extensions panel (`Ctrl+Shift+X`)

2.  Search for **Stata MCP** or `DeepEcon.stata-mcp`

3.  Click **Install** -\> **Trust and Install**

4.  Reload Positron: `Ctrl+Shift+P` → `Developer: Reload Window`

5.  Open settings in Positron (`Ctrl+,`).

6.  Search for `stata-vscode.stataPath`

7.  Set the path to your Stata installation, e.g. `C:\Program Files\StataNow19\` (adjust if Stata is installed elsewhere).

8.  Search for `stata-vscode.stataEdition` and set it to `mp`, `se`, or `be` depending on your Stata license.

9.  Create a new `.do` file and run example code to verify the extension is working (or open an existing one).

    - create `test.do` with:

      ``` numberSource
      sysuse auto
      summarize price
      display "Stata is working!"
      ```

    - Save the file (`Ctrl+S`) — **unsaved edits are not executed**.

    - Run the file (`Ctrl+Shift+D` or `Ctrl+Shift+P` → `Stata: Run Current File`)

## Installation, verification and features

- Run Stata `.do` files directly from Positron
- AI agent integration (GitHub Copilot, Claude) with full context of your Stata environment
- Functions with other IDEs and tools that support MCP (e.g. VS Code, Cursor)

[![](../../assets/img/pos-stata-ext2-demo.gif)](../../assets/img/pos-stata-ext2-demo.gif)
