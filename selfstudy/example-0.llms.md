# Ex.0 Test your setup

Author

Affiliation

[Eduard Bukin](https://github.com/ebukin) [](mailto:ebukin@worldbank.org) [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-1003-1260)

Distributional Impact of Policies. Fiscal Policy and Growth Department

This example is in `ex00-positron-test`, which should be in `C:/WBG/ai/` on your computer if you followed the setup instructions correctly. Open this folder as a project in Positron to ensure that all file paths work correctly.

## Objective

This exercise verifies that your software environment is correctly set up for the course. Each file in this folder runs a small analysis that exercises a different language or tool. If every file runs without errors, your setup is ready.

## What is being tested

| File | Language / Tool | What it checks |
|----|----|----|
| `test-r.R` | R | tidyverse, ggplot2, palmerpenguins, OLS regression |
| `test-python.py` | Python | pandas, seaborn, matplotlib, statsmodels, scikit-learn |
| `test-jupyter.ipynb` | Python (Jupyter) | Same Python stack inside a Jupyter notebook |
| `test-quarto.qmd` | Quarto + R | Quarto rendering with R code chunks, knitr, broom |
| `test-stata.do` | Stata | Data generation, regression, and graphing |

## How to run each file

1.  **Open the file** in Positron (or VS Code).
2.  **Run it:**
    - **R script** (`test-r.R`) — Open the file and click the **Run** button (or press `Ctrl+Shift+Enter` to run all lines). The R console will execute the script.
    - **Python script** (`test-python.py`) — Open the file and click **Run** (or press `Ctrl+Shift+Enter`). The Python console will execute the script.
    - **Jupyter notebook** (`test-jupyter.ipynb`) — Open the notebook, then click **Run All** in the toolbar to execute every cell.
    - **Quarto document** (`test-quarto.qmd`) — Open the file and click the **Render** button (or run `quarto render test-quarto.qmd` in the terminal) to produce an HTML report.
    - **Stata do-file** (`test-stata.do`) — Open the file and click **Run** (or execute `do test-stata.do` in Stata).
3.  **Check the output.** Each file should produce tables, plots, or regression output without errors. If something fails, the error message will tell you which package or dependency is missing.

## Expected outcome

- Four ggplot2 charts and an OLS summary (R)
- Four seaborn/matplotlib charts and an OLS summary (Python script and notebook)
- A rendered HTML document with figures, tables, and inline statistics (Quarto)
- Three Stata graphs, summary statistics, and a regression table (Stata)

If all files run successfully, your environment is ready for the course.
