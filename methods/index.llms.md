# Methods

Author

Affiliation

[Eduard Bukin](https://github.com/EBukin) [](mailto:ebukin@worldbank.org)

Distributional Impact of Policies. Fiscal Policy and Growth Department

This section covers methods and best practices for working with AI in data analysis. The two topics below complement each other: the workflow tells you *how* to structure an AI-assisted project, while the safeguarding guide tells you *what to protect* along the way.

## [AI workflow for data analysis](../methods/common-workflow.llms.md)

AI coding assistants are probabilistic — the quality of their output depends heavily on the context you provide. A structured, eight-step workflow (objective → inputs/outputs → data dictionary → external metadata → checkpoint → iterative coding → independent verification → documentation) consistently produces better results than ad-hoc prompting. The workflow applies regardless of language (Stata, R, Python) or domain and gradually narrows the AI’s degrees of freedom until it can generate correct, reproducible code.

## [Safeguarding confidential data](../methods/safeguard-data.llms.md)

If sensitive microdata leaks into AI context, it can create data-breach, privacy, and reputational risks. This section identifies the four main exposure channels (prompts, console output, file reads, command-line searches) and provides concrete remedies: curating prompts, setting system instructions to block file access and raw-data printing, generating lightweight metadata files in place of raw data, relocating data outside the working folder, and applying statistical disclosure control techniques (suppression, generalization, noise addition, pseudonymization) with dedicated packages.

## [DIME Data Handbook Appendix: AI and reproducible research](../methods/dime-handbook-appendix.llms.md)

This is a reference section adapted from the DIME Data Handbook covering how for the purpose of using in the course as an online material for AI’s digestion.

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
