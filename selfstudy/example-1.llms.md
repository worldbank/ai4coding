# Ex.1 Stata in Positron and Copilot

Author

Affiliation

[Eduard Bukin](https://github.com/EBukin) [](mailto:ebukin@worldbank.org)

Distributional Impact of Policies. Fiscal Policy and Growth Department

The goal of this exercise is to get familiar with Positron’s AI assistance features and how they can be used to write and execute Stata code. We go through a typical workflow of creating a Stata do file, writing code with AI assistance, and executing it in the console.

This exercise overviews the following features of Positron’s AI assistance:

- inline suggestions: accepting, rejecting, and customizing
- chat mode: asking for code generation, revision, and troubleshooting
- inline chat: revising specific code snippets without leaving the editor
- agent mode: automating code execution and debugging
- context monitoring

**Watch the full video (18 min.) here**:

# An error occurred.

Unable to execute JavaScript.

## Where to start?

Setup [working folders properly](..\day1/_working-folder.qmd):

1.  Copy folder with `ex01-explore-positron` to your working directory
2.  Open `ex01-explore-positron` in Positron
3.  Follow the instructions below

All examples are available:

- on GitHub: <https://github.com/worldbank/ai4coding-examples>
- on One Drive (WB only): [ai4coding-examples](https://worldbankgroup-my.sharepoint.com/:f:/g/personal/ebukin_worldbank_org/IgCXQVakSxEpT7VJFmKp_qtnAXx8RX9iemnwfGwITkEA3bE?e=U08qTX)

For this example, data is already contained in the folder, but you can also download it from [ai4coding-data](https://worldbankgroup-my.sharepoint.com/:f:/r/personal/ebukin_worldbank_org/Documents/AI/AI-course-2026-April/ai4coding-data?csf=1&web=1&e=ITG6Sk) and place it your course folder.

## Prompt examples and example details

### Step 1. Create a script file in your editor

Let us call the file: `second-positron-do-with-ai.do`.

### Step 2. Inline suggestions

Write comments at the top of the file and save it. Then proceed adding the details and use in-line suggestions.

``` numberSource
/*
Goal: To learn how to use Positron AI assistance to write Stata code and
execute it. This code should include: data loading, descriptive statistics,
regression analysis, and visualization.

In details, these steps are:
*/
```

> **NOTE:**
>
> - Inline suggestions pop out automatically if you have enabled GitHub Copilot and Positron Assistant.
>
> - if it does not work, check: [Positron Assistant Completions](https://positron.posit.co/assistant-completions.html)
>
> - Remember that there might be many suggestions and you can customize them:
>
> [![AI is an assistant, not a replacement for analytical judgment. Always review and test AI-generated code before using it in your analysis.](images/inline-code.png)](images/inline-code.png "AI is an assistant, not a replacement for analytical judgment. Always review and test AI-generated code before using it in your analysis.")
>
> AI is an assistant, not a replacement for analytical judgment. Always review and test AI-generated code before using it in your analysis.

### Agent: code generation

Use the Chat window to ask for code generation for the steps outlined in the comments. For example: add following details to the file and ask AI to implement them:

``` numberSource
/*

I want to:
1. Load exemplary data from data/raw/
2. Summarize descriptive statistics of all variables
3. Run a regression of income on individual characteristics
4. Create a scatter plot of income vs age
5. Create a box plot of income vs education levels
6. Save regression results and figures in an Excel file
*/
```

Open Assistant chat and type:

``` numberSource
Develop code that implements the steps outlined in the comments for the file `my-first-do-in-positron.do`. Do not run the code.
```

- Add context by clicking on `+ Add context` and selecting the do file you are working on or adding console context with .

- Choose the model ![](images/copilot-model.png) and adjust the type of agent ![](images/copilot-settings.png) if needed.

- Press `Send`

Inspect the code and choose which parts to accept or reject

Use `run` button to execute the code

> **NOTE:**
>
> - Interrupt request if it goes wrong.
>
> - Switch between different models (e.g. GPT-4, Claude)
>
> - Choose the right mode: chat, agent, edit or plan.
>
> - Monitor the context window size
>
>   - When it is too big, AI forgets or optimizes it, potentially losing some important details.
>   - Use `Show Chat Debug View` to monitor the context and how it changes with each interaction.

### In-line chat: code refactoring

Select the code that does not behave as expected. Press `Ctrl + I`, then ask the AI assistant to revise it.

- Select model and adjust settings if needed.
- If happy, accept the changes. If not, provide feedback and ask for another revision.
- Can be used with free models.

> **NOTE:**
>
> [![AI in-line chat allows you to ask for revisions to specific code snippets without leaving the editor.](images/inline-chat.png)](images/inline-chat.png "AI in-line chat allows you to ask for revisions to specific code snippets without leaving the editor.")
>
> AI in-line chat allows you to ask for revisions to specific code snippets without leaving the editor.

### Agent: to revise and troubleshoot entire script

Iterate by adding requirements in the chat or in comments and ask AI to implement those step by step. For example:

``` numberSource
Create a new regression adding a fixed-effect of time and implementing
the robust standard errors. Then run the stata code.
```

``` numberSource
Remember: Use #executeCode to run stata code in console autonomously to check whether it works. Resolve execution errors in an agent mode using #executeCode and running all needed code in console.
```

> **WARNING:**
>
> **Important:** Be explicit about how Stata code should be executed.
>
> AI may sometimes choose the wrong approach (for example, creating a Python script to call Stata) instead of using Positron’s built-in `#executeCode` command. When this happens, AI is preoccupied about how to run Stata rather than what code to write, which leads to suboptimal code generation.
>
> To avoid this, always include the instruction about using `#executeCode` in your prompt when asking for code generation or revision in agent mode.
