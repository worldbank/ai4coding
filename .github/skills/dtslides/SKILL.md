---
name: dtslides
description: >
  Format and style Quarto RevealJS presentations using the dtslides extension.
  Use this skill whenever the user asks to change the appearance, layout, typography,
  colors, or styling of their Quarto slides — including adding CSS classes, adjusting
  font sizes, creating section dividers, formatting callouts, customizing SCSS variables,
  or applying any visual change to a .qmd presentation file. Also triggers for questions
  about slide types, emphasis spans, column layouts, code block display, or any dtslides
  feature. Always consult this skill before suggesting raw CSS or RevealJS hacks — the
  extension provides purpose-built classes that should be used first.
metadata:
  author: World Bank AI4Coding Course
  version: "1.0"
license: MIT
---

# dtslides Formatting Skill

Guide for formatting and styling Quarto RevealJS slides using the **dtslides** extension
(both Academic and UNM themes).

## Official References

All reference files are bundled in `references/`. Read the relevant file before answering — do not
guess syntax. GitHub links are provided for context.

| Local file | GitHub URL | What it covers |
|------------|-----------|----------------|
| `references/REFERENCE.md` | https://github.com/Data-Wise/dtslides/blob/main/REFERENCE.md | All user-facing CSS classes |
| `references/getting-started.qmd` | https://github.com/Data-Wise/dtslides/blob/main/getting-started.qmd | Installation, SCSS customisation, CSS specificity |
| `references/example.qmd` | https://github.com/Data-Wise/dtslides/blob/main/example.qmd | UNM theme feature showcase |
| `references/example-academic.qmd` | https://github.com/Data-Wise/dtslides/blob/main/example-academic.qmd | Academic theme full showcase |
| `references/example-long.qmd` | https://github.com/Data-Wise/dtslides/blob/main/example-long.qmd | Comprehensive layout & code demos |
| `references/example-refs.bib` | https://github.com/Data-Wise/dtslides/blob/main/example-refs.bib | Citation / bibliography usage |

When the user's request maps to a specific file above, **read it first** so your response matches
live, tested syntax.

---

## Decision Tree

1. **Changing how a slide looks overall** (dense content, scrollable, image-focused) → [Slide types](#slide-types)
2. **Inline text emphasis or colour** → [Emphasis spans](#emphasis-spans)
3. **Making text or a block larger / smaller** → [Font sizing](#font-sizing)
4. **Aligning content** → [Alignment](#alignment)
5. **Adding a callout box** → [Callouts](#callouts)
6. **Buttons or badges** → [Buttons and badges](#buttons-and-badges)
7. **Overriding fonts, colours, or spacing globally** → [SCSS customisation](#scss-customisation)
8. **Setting up the presentation for the first time** → [Setup](#setup)

---

## Setup

### Installing

```bash
quarto add Data-Wise/dtslides
```

Requires Quarto >= 1.6.0. Commit the `_extensions/` folder to version control.

### Choosing a theme

**Academic theme** — neutral navy/slate palette, suitable for any institution:
```yaml
format:
  dtslides-revealjs:
    slide-number: c/t
```

**UNM theme** — institutional branding:
```yaml
format:
  dtslides-unm-revealjs:
    slide-number: c/t
```

---

## Slide Types {#slide-types}

Apply as a class on the slide heading: `## Title {.class-name}`

| Class | Effect |
|-------|--------|
| `.small-slide` | Reduced font size — good for dense content |
| `.tiny-slide` | Even smaller — good for reference tables |
| `.quote-slide` | Centred text with styled blockquote |
| `.image-slide` | Minimal chrome, image-focused |
| `.section-slide` | Large centred heading — use on `#` level headings for section dividers |
| `.slide-code` | Optimised for code-heavy slides |
| `.large-image-slide` | Full-height image display (80vh max) |
| `.scrollable` | Enable vertical scrolling on the slide |

**Examples:**
```markdown
# Methods {.section-slide}

## Full Regression Output {.small-slide}

## Appendix Data {.tiny-slide}

## Long Content {.scrollable}
```

---

## Emphasis Spans {#emphasis-spans}

Inline markup: `[text]{.class}`

| Class | Effect |
|-------|--------|
| `.alert` | Bold, alert colour, tinted background |
| `.fg` | Bold, accent foreground colour |
| `.bg` | White text on accent background |
| `.highlight` | Yellow/gold highlighted text |
| `.note` | Italic, tinted background |
| `.warning` | Bold, warning colour, tinted background |

**Examples:**
```markdown
The result is [statistically significant]{.alert} with [p < 0.001]{.highlight}.

See the [important caveat]{.warning} before drawing conclusions.

Use [custom colour]{.fg style="--col: #e64173"} with an inline style override.
```

---

## Font Sizing {#font-sizing}

Apply to a slide heading or a `:::` div to scale all content inside:

| Class | Scale | Scales headings too |
|-------|-------|---------------------|
| `.largest` | 1.50× | Yes |
| `.larger` | 1.20× | Yes |
| `.large` | 1.25× | Yes |
| `.small` | 0.80× | Yes |
| `.smaller` | 0.64× | Yes |
| `.smallest` | 0.51× | Yes |

**Example — apply to a block:**
```markdown
::: {.small}
This entire block is smaller, including any code inside it.
:::
```

---

## Alignment {#alignment}

### Horizontal text

| Class | Effect |
|-------|--------|
| `.left` | Left-aligned |
| `.center` | Centred |
| `.right` | Right-aligned |

### Vertical (grid-based)

| Class | Effect |
|-------|--------|
| `.v-center` | Centred vertically |
| `.v-top` | Top-aligned |
| `.v-bottom` | Bottom-aligned |

---

## Callouts {#callouts}

### Custom callouts (dtslides-specific)

```markdown
::: {.callout-example}
Worked example content.
:::

::: {.callout-question}
A question to pose to the audience.
:::

::: {.callout-insight}
Key takeaway or insight.
:::
```

| Class | Label | Colour |
|-------|-------|--------|
| `.callout-example` | Example | Green (success) |
| `.callout-question` | Question | Primary (navy/cherry) |
| `.callout-insight` | Insight | Blue (info/turquoise) |

### Standard Quarto callouts

`.callout-note`, `.callout-warning`, `.callout-tip`, `.callout-important`, `.callout-caution`
are all automatically re-styled by dtslides.

---

## Buttons and Badges {#buttons-and-badges}

```markdown
[[Jump to Slide]{.button}](#target-id)

Version label: [v1.1.0]{.badge}   [New]{.badge-secondary}
```

| Class | Effect |
|-------|--------|
| `.button` | Accent-coloured link button with icon |
| `.badge` | Primary-coloured inline label |
| `.badge-primary` | Same as `.badge` |
| `.badge-secondary` | Lighter variant |

---

## Columns and Layouts

```markdown
::::: {.columns}
:::: {.column width="50%"}
Left content
::::
:::: {.column width="50%"}
Right content
::::
:::::
```

For **side-by-side code and output**, use the chunk option:
```r
#| output-location: column
```

For **tabsets**:
```markdown
::: {.panel-tabset}
### Tab 1
Content A
### Tab 2
Content B
:::
```

---

## Code Blocks

No classes needed — styling is applied automatically:

- Source code blocks: Fira Code font with syntax highlighting
- R console output: lighter background with an accent-coloured left border
- Side-by-side layout: use `output-location: column` in chunk options

---

## Tables

No classes needed. Tables get automatic styling:

- Striped alternating rows
- Uppercase header text
- No hover effect (keeps presentations clean)

---

## SCSS Customisation {#scss-customisation}

Quarto's YAML-level font options (`mainfont`, `fontsize`, `monofont`) are **silently ignored**
for RevealJS. All typography and colour overrides must go through SCSS.

### Workflow

1. Create `custom.scss` alongside your `.qmd` file
2. Reference it in the YAML front matter:

```yaml
format:
  dtslides-revealjs:
    theme: [custom.scss]
    slide-number: c/t
```

### Key SCSS variables

```scss
/*-- scss:defaults --*/

// --- Fonts ---
$font-family-sans-serif: "Georgia", serif;
$font-family-heading:    "Playfair Display", serif;
$font-family-monospace:  "JetBrains Mono", monospace;

// --- Sizes ---
$font-size-root:              36px;
$presentation-h2-font-size:   1.4em;
$code-block-font-size:        0.7em;

// --- Colours ---
$primary: #2C3E50;
$accent:  #E74C3C;

// --- Spacing ---
$line-height-body: 1.6;

// --- Code blocks ---
$code-block-bg: #f5f5f5;
```

The extension uses `!default` on all key variables, so your overrides take precedence.

### CSS specificity

When writing rule overrides, prefix with `.reveal` to win over RevealJS defaults:

```css
/* Headings */
.reveal h2 { color: #2C3E50; }

/* Quarto callouts */
.reveal div.callout-note { border-color: #007bff; }

/* List items */
.reveal .slide ul li { margin-bottom: 0.5em; }
```

---

## Citations and Bibliography

Add a `bibliography:` key and a reference section slide:

```yaml
---
bibliography: references.bib
---
```

```markdown
## References
::: {#refs}
:::
```

Inline citations: `@box1976` or `[@efron1993]`. See
[example-refs.bib](https://github.com/Data-Wise/dtslides/blob/main/example-refs.bib)
for the bib file format.

---

## Quick Patterns

### Dense content slide
```markdown
## Full Regression Output {.small-slide}
- Lots of output...
```

### Section divider
```markdown
# Methods {.section-slide}
```

### Emphasis in text
```markdown
The result is [statistically significant]{.alert} with [p < 0.001]{.highlight}.
```

### Font size for a block
```markdown
::: {.small}
This entire block is smaller, including any code inside it.
:::
```

### Cross-reference button
```markdown
## Results
[[See Methods]{.button}](#methods-slide)

## Methods {#methods-slide}
```

### Fragment / incremental reveal
```markdown
::: {.fragment}
1. First step
:::
::: {.fragment}
2. Second step
:::

::: {.incremental}
- auto-fragmented bullet 1
- auto-fragmented bullet 2
:::
```
````
