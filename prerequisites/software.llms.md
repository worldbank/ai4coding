# Software Setup

> **WARNING:**
>
> 1.  **Stata 19+ MP** installed and licensed
> 2.  **Positron** (latest version)
> 3.  **R** (4.5.3+)
> 4.  **Python** (3.13+) with **`uv`**
> 5.  **Quarto** (1.9+) and **Git** (2.52+)

> **Why?** This software stack powers the AI-assisted coding workflow used throughout the course.

**What you need to do:**

1.  Install seven tools: Stata, R, Python + `uv`, Positron, Quarto, and Git
2.  Verify each tool works correctly (see [Verification](#verification))
3.  Troubleshoot any issues (see [Common Problems](../prerequisites/common-problems.llms.md))

## Installation

## WB Laptop

1.  Restart your computer to ensure pending updates are applied.
2.  Open **Software Center** and install the items in [Table 1](#tbl-software) in order.
3.  If any program does not appear in the Software Center, submit a [Software Installation Request](https://worldbankgroup.service-now.com/wbg/en/software-installation-request?id=wbg_sc_catalog&sys_id=bd1e71b86f16d340db112d232e3ee4b7&table=sc_cat_item&searchTerm=Software%20installation) or contact <ITHelp@worldbankgroup.org>.

[![](../../assets/img/software-center.png)](../../assets/img/software-center.png)

## Private Laptop

Download and install each tool from the links in [Table 1](#tbl-software).

| Software | WB Laptop (Software Center) | Private Laptop |
|:--:|:--:|----|
| Stata (19+ MP) | [![](../../assets/img/sc-stata.png)](../../assets/img/sc-stata.png "Table 1: Software") |  |
| Positron (latest) | [![](../../assets/img/sc-positron.png)](../../assets/img/sc-positron.png "Table 1: Software") | [positron.posit.co](https://positron.posit.co/download.html) |
| Quarto (1.9+) | [![](../../assets/img/sc-quarto.png)](../../assets/img/sc-quarto.png "Table 1: Software") | [quarto.org](https://quarto.org/docs/get-started/) |
| R (4.5.3+) | [![](../../assets/img/sc-r.png)](../../assets/img/sc-r.png "Table 1: Software") | [cran.r-project.org](https://cran.r-project.org/) |
| Python (3.13+) | [![](../../assets/img/sc-python.png)](../../assets/img/sc-python.png "Table 1: Software") | [python.org](https://www.python.org/downloads/) |
| `uv` Python package manager | See below. | See below. |
| Git (2.52+) | [![](../../assets/img/sc-git.png)](../../assets/img/sc-git.png "Table 1: Software") | [git-scm.com](https://git-scm.com/download/win) |

Table 1: Software

**Install `uv` (Python package manager)**

## Instructions

1.  Open PowerShell (press `Windows` key, type `PowerShell`, and open it).
2.  Run:

``` ps
pip install uv
uv --version
```

You should see a version number printed. If not, see [Common Problems](../prerequisites/common-problems.llms.md).

### Video guide

[![](../../assets/img/uv-working.gif)](../../assets/img/uv-working.gif)

> **NOTE:**
>
> **If any software was previously installed from the Software Center:**
>
> Press “**Install**” and each eligible package will update to the latest version.

> **WARNING:**
>
> **If any software was previously installed manually (by using an admin password):**
>
> Contact <ITHelp@worldbankgroup.org> to remove it first.

## Verification

## Positron

Open **Positron** — if it launches, it’s working. See [Positron Overview](https://positron.posit.co/layout.html#basic-overview) for a tour of the layout.

[![Positron layout](../../assets/img/ui-positron.jpeg)](../../assets/img/ui-positron.jpeg "Positron layout")

Positron layout

## R

In Positron, open the **Console** (`Ctrl+Shift+P` → “Console: Focus on Console”). You should see an R prompt.

[![](../../assets/img/R-working.gif)](../../assets/img/R-working.gif)

## Python

In Positron, open the **Terminal** (`` Ctrl+Shift+` ``) and run:

``` ps
python --version
pip list
```

You should see the Python version and a list of installed packages.

[![](../../assets/img/python-working.gif)](../../assets/img/python-working.gif)

## `uv`

In the Terminal, run:

``` ps
uv --version
```

You should see a version number.

[![](../../assets/img/uv-working.gif)](../../assets/img/uv-working.gif)

## Quarto

In the Terminal, run:

``` ps
quarto --version
quarto check
```

You should see a version number and a passing check.

[![](../../assets/img/quarto-working.gif)](../../assets/img/quarto-working.gif)

## Licences

| Tool | Licence |
|----|----|
| Stata | [Commercial](https://www.stata.com/order/license-options/) |
| R | [Free and Open Source](https://www.r-project.org/Licenses/) |
| Python | [Free and Open Source](https://docs.python.org/3/license.html) |
| Positron | [Elastic License 2.0 - Source code available, built by Posit](https://positron.posit.co/licensing.html) |
| Quarto | [MIT - Free and open source, built by Posit](https://github.com/quarto-dev/quarto-cli/blob/main/COPYING.md) |
| Git | [Free and Open Source](https://git-scm.com/about) |
| Stata MCP extension | [MIT - Free, open source](https://github.com/hanlulong/stata-mcp/blob/main/LICENSE) |
| Positron Stata extension | [Not-clear…](https://github.com/ntluong95/positron-stata/blob/main/LICENSE) |

Back to top
