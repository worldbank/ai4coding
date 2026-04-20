# Methods

Author

Affiliation

[Eduard Bukin](https://github.com/ebukin) [](mailto:ebukin@worldbank.org) [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-1003-1260)

Distributional Impact of Policies. Fiscal Policy and Growth Department

This section covers methods and best practices for working with AI in data analysis. The two topics below complement each other: the workflow tells you *how* to structure an AI-assisted project, while the safeguarding guide tells you *what to protect* along the way.

## [AI workflow for data analysis](../methods/common-workflow.llms.md)

AI coding assistants are probabilistic — the quality of their output depends heavily on the context you provide. A structured, eight-step workflow (objective → inputs/outputs → data dictionary → external metadata → checkpoint → iterative coding → independent verification → documentation) consistently produces better results than ad-hoc prompting. The workflow applies regardless of language (Stata, R, Python) or domain and gradually narrows the AI’s degrees of freedom until it can generate correct, reproducible code.

## [Safeguarding confidential data](../methods/safeguard-data.llms.md)

If sensitive microdata leaks into AI context it can create data-breach, privacy, and reputational risks. This section identifies the four main exposure channels (prompts, console output, file reads, command-line searches) and provides concrete remedies: curating prompts, setting system instructions to block file access and raw-data printing, generating lightweight metadata files in place of raw data, relocating data outside the working folder, and applying statistical disclosure control techniques (suppression, generalization, noise addition, pseudonymization) with dedicated packages.

## External references

> **TIP:**
>
> These references can be included as URLs directly in your prompts — most AI coding assistants will fetch and read the linked content, giving them richer context for code generation and advice.

### Reproducible research and data analysis

- [DIME Wiki — Reproducible Research](https://dimewiki.worldbank.org/Reproducible_Research)
- [World Bank Reproducible Research Repository](https://worldbank.github.io/wb-reproducible-research-repository/)
- [DIME Wiki — Data Analysis](https://dimewiki.worldbank.org/Data_Analysis)
- [DIME Wiki — Data Cleaning Checklist](https://dimewiki.worldbank.org/Checklist%3A_Data_Cleaning)
- [DIME Data Handbook](https://worldbank.github.io/dime-data-handbook/)
- [DIME Wiki — Master Do-files](https://dimewiki.worldbank.org/Master_Do-files)
- [DIME Wiki — Master Dataset](https://dimewiki.worldbank.org/Master_Dataset)
- [DIME Wiki — ID Variable Properties](https://dimewiki.worldbank.org/ID_Variable_Properties)
- [DIME Wiki — Stata Coding Practices](https://dimewiki.worldbank.org/Stata_Coding_Practices)

### Data privacy and anonymization

- [DIME Data Handbook — Processing confidential data](https://worldbank.github.io/dime-data-handbook/processing.html#processing-confidential-data)
- [DIME Data Handbook — Handling data securely](https://worldbank.github.io/dime-data-handbook/acquisition.html#handling-data-securely)
- [IHSN — Microdata Anonymization](https://www.ihsn.org/anonymization)
- [Utrecht University — Data Privacy Handbook](https://utrechtuniversity.github.io/dataprivacyhandbook/)
- [IHSN — SDC Theory Guide](https://sdctheory.readthedocs.io/en/latest/)

### AI policies and responsible use

- [World Bank AI Use Policy](https://ai.worldbank.org/policy)
- [World Bank Responsible AI Guidelines](https://ai.worldbank.org/guidelines)
- [Positron Assistant Provider Privacy Information](https://positron.posit.co/assistant-provider-info.html)
- [GitHub Copilot — Responsible use of code completion](https://docs.github.com/en/copilot/responsible-use/copilot-code-completion)
- [GitHub Copilot — Responsible use of Chat in your IDE](https://docs.github.com/en/copilot/responsible-use/chat-in-your-ide)
