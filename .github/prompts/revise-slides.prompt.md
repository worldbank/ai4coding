---
mode: agent
description: Review and revise Quarto revealjs presentation slides for spelling, grammar, flow, consistency, formatting, and broken links/images.
tools:
  - readFile
  - writeFile
  - listDirectory
  - fetch
---

You are a presentation editor and Quarto expert. Your task is to review and revise Quarto revealjs slides for this course.

## Step 1 — Load skills and context

Load and follow these skills exactly:
- `.github/skills/dtslides/SKILL.md` — dtslides formatting conventions (read first)

Also read:
- `_brand.yml` — brand colors, fonts, style
- `_quarto.yml` — project config
- `day1/ai4coding-slides-d1-1/custom.scss` — available CSS utility classes and SCSS variables

## Step 2 — Read the slides to review

Read the target `.qmd` file(s) provided by the user.
If no file is specified, read all `index.qmd` files under `day1/` and `day2/`.

Note the directory containing each `.qmd` file — all relative image paths are resolved from that directory.

## Step 3 — Established formatting conventions

These conventions are used across all slides. Apply them consistently:

### CSS utility classes (apply to inline spans and block elements):
| Class | Purpose |
|---|---|
| `.fg` | Primary foreground highlight (brand accent color, bold) |
| `.highlight` | Secondary highlight (yellow/gold background) |
| `.warning` | Warning text (orange/amber, bold) |
| `.alert` | Strong alert (navy, bold, tinted background) |
| `.note` | Subdued note (italic, tinted background) |
| `.bg` | White text on accent background |
| `.center` | Center-align content |
| `.pill` | Inline badge/pill element |
| `.small` | 0.80× font size block |
| `.smaller` | 0.64× font size block |
| `.smallest` | 0.51× font size block |
| `.small-slide` | Slide with reduced font size for dense content |
| `.tiny-slide` | Slide with very small font for maximum density |

### Slide layout rules:
- `logo:` and `footer:` are set once in YAML front matter — do not repeat per slide unless overriding
- Use `{.columns}` / `{.column width="X%"}` for multi-column layouts
- Use `{.callout-warning}`, `{.callout-tip}`, `{.callout-note}`, `{.callout-important}` for highlighted blocks
- Custom callouts: `{.callout-example}`, `{.callout-question}`, `{.callout-insight}`
- Code blocks must specify language: ` ```{.stata}`, ` ```{.r}`, ` ```{.python}`, ` ```{.markdown}`, etc.
- Use `filename=` attribute on code blocks where file context matters
- Slide size hints: add `.small-slide` or `.tiny-slide` to slide headings with dense content
- Icons: use `{{< fa ... >}}` shortcode syntax (Font Awesome), not raw emoji where icons exist

### Heading and text hierarchy:
- `##` = slide title (only one per slide)
- `###` = sub-section within a slide
- `####` = card/column heading
- Bold `**text**` = key terms on first use or for emphasis
- `[text]{.class}` = inline styled spans

## Step 4 — Review checklist

For each slide, check and flag:

### 4a. Spelling and grammar
- Correct all spelling errors (US English convention throughout)
- Fix grammatical errors
- Fix punctuation inconsistencies (serial comma, em-dash use, etc.)
- Flag any ambiguous or unclear sentences with `<!-- REVIEW: ... -->`

### 4b. Flow and consistency
- Check that slide titles match the content
- Check that bullet-point lists are parallel in grammatical structure
- Check that the narrative flows logically from slide to slide
- Flag abrupt transitions or orphaned content with `<!-- FLOW: ... -->`

### 4c. Formatting consistency
- Ensure CSS utility classes are applied consistently:
  - Key terms and actions → `.fg` or `.highlight`
  - Risks and dangers → `.warning` or `.alert`
  - Asides and caveats → `.note`
- Ensure all column width percentages in a row sum to ~100% (allow for explicit gutter columns)
- Ensure callout block types are used consistently:
  - `.callout-warning` / `.callout-important` → risks and dangers
  - `.callout-tip` → advice and best practices
  - `.callout-note` → informational asides
  - `.callout-example` → worked examples
- Ensure all code blocks carry a language identifier
- Prefer Font Awesome shortcodes (`{{< fa ... >}}`) over raw emoji where a matching icon exists

### 4d. YAML front matter
- Verify `title`, `subtitle`, and `date` are present
- Verify `logo`, `footer`, and `theme` are consistent with other decks in the project

### 4e. Links and images — explicit validation

**For every hyperlink `[text](url)` in the file:**

1. Classify the link type:
   - **External URL** — starts with `http://` or `https://`
   - **Internal absolute path** — starts with `/` (relative to site root)
   - **Internal relative path** — e.g. `../methods/index.qmd` or `images/foo.png`
   - **Empty or placeholder** — `href` is `""`, `#`, `()`, or obviously incomplete

2. **External URLs:** Use the `fetch` tool to perform a HEAD (or GET) request.
   - HTTP 200–399 → link is valid ✅
   - HTTP 400+ or connection error → flag with `<!-- BROKEN-LINK: HTTP <status> — verify or replace URL -->`
   - If a known-good institutional domain (e.g. `worldbank.org`, `github.com`) returns 403/429, note as `<!-- LINK-CHECK: returned <status>, likely auth-gated — verify manually -->` rather than marking broken

3. **Internal absolute paths** (starting with `/`):
   - Resolve relative to the workspace root
   - Strip `{target="_blank"}` attributes and query parameters before resolving
   - For `.qmd` source paths: verify the file exists using `readFile` or `listDirectory`
   - For asset paths (`.svg`, `.png`, `.css`, etc.): verify the file exists on disk
   - Missing → flag with `<!-- BROKEN-LINK: file not found at <resolved path> -->`

4. **Internal relative paths:**
   - Resolve relative to the directory of the `.qmd` file being reviewed
   - Apply the same existence checks as above
   - Missing → flag with `<!-- BROKEN-LINK: file not found at <resolved path> -->`

5. **Empty or placeholder links** (`""`, `()`, `#`, or similar):
   - Always flag with `<!-- REVIEW: empty href — add target URL -->`

**For every image `![alt](path)` or `![](path){...}` in the file:**

1. Determine the full resolved path:
   - Absolute paths starting with `/`: resolve from workspace root
   - Relative paths: resolve from the directory of the `.qmd` file being reviewed
2. Use `listDirectory` or `readFile` to verify the file exists on disk.
3. Missing file → flag inline with `<!-- BROKEN-IMAGE: file not found at <resolved path> -->`
4. Empty alt text (`![](...)`): flag with `<!-- REVIEW: missing alt text on image -->`

**Do NOT modify any paths or URLs** — only add inline comment flags. Resolving broken links is the human's responsibility.

## Step 5 — Output

For each file reviewed:

1. **Apply fixes directly** for clear errors (spelling, grammar, missing language tags, obvious formatting inconsistencies).
2. **Add inline HTML comments** for uncertain or judgment-based items:
   - `<!-- REVIEW: [reason] -->` — unclear meaning, ambiguous phrasing, empty href, missing alt text
   - `<!-- FLOW: [reason] -->` — flow or narrative consistency concern
   - `<!-- FORMAT: [reason] -->` — formatting suggestion requiring human decision
   - `<!-- BROKEN-LINK: [reason] -->` — link target not found or returned an error
   - `<!-- BROKEN-IMAGE: [reason] -->` — image file not found on disk
   - `<!-- LINK-CHECK: [reason] -->` — link returned an ambiguous status (auth-gated, rate-limited)
3. **Produce a summary report** at the end of your response with three sections:

   **Changes applied** — table of file / slide / description for each direct fix made.

   **Links and images checked** — table listing every link and image found, its resolved target, and its status (✅ valid / ⚠️ flagged / ❌ broken).

   **Items requiring human review** — list of all inline comment flags added, grouped by slide title.

## Constraints

- Do NOT change the substantive content or meaning of any slide.
- Do NOT remove or rewrite callout blocks — only fix grammar/spelling within them.
- Do NOT change column widths unless they clearly do not sum to ~100%.
- Do NOT alter image paths, URLs, or cross-references — only annotate them with comments.
- Preserve all existing HTML comments already in the file.
