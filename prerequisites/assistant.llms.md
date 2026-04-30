# Positron Assistant

Author

Affiliation

[Eduard Bukin](https://github.com/EBukin) [](mailto:ebukin@worldbank.org)

Distributional Impact of Policies. Fiscal Policy and Growth Department

> **WARNING:**
>
> 1.  **Positron Assistant** enabled and connected to the GitHub Copilot provider.

> **Why?** Positron Assistant is the built-in AI coding companion in Positron. It connects you to language models (GitHub Copilot, Anthropic Claude, OpenAI, etc.) for chat-based help, inline code suggestions, and code completions — all inside the editor. Enabling it is required for the AI-assisted workflows used in this course.

The steps below are adapted from the [Positron Assistant Getting Started](https://positron.posit.co/assistant-getting-started.html) guide.

------------------------------------------------------------------------

## Step 1 — Enable Positron Assistant

1.  Open Positron settings (`Ctrl+,`).
2.  Search for `positron.assistant.enable` and check the box.

[![Enable Positron Assistant setting](..\assets/img/positron-assistant-enable.png)](..\assets/img/positron-assistant-enable.png "Enable Positron Assistant setting")

Enable Positron Assistant setting

3.  Restart Positron or run the *Developer: Reload Window* command in the Command Palette (`Ctrl+Shift+P`).

------------------------------------------------------------------------

## Step 2 — Configure a language model provider

Anthropic and GitHub Copilot are enabled by default. Other providers (Amazon Bedrock, Snowflake Cortex, OpenAI, Custom) are in preview/experimental and must be enabled through settings.

## GitHub Copilot

GitHub Copilot is enabled by default when you are signed in.

1.  Run the command *Positron Assistant: Configure Language Model Providers* (`Ctrl+Shift+P`).
2.  Select **GitHub Copilot** as the model provider.

[![GitHub Copilot selected in provider modal](..\assets/img/assistant-provider-modal-github-copilot.png)](..\assets/img/assistant-provider-modal-github-copilot.png "GitHub Copilot selected in provider modal")

GitHub Copilot selected in provider modal

3.  Select **Sign in** and complete the GitHub OAuth flow in your browser.

> **NOTE:**
>
> You can also sign in to GitHub via the **Accounts** icon (bottom-left of the Activity Bar).

------------------------------------------------------------------------

## Step 3 — Use Positron Assistant

Once authenticated with at least one provider, open the Assistant chat:

1.  Select the chat robot icon in the sidebar, or run `Chat: Open Chat` from the Command Palette.

[![Assistant Sidebar Icon](..\assets/img/assistant-sidebar-icon.png)](..\assets/img/assistant-sidebar-icon.png "Assistant Sidebar Icon")

Assistant Sidebar Icon

[![Assistant Panel](..\assets/img/assistant-panel.png)](..\assets/img/assistant-panel.png "Assistant Panel")

Assistant Panel

2.  Type your question in the chat input box and press `Enter`.

See the full [Positron Assistant Getting Started](https://positron.posit.co/assistant-getting-started.html) guide for all provider options.

------------------------------------------------------------------------

## Step 4 — Troubleshooting

Advanced models (Claude, GPT) are not available for me in positron assistant.

- This is because you do not have Github Copilot subscription, see [Verify Github Copilot Access](../prerequisites/github.llms.md#sec-verify-gh-copilot-access) for details.

Most often, issues with Positron Assistant and GitHub Copilot are related to **authentication**, **configuration**, or **exceeding the free-requests quota**.

- You may not have activated GitHub Copilot through a private or WB subscription. Check the [GitHub Copilot setup guide](../prerequisites/github.llms.md) for details.

- Check whether you still have free premium requests available. If you have exhausted your quota, you will need to wait until it resets or subscribe to a paid plan. See the [GitHub Copilot setup guide](../prerequisites/github.llms.md) for details.

- Positron Assistant may not be enabled or configured to use GitHub Copilot as the provider. Check the [Positron Assistant setup guide](../prerequisites/assistant.llms.md) for details.

If error messages persist after confirming the above, contact <ITHelp@worldbankgroup.org> for assistance and <github@worldbankgroup.org> to verify that your GitHub Copilot subscription is active.
