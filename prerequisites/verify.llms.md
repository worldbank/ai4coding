# Verification

Author

Affiliation

[Eduard Bukin](https://github.com/ebukin) [](mailto:ebukin@worldbank.org) [![](data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABAAAAAQCAYAAAAf8/9hAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAA2ZpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMC1jMDYwIDYxLjEzNDc3NywgMjAxMC8wMi8xMi0xNzozMjowMCAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wTU09Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9tbS8iIHhtbG5zOnN0UmVmPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvc1R5cGUvUmVzb3VyY2VSZWYjIiB4bWxuczp4bXA9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC8iIHhtcE1NOk9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo1N0NEMjA4MDI1MjA2ODExOTk0QzkzNTEzRjZEQTg1NyIgeG1wTU06RG9jdW1lbnRJRD0ieG1wLmRpZDozM0NDOEJGNEZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wTU06SW5zdGFuY2VJRD0ieG1wLmlpZDozM0NDOEJGM0ZGNTcxMUUxODdBOEVCODg2RjdCQ0QwOSIgeG1wOkNyZWF0b3JUb29sPSJBZG9iZSBQaG90b3Nob3AgQ1M1IE1hY2ludG9zaCI+IDx4bXBNTTpEZXJpdmVkRnJvbSBzdFJlZjppbnN0YW5jZUlEPSJ4bXAuaWlkOkZDN0YxMTc0MDcyMDY4MTE5NUZFRDc5MUM2MUUwNEREIiBzdFJlZjpkb2N1bWVudElEPSJ4bXAuZGlkOjU3Q0QyMDgwMjUyMDY4MTE5OTRDOTM1MTNGNkRBODU3Ii8+IDwvcmRmOkRlc2NyaXB0aW9uPiA8L3JkZjpSREY+IDwveDp4bXBtZXRhPiA8P3hwYWNrZXQgZW5kPSJyIj8+84NovQAAAR1JREFUeNpiZEADy85ZJgCpeCB2QJM6AMQLo4yOL0AWZETSqACk1gOxAQN+cAGIA4EGPQBxmJA0nwdpjjQ8xqArmczw5tMHXAaALDgP1QMxAGqzAAPxQACqh4ER6uf5MBlkm0X4EGayMfMw/Pr7Bd2gRBZogMFBrv01hisv5jLsv9nLAPIOMnjy8RDDyYctyAbFM2EJbRQw+aAWw/LzVgx7b+cwCHKqMhjJFCBLOzAR6+lXX84xnHjYyqAo5IUizkRCwIENQQckGSDGY4TVgAPEaraQr2a4/24bSuoExcJCfAEJihXkWDj3ZAKy9EJGaEo8T0QSxkjSwORsCAuDQCD+QILmD1A9kECEZgxDaEZhICIzGcIyEyOl2RkgwAAhkmC+eAm0TAAAAABJRU5ErkJggg==)](https://orcid.org/0000-0002-1003-1260)

Distributional Impact of Policies. Fiscal Policy and Growth Department

Check that everything is set up correctly by following the instructions.

## Positron is working

- Open Positron.
- Create a new working directory in `C:\WBG\ai\` called `ex00-positron-test`.
- Open this folder in Positron.

## GitHub Copilot is working

- Open chat in Positron (select the chat robot icon in the sidebar, or run `Chat: Open Chat` from the Command Palette `Ctrl+Shift+P`).
- Ask AI how to create a new `.R` script in Positron and write a simple R code to print “Hello World”.
- If you see the code generated in the chat, and some answers, then everything is set up correctly.

## Stata / R / Python / Quarto are working

## Stata

- In Positron create a new file `test-stata.do` in the `ex00-positron-test` folder.
- Copy paste the following code in this file and run it.
- If you see results in the terminal, then Stata is working correctly.

``` numberSource
* Example stata code for Positron

* Load auto dataset
sysuse auto, clear
* Generate a new variable for price in thousands
gen price_k = price / 1000
* Run a regression of price on weight and length
regress price_k weight length
* Create a scatter plot of price vs weight
scatter price_k weight
* Create a histogram of price
histogram price_k, normal
* Save the dataset with the new variable
save auto_modified, replace
```

If there are no results, common problems may include:

- Stata is not installed \>\>\> Check with ITS.

- `Positron stata` extension is not installed \>\>\> check [Positron Stata extension](../prerequisites/extensions.llms.md#sec-positron-stata-extension)

- Stata path is not set correctly in Positron settings \>\>\> check [Positron Stata extension](../prerequisites/extensions.llms.md#sec-positron-stata-extension)

- Python package `uv` does not work properly \>\>\> check [Common Problems](../prerequisites/common-problems.llms.md#python-uv-installation-problem)

## R

- Create a new file `test-r.R` in the `ex00-positron-test` folder.
- Copy paste the following code in this file and run it. If you see the plots and regression output in the terminal, then R is working correctly.
- Press ![](images/run.png) to run it.
- If something does not work, check the [Software Setup](../prerequisites/software.llms.md)

``` numberSource
# test-r.R
# Verify R is working: package management, palmerpenguins data,
# visualisations (scatter, histogram, box, facets), and regression.

# -------------------------------------------------------
# 1. Package check + install
# -------------------------------------------------------
required_pkgs <- c("tidyverse", "ggplot2", "palmerpenguins")

missing_pkgs <- required_pkgs[
  !sapply(required_pkgs, requireNamespace, quietly = TRUE)
]

if (length(missing_pkgs) > 0) {
  message("Installing missing packages: ", paste(missing_pkgs, collapse = ", "))
  install.packages(missing_pkgs, repos = "https://cloud.r-project.org")
} else {
  message("All required packages are already installed.")
}

library(tidyverse)
library(palmerpenguins)

# -------------------------------------------------------
# 2. Data overview
# -------------------------------------------------------
glimpse(penguins)

penguins_clean <- penguins |> drop_na()
cat(sprintf(
  "\nRows after dropping NAs: %d (removed %d)\n",
  nrow(penguins_clean),
  nrow(penguins) - nrow(penguins_clean)
))

# -------------------------------------------------------
# 3. Figure 1 — Scatter: bill dimensions coloured by species
# -------------------------------------------------------
fig_scatter <- ggplot(
  penguins_clean,
  aes(x = bill_length_mm, y = bill_depth_mm, colour = species, shape = species)
) +
  geom_point(alpha = 0.7, size = 2.5) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 0.9) +
  scale_colour_manual(values = c("darkorange", "purple", "cyan4")) +
  scale_shape_manual(values = c(16, 17, 15)) +
  labs(
    title = "Bill length vs. bill depth",
    subtitle = "Linear fit per species",
    x = "Bill length (mm)",
    y = "Bill depth (mm)",
    colour = "Species",
    shape = "Species"
  ) +
  theme_minimal(base_size = 13)

print(fig_scatter)

# -------------------------------------------------------
# 4. Figure 2 — Histogram: flipper length by species (overlaid)
# -------------------------------------------------------
fig_hist <- ggplot(
  penguins_clean,
  aes(x = flipper_length_mm, fill = species)
) +
  geom_histogram(
    alpha = 0.6,
    binwidth = 5,
    position = "identity",
    colour = "white"
  ) +
  scale_fill_manual(values = c("darkorange", "purple", "cyan4")) +
  labs(
    title = "Flipper length distribution",
    x = "Flipper length (mm)",
    y = "Count",
    fill = "Species"
  ) +
  theme_minimal(base_size = 13)

print(fig_hist)

# -------------------------------------------------------
# 5. Figure 3 — Box plots: body mass by species and sex
# -------------------------------------------------------
fig_box <- ggplot(
  penguins_clean,
  aes(x = species, y = body_mass_g, fill = sex)
) +
  geom_boxplot(alpha = 0.7, outlier.shape = 21, outlier.size = 2) +
  scale_fill_manual(values = c("steelblue", "tomato")) +
  labs(
    title = "Body mass by species and sex",
    x = "Species",
    y = "Body mass (g)",
    fill = "Sex"
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "top")

print(fig_box)

# -------------------------------------------------------
# 6. Figure 4 — Faceted scatter: bill dimensions faceted by island
# -------------------------------------------------------
fig_facet <- ggplot(
  penguins_clean,
  aes(x = bill_length_mm, y = bill_depth_mm, colour = species, shape = species)
) +
  geom_point(alpha = 0.7, size = 2) +
  facet_wrap(~island, nrow = 1) +
  scale_colour_manual(values = c("darkorange", "purple", "cyan4")) +
  scale_shape_manual(values = c(16, 17, 15)) +
  labs(
    title = "Bill dimensions by island",
    subtitle = "Faceted by island of observation",
    x = "Bill length (mm)",
    y = "Bill depth (mm)",
    colour = "Species",
    shape = "Species"
  ) +
  theme_minimal(base_size = 13) +
  theme(
    panel.spacing = unit(1, "lines"),
    strip.text = element_text(face = "bold")
  )

print(fig_facet)

# -------------------------------------------------------
# 7. Regression: body mass ~ flipper length + bill length + species
# -------------------------------------------------------
model <- lm(
  body_mass_g ~ flipper_length_mm + bill_length_mm + bill_depth_mm + species,
  data = penguins_clean
)

cat("\n---- OLS Regression: Body mass ----\n")
print(summary(model))

# Tidy coefficient table
cat("\n---- Tidy coefficients ----\n")
coef_tbl <- broom::tidy(model, conf.int = TRUE) |>
  mutate(across(where(is.numeric), \(x) round(x, 3)))
print(coef_tbl)

cat(sprintf(
  "\nAdjusted R²: %.4f | Residual std. error: %.1f g\n",
  summary(model)$adj.r.squared,
  summary(model)$sigma
))
```

## Python

- Create a new file `test-python.py` in the `ex00-positron-test` folder.
- Copy paste the following code in this file and run it.
- If you see the plots and regression output in the terminal, then Python is working correctly.
- Press ![](images/run.png) to run it.

``` numberSource

# test-python.py
# Verify Python is working: package management, palmerpenguins data,
# visualisations (violin, pairplot, bar + CI, KDE heatmap), and regression.

# -------------------------------------------------------
# 1. Package check + install
# -------------------------------------------------------
import importlib
import subprocess
import sys

required = ["palmerpenguins", "pandas", "matplotlib", "seaborn", "statsmodels", "scikit-learn"]

missing = [pkg for pkg in required if importlib.util.find_spec(pkg) is None]
if missing:
    print(f"Installing missing packages: {', '.join(missing)}")
    subprocess.check_call([sys.executable, "-m", "pip", "install", *missing])
else:
    print("All required packages are already installed.")

# -------------------------------------------------------
# 2. Imports and data loading
# -------------------------------------------------------
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from palmerpenguins import load_penguins
import statsmodels.formula.api as smf
from sklearn.preprocessing import LabelEncoder

sns.set_theme(style="whitegrid", palette="colorblind")
SPECIES_PALETTE = {"Adelie": "#FF8C00", "Chinstrap": "#9400D3", "Gentoo": "#008B8B"}

# -------------------------------------------------------
# 3. Data loading
# -------------------------------------------------------
penguins = load_penguins()
penguins_clean = penguins.dropna().copy()

print(f"Total rows: {len(penguins)} | After dropping NAs: {len(penguins_clean)}")
print(penguins_clean.describe().round(2))

# -------------------------------------------------------
# 4. Figure 1 — Violin plots: body mass by species and sex
# -------------------------------------------------------
fig, ax = plt.subplots(figsize=(9, 5))
sns.violinplot(
    data=penguins_clean,
    x="species", y="body_mass_g",
    hue="sex", split=True,
    palette={"male": "steelblue", "female": "tomato"},
    inner="quartile", linewidth=1.2,
    ax=ax,
)
ax.set_title("Body mass distribution by species and sex", fontsize=14)
ax.set_xlabel("Species")
ax.set_ylabel("Body mass (g)")
plt.tight_layout()
plt.show()

# -------------------------------------------------------
# 5. Figure 2 — Pair plot of all numeric morphometrics
# -------------------------------------------------------
numeric_cols = ["bill_length_mm", "bill_depth_mm", "flipper_length_mm", "body_mass_g"]
pair_data = penguins_clean[numeric_cols + ["species"]]

pg = sns.pairplot(
    pair_data,
    hue="species",
    palette=SPECIES_PALETTE,
    diag_kind="kde",
    plot_kws={"alpha": 0.6, "s": 30},
)
pg.figure.suptitle("Pairwise relationships — all morphometric variables", y=1.02, fontsize=13)
plt.show()

# -------------------------------------------------------
# 5. Figure 3 — Mean flipper length per species × island (bar + CI)
# -------------------------------------------------------
summary = (
    penguins_clean
    .groupby(["island", "species"])["flipper_length_mm"]
    .agg(["mean", "sem"])
    .reset_index()
    .rename(columns={"mean": "mean_flipper", "sem": "se_flipper"})
)

fig, ax = plt.subplots(figsize=(9, 5))
sns.barplot(
    data=penguins_clean,
    x="island", y="flipper_length_mm",
    hue="species",
    palette=SPECIES_PALETTE,
    errorbar="se", capsize=0.08,
    ax=ax,
)
ax.set_title("Mean flipper length by island and species (±SE)", fontsize=14)
ax.set_xlabel("Island")
ax.set_ylabel("Flipper length (mm)")
ax.legend(title="Species", loc="lower right")
plt.tight_layout()
plt.show()

# -------------------------------------------------------
# 6. Figure 4 — KDE + rug: bill length by species
# -------------------------------------------------------
fig, ax = plt.subplots(figsize=(9, 5))
for species, colour in SPECIES_PALETTE.items():
    subset = penguins_clean.loc[penguins_clean["species"] == species, "bill_length_mm"]
    sns.kdeplot(subset, ax=ax, label=species, color=colour, linewidth=2, fill=True, alpha=0.15)
    ax.plot(subset, [-0.002] * len(subset), "|", color=colour, alpha=0.5, markersize=8)

ax.set_title("Kernel density of bill length by species (with rug)", fontsize=14)
ax.set_xlabel("Bill length (mm)")
ax.set_ylabel("Density")
ax.legend(title="Species")
plt.tight_layout()
plt.show()

# -------------------------------------------------------
# 7. OLS regression: body mass ~ morphometrics + species
# -------------------------------------------------------
formula = "body_mass_g ~ flipper_length_mm + bill_length_mm + bill_depth_mm + C(species)"
model = smf.ols(formula, data=penguins_clean).fit()

print("\n" + "=" * 60)
print("OLS Regression: body mass ~ morphometrics + species")
print("=" * 60)
print(model.summary())
print(f"\nN = {int(model.nobs)}  |  Adj. R² = {model.rsquared_adj:.4f}  |  RMSE = {model.mse_resid**0.5:.1f} g")
```

## Quarto

- Create a new file `test-quarto.qmd` in the `ex00-positron-test` folder.
- Copy paste the following code in this file and press “Preview”.
- If you see the rendered HTML output, then Quarto is working correctly.

```` numberSource
---
title: "Exploring the Palmer Penguins Dataset"
author: "Test Notebook"
date: today
format:
  html:
    toc: true
    toc-depth: 3
    toc-title: "Contents"
    code-fold: true
    code-summary: "Show code"
    theme: cosmo
    highlight-style: github
    embed-resources: true
execute:
  warning: false
  message: false
---

## Overview

This notebook explores the [Palmer Penguins](https://allisonhorst.github.io/palmerpenguins/)
dataset — a modern alternative to the classic `iris` dataset — collected by Dr. Kristen Gorman
at the Palmer Station, Antarctica.

The dataset contains size measurements for **344 penguins** across three species
(*Adélie*, *Chinstrap*, and *Gentoo*) observed on three islands in the Palmer Archipelago.

::: {layout="[1,2,2]" layout-valign="center"}
![](https://allisonhorst.github.io/palmerpenguins/reference/figures/palmerpenguins.png){width=130 fig-alt="palmerpenguins hex sticker"}

![Meet the Palmer penguins — Adélie, Chinstrap and Gentoo](https://allisonhorst.github.io/palmerpenguins/reference/figures/lter_penguins.png){fig-alt="Illustration of the three penguin species: Adélie, Chinstrap and Gentoo"}

![Bill (culmen) length and depth measurements](https://allisonhorst.github.io/palmerpenguins/reference/figures/culmen_depth.png){fig-alt="Diagram showing how bill length and bill depth are measured on a penguin"}
:::

*Artwork by [\@allison_horst](https://www.allisonhorst.com/) — CC BY 4.0*

::: {.callout-note}
## Dataset Citation
Gorman KB, Williams TD, Fraser WR (2014). *Ecological sexual dimorphism and environmental
variability within a community of Antarctic penguins (genus Pygoscelis)*.
PLoS ONE 9(3):e90081.
:::

---

## Setup

We begin by verifying that all required packages are available, installing any that are
missing, and then loading them.


::: {.cell}

```{.r .cell-code  code-summary="Package management and library loading"}
required_pkgs <- c("tidyverse", "ggplot2", "palmerpenguins", "broom", "knitr")

missing_pkgs <- required_pkgs[!sapply(required_pkgs, requireNamespace, quietly = TRUE)]

if (length(missing_pkgs) > 0) {
  message("Installing: ", paste(missing_pkgs, collapse = ", "))
  install.packages(missing_pkgs, repos = "https://cloud.r-project.org")
}

library(tidyverse)
```

::: {.cell-output .cell-output-stderr}

```
── Attaching core tidyverse packages ──────────────────────── tidyverse 2.0.0 ──
✔ dplyr     1.1.4     ✔ readr     2.1.6
✔ forcats   1.0.1     ✔ stringr   1.6.0
✔ ggplot2   4.0.1     ✔ tibble    3.3.0
✔ lubridate 1.9.4     ✔ tidyr     1.3.2
✔ purrr     1.2.0     
── Conflicts ────────────────────────────────────────── tidyverse_conflicts() ──
✖ dplyr::filter() masks stats::filter()
✖ dplyr::lag()    masks stats::lag()
ℹ Use the conflicted package (<http://conflicted.r-lib.org/>) to force all conflicts to become errors
```


:::

```{.r .cell-code  code-summary="Package management and library loading"}
library(palmerpenguins)
```

::: {.cell-output .cell-output-stderr}

```

Attaching package: 'palmerpenguins'

The following objects are masked from 'package:datasets':

    penguins, penguins_raw
```


:::

```{.r .cell-code  code-summary="Package management and library loading"}
library(broom)
library(knitr)
```
:::


---

## Data

### Structure

The `penguins` data frame ships directly with the `palmerpenguins` package and is
ready to use after loading.


::: {#tbl-glimpse .cell tbl-cap='First six rows of the penguins dataset.'}

```{.r .cell-code}
kable(head(penguins))
```

::: {.cell-output-display}


|species |island    | bill_length_mm| bill_depth_mm| flipper_length_mm| body_mass_g|sex    | year|
|:-------|:---------|--------------:|-------------:|-----------------:|-----------:|:------|----:|
|Adelie  |Torgersen |           39.1|          18.7|               181|        3750|male   | 2007|
|Adelie  |Torgersen |           39.5|          17.4|               186|        3800|female | 2007|
|Adelie  |Torgersen |           40.3|          18.0|               195|        3250|female | 2007|
|Adelie  |Torgersen |             NA|            NA|                NA|          NA|NA     | 2007|
|Adelie  |Torgersen |           36.7|          19.3|               193|        3450|female | 2007|
|Adelie  |Torgersen |           39.3|          20.6|               190|        3650|male   | 2007|


:::
:::



::: {.cell}

```{.r .cell-code}
penguins_clean <- penguins |> drop_na()
```
:::


After removing 11 rows with missing values,
333 complete observations remain across
3 species and
3 islands.

### Summary statistics


::: {#tbl-summary .cell tbl-cap='Per-species summary of key morphometric variables.'}

```{.r .cell-code}
penguins_clean |>
  summarise(
    across(
      c(bill_length_mm, bill_depth_mm, flipper_length_mm, body_mass_g),
      list(mean = \(x) round(mean(x), 1), sd = \(x) round(sd(x), 1))
    ),
    .by = species
  ) |>
  kable()
```

::: {.cell-output-display}


|species   | bill_length_mm_mean| bill_length_mm_sd| bill_depth_mm_mean| bill_depth_mm_sd| flipper_length_mm_mean| flipper_length_mm_sd| body_mass_g_mean| body_mass_g_sd|
|:---------|-------------------:|-----------------:|------------------:|----------------:|----------------------:|--------------------:|----------------:|--------------:|
|Adelie    |                38.8|               2.7|               18.3|              1.2|                  190.1|                  6.5|           3706.2|          458.6|
|Gentoo    |                47.6|               3.1|               15.0|              1.0|                  217.2|                  6.6|           5092.4|          501.5|
|Chinstrap |                48.8|               3.3|               18.4|              1.1|                  195.8|                  7.1|           3733.1|          384.3|


:::
:::


::: {.callout-tip}
## Simpson's Paradox
The overall correlation between bill length and bill depth is *negative*, but
**positive within each species**. This is a textbook example of Simpson's Paradox —
a strong reason to always disaggregate by group before drawing conclusions.
:::

---

## Visualisations

### Bill Dimensions by Species {#sec-scatter}

@fig-scatter shows the relationship between bill length and bill depth stratified by
species, with per-species linear fits. The three species cluster distinctly,
illustrating that species is a strong predictor of morphology.


::: {.cell}

```{.r .cell-code}
ggplot(
  penguins_clean,
  aes(x = bill_length_mm, y = bill_depth_mm, colour = species, shape = species)
) +
  geom_point(alpha = 0.7, size = 2.5) +
  geom_smooth(method = "lm", se = FALSE, linewidth = 0.9) +
  scale_colour_manual(values = c("darkorange", "purple", "cyan4")) +
  scale_shape_manual(values = c(16, 17, 15)) +
  labs(
    title    = "Bill length vs. bill depth",
    subtitle = "Linear fit per species — note the within-group positive trend",
    x        = "Bill length (mm)",
    y        = "Bill depth (mm)",
    colour   = "Species", shape = "Species"
  ) +
  theme_minimal(base_size = 13)
```

::: {.cell-output .cell-output-stderr}

```
`geom_smooth()` using formula = 'y ~ x'
```


:::

::: {.cell-output-display}
![Bill length vs. bill depth coloured and fitted by species.](verify_files/figure-html/fig-scatter-1.png){#fig-scatter width=768}
:::
:::


### Flipper Length Distribution {#sec-hist}

The histogram in @fig-hist reveals that Gentoo penguins have notably longer flippers
than Adélie or Chinstrap penguins, hinting at their larger overall body size.


::: {.cell}

```{.r .cell-code}
ggplot(penguins_clean, aes(x = flipper_length_mm, fill = species)) +
  geom_histogram(alpha = 0.6, binwidth = 5, position = "identity", colour = "white") +
  scale_fill_manual(values = c("darkorange", "purple", "cyan4")) +
  labs(
    title = "Distribution of flipper length",
    x     = "Flipper length (mm)",
    y     = "Count",
    fill  = "Species"
  ) +
  theme_minimal(base_size = 13)
```

::: {.cell-output-display}
![Overlaid histogram of flipper length for each species.](verify_files/figure-html/fig-hist-1.png){#fig-hist width=768}
:::
:::


### Body Mass by Species and Sex {#sec-box}

@fig-box uses box plots to visualise body mass split by both species and sex.
Sexual dimorphism is most pronounced in Gentoo penguins, where males are
substantially heavier than females.


::: {.cell}

```{.r .cell-code}
ggplot(penguins_clean, aes(x = species, y = body_mass_g, fill = sex)) +
  geom_boxplot(alpha = 0.7, outlier.shape = 21, outlier.size = 2) +
  scale_fill_manual(values = c("steelblue", "tomato"), labels = c("Female", "Male")) +
  labs(
    title = "Body mass by species and sex",
    x     = "Species",
    y     = "Body mass (g)",
    fill  = "Sex"
  ) +
  theme_minimal(base_size = 13) +
  theme(legend.position = "top")
```

::: {.cell-output-display}
![Box plots of body mass grouped by species and sex.](verify_files/figure-html/fig-box-1.png){#fig-box width=768}
:::
:::


### Faceted Bill Dimensions by Island {#sec-facet}

The faceted plot in @fig-facet breaks the bill dimension scatter down by island.
The composition of species varies strikingly across islands — Biscoe hosts almost
exclusively Gentoo penguins, while Dream has a mix of Adélie and Chinstrap.


::: {.cell}

```{.r .cell-code}
ggplot(
  penguins_clean,
  aes(x = bill_length_mm, y = bill_depth_mm, colour = species, shape = species)
) +
  geom_point(alpha = 0.7, size = 2) +
  facet_wrap(~island, nrow = 1) +
  scale_colour_manual(values = c("darkorange", "purple", "cyan4")) +
  scale_shape_manual(values = c(16, 17, 15)) +
  labs(
    title    = "Bill dimensions faceted by island",
    subtitle = "Species composition differs markedly across islands",
    x        = "Bill length (mm)",
    y        = "Bill depth (mm)",
    colour   = "Species", shape = "Species"
  ) +
  theme_minimal(base_size = 12) +
  theme(
    panel.spacing = unit(1.2, "lines"),
    strip.text    = element_text(face = "bold", size = 12)
  )
```

::: {.cell-output-display}
![Bill length vs. depth faceted by island of observation.](verify_files/figure-html/fig-facet-1.png){#fig-facet width=1056}
:::
:::


---

## Regression Analysis {#sec-regression}

We fit an ordinary least squares model predicting **body mass** from flipper length,
bill dimensions, and species. This allows us to ask: *after controlling for species,
how much of the variation in body mass is explained by morphometric measurements?*

$$
\text{body mass}_i = \beta_0 + \beta_1\,\text{flipper} + \beta_2\,\text{bill length} + \beta_3\,\text{bill depth} + \beta_4\,\text{species} + \varepsilon_i
$$


::: {#tbl-model .cell tbl-cap='OLS regression results: body mass as outcome.'}

```{.r .cell-code}
model <- lm(
  body_mass_g ~ flipper_length_mm + bill_length_mm + bill_depth_mm + species,
  data = penguins_clean
)

tidy(model, conf.int = TRUE) |>
  mutate(across(where(is.numeric), \(x) round(x, 3))) |>
  rename(
    Term         = term,
    Estimate     = estimate,
    `Std. Error` = std.error,
    `t value`    = statistic,
    `p value`    = p.value,
    `CI Lower`   = conf.low,
    `CI Upper`   = conf.high
  ) |>
  kable()
```

::: {.cell-output-display}


|Term              |  Estimate| Std. Error| t value| p value|  CI Lower|  CI Upper|
|:-----------------|---------:|----------:|-------:|-------:|---------:|---------:|
|(Intercept)       | -4282.080|    497.832|  -8.601|       0| -5261.438| -3302.723|
|flipper_length_mm |    20.226|      3.135|   6.452|       0|    14.059|    26.394|
|bill_length_mm    |    39.718|      7.227|   5.496|       0|    25.501|    53.936|
|bill_depth_mm     |   141.771|     19.163|   7.398|       0|   104.072|   179.470|
|speciesChinstrap  |  -496.758|     82.469|  -6.024|       0|  -658.995|  -334.521|
|speciesGentoo     |   965.198|    141.770|   6.808|       0|   686.301|  1244.096|


:::
:::



::: {.cell}

:::


The model explains **84.7%** of the variance in body mass
(adjusted R² = 0.847), with a residual standard error of
315 g. Every additional millimetre of flipper length is associated with
roughly 20.2 g of additional body mass,
holding bill dimensions and species constant.

::: {.callout-important}
## Collinearity Note
Flipper length, bill dimensions, and species are correlated predictors. The individual
coefficient estimates should be interpreted cautiously — the model is best used
for overall prediction rather than inferring causal effects of individual measurements.
:::

---

## Summary

This notebook demonstrated a complete workflow with the Palmer Penguins dataset:

| Step | Output |
|------|--------|
| Package management | Installed and loaded `tidyverse`, `palmerpenguins`, `broom` |
| Data cleaning | Dropped 11 rows with NAs |
| Scatter plot | Bill length vs. depth with per-species fits (@fig-scatter) |
| Histogram | Flipper length distributions overlaid by species (@fig-hist) |
| Box plot | Body mass by species × sex (@fig-box) |
| Faceted scatter | Bill dimensions across islands (@fig-facet) |
| Regression | Body mass ~ morphometrics + species (Adj. R² ≈ 0.85) |
````
