# Positron Assistant

Author

Affiliation

[Eduard Bukin](https://github.com/ebukin) [](mailto:ebukin@worldbank.org) [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-1003-1260)

Distributional Impact of Policies. Fiscal Policy and Growth Department

> **WARNING:**
>
> 1.  **Positron Assistant** enabled and connected to the GitHub Copilot provider.

> **Why?** Positron Assistant is the built-in AI coding companion in Positron. It connects you to language models (GitHub Copilot, Anthropic Claude, OpenAI, etc.) for chat-based help, inline code suggestions, and code completions — all inside the editor. Enabling it is required for the AI-assisted workflows used in this course.

## Enabling Positron Assistant (from official docs)

The steps below are adapted from the [Positron Assistant Getting Started](https://positron.posit.co/assistant-getting-started.html) guide.

### Step 1 — Enable Positron Assistant

1.  Open Positron settings (`Ctrl+,`).
2.  Search for `positron.assistant.enable` and check the box.

[![Enable Positron Assistant setting](../../assets/img/positron-assistant-enable.png)](../../assets/img/positron-assistant-enable.png "Enable Positron Assistant setting")

Enable Positron Assistant setting

3.  Restart Positron or run the *Developer: Reload Window* command in the Command Palette (`Ctrl+Shift+P`).

### Step 2 — Configure a language model provider

Anthropic and GitHub Copilot are enabled by default. Other providers (Amazon Bedrock, Snowflake Cortex, OpenAI, Custom) are in preview/experimental and must be enabled through settings.

## GitHub Copilot

GitHub Copilot is enabled by default when you are signed in.

1.  Run the command *Positron Assistant: Configure Language Model Providers* (`Ctrl+Shift+P`).
2.  Select **GitHub Copilot** as the model provider.

[![GitHub Copilot selected in provider modal](../../assets/img/assistant-provider-modal-github-copilot.png)](../../assets/img/assistant-provider-modal-github-copilot.png "GitHub Copilot selected in provider modal")

GitHub Copilot selected in provider modal

3.  Select **Sign in** and complete the GitHub OAuth flow in your browser.

> **NOTE:**
>
> You can also sign in to GitHub via the **Accounts** icon (bottom-left of the Activity Bar).

### Step 3 — Use Positron Assistant

Once authenticated with at least one provider, open the Assistant chat:

1.  Select the chat robot icon in the sidebar, or run `Chat: Open Chat` from the Command Palette.

[![Assistant Sidebar Icon](../../assets/img/assistant-sidebar-icon.png)](../../assets/img/assistant-sidebar-icon.png "Assistant Sidebar Icon")

Assistant Sidebar Icon

[![Assistant Panel](../../assets/img/assistant-panel.png)](../../assets/img/assistant-panel.png "Assistant Panel")

Assistant Panel

2.  Type your question in the chat input box and press `Enter`.

See the full [Positron Assistant Getting Started](https://positron.posit.co/assistant-getting-started.html) guide for all provider options.

## Support

- IT Help: <ITHelp@worldbankgroup.org> \| [Walk-in centres](https://worldbankgroup.sharepoint.com/sites/itsupport/SitePages/PublishingPages/Walk-in-Centers-in-Washington-DC--05042021-1608401_new.aspx)
- GitHub / Copilot access: <github@worldbank.org>
- Additional resources: [Positron docs](https://positron.posit.co/) · [GitHub Copilot docs](https://docs.github.com/en/copilot)
