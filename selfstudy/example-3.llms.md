# Ex.3 Reproduce, Revise, and Reuse existing analysis (self-study)

Author

Affiliation

[Eduard Bukin](https://github.com/ebukin) [](mailto:ebukin@worldbank.org) [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-1003-1260)

Distributional Impact of Policies. Fiscal Policy and Growth Department

This example is in `ex03-reproduce-revise-reuse`, which should be in `C:/WBG/ai/` on your computer if you followed the setup instructions correctly. Open this folder as a project in Positron.

## Objective

Practice the **3R workflow** — Reproduce, Revise, and Reuse — using AI assistance to adapt, modify, and repurpose existing analytical code. This is one of the most common tasks in applied economics: you inherit a script, need to run it on new data, change the specification, and extract reusable components, etc. This example will give you hands-on experience with how AI can support each step of this process, and what to watch out for.

Our specific objectives are to learn how to use AI to:

1.  Understand and reproduce existing analysis.
2.  Revise it to make it clear, transparent, well documented.
3.  Set up system prompt files that guide the AI to not do certain things.
4.  Adapt it to new data.
5.  Document it in accordance with the reproducibility package and requirements

## Part 1: Reproduce

- Develop prompts to understand the original code and its assumptions before making any changes.
- Run the original code and verify that you can reproduce the results as expected.
- Use AI to assist in running and debugging the code, but be cautious about blindly accepting AI suggestions without understanding them.

## Part 2: Revise

- Discuss with AI: What are the strengths and weaknesses of the original code? How maintainable is it? What are the potential risks of running this code as-is on new data? What is uncertain about it that you would want to verify before running? What must be addressed and changed to make it reusable and safe to run with the data?
- Critically reflect on the code’s maintainability, strengths, weaknesses, and potential risks.
- Restructure the code with the help of AI to make it more modular, transparent, and well-documented. This may involve breaking it into functions, adding comments, improving variable names, and creating a clear workflow.
- Ensure that revised code reproduces the same results as the original code before moving on to the next step. Document if not.

## Part 3: Setup system prompts

- Create system prompt files `.github/copilot-instructions.md` and `claude.md` specifying key dos and don’ts.
- Check with AI if it adheres by asking to produce code that it is not allowed.

## Part 4: Reuse

- Adapt the revised code to new data.

## Part 5: Document

- Generate a reproducibility package that includes the revised code, a data dictionary, and a report documenting the analysis, decisions, limitations, and reproducibility checklist. Use AI to assist in generating these documents, but ensure that they are accurate and complete.
- Use links to the reproducibility requirements.
