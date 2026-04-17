* Load sys auto data and make a regression of milage over weight.
* Plot a density curve of the residuals and a histogram of the fitted values.

sysuse auto, clear
regress mpg weight
predict residuals, resid
predict fitted, xb
kdensity residuals, normal
histogram fitted, normal
