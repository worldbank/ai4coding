# Suggested prompts

## Code for `my-first-do-in-positron.do`

```stata
* Load sys auto data and make a regression of milage over weight.
* Plot a density curve of the residuals and a histogram of the fitted values.

sysuse auto, clear
regress mpg weight
predict residuals, resid
predict fitted, xb
kdensity residuals, normal
histogram fitted, normal
```

## Prompts examples for using AI to create first Stata do file in Positron

1. Create the file: `my-first-do-in-positron.do`

2. Write comments at the top of the file and save it. Then proceed adding the details
   and use in-line suggestions.

```stata
/*
Goal: To learn how to use Positron AI assistance to write Stata code and 
execute it. This code should include: data loading, descriptive statistics, 
regression analysis, and visualization.

In details, thes steps are: 

*/
```

3. Here are the details I propose to have. Add them as comments

```stata
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

4. Open Assistant chat and type:

```
Develop code that implements the steps outlined in the comments for the file `my-first-do-in-positron.do`. Do not run the code.
```

5. Inpect the code and choose which parts to accept or reject

6. Use `run` button to execute the code

7. Select code that does not do what you expected. Press `Ctrl + I` and 
   ask AI to revise it.

8. Iterate by adding requirements to the core in the chat or in comments and ask
   AI to implement those step by step. For example

```
Create a new regression adding a fixe-effect of time and implementing 
the robust standard errors.
Use #executeCode to run stata code in console autonomously to check weather it 
works.
```
