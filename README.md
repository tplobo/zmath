# zmath — smart math typesetting utilities for LaTeX

**zmath** bundles my math printing and rendering preferences as semantic,
configurable commands for engineering, physics and applied mathematics. It
replaces manual kerning, `\left...\right` tuning and style-dependent script
scaling: every distance is measured in the math style of the operand, so
commands look good in inline, display and exponents contexts. All tunable
parameters are package options, read at call time, so they can be changed
anywhere with `\setkeys{zmath}{key=value}`.

## Commands

- `\zint` — integrals: single, multiple, contour or bridged; slant, stacked or right-side limits
- `\zdiff` — differentials and derivatives
- `\zfrac` — fractions (`\frac`, `\nicefrac` or slash) with optional parentheses
- `\zscript` — up to four scripts around a nucleus
- `\zprime` — primes as superscript or accent
- `\zlim` — limit operator with variable and value
- `\zarg` — scaled function argument
- `\zcond` — "evaluated at" bar
- `\zdot` — heavier dot-product operator
- `\zscale` — style-aware scaling of math content
- `\zline`, `\zvec`, `\zmat` — stacked underlines for vectors and matrices
- `\zpunct` — punctuation at the end of a display line

```latex
\usepackage[zint-math-after=-0.3, zarg-kern=1mu]{zmath}
...
\zint[0][T] f\zarg{t}\zdiff+{t} = \zfrac[\beta+1] \zpunct{.}
```

## Requirements

LuaLaTeX or XeLaTeX (the package loads `unicode-math`), LaTeX kernel 2020-10-01
or newer, the packages `amsmath`, `graphicx`, `nicefrac` and `xkeyval`, and the
XITS Math font (used for the integral glyphs; `xits` in TeX Live).

## Installation

Install it from your TeX distribution (`tlmgr install zmath`), or copy
`zmath.sty` into your local TEXMF tree under `tex/latex/zmath/`
(`kpsewhich -var-value TEXMFHOME` prints its location), or simply next to your
document. Then load it with `\usepackage{zmath}`.

## Documentation

The manual is `zmath.pdf`. To rebuild it from `zmath.tex` (which needs
`zmath.sty` and `zmath-listings.tex`, plus the packages `tcolorbox`, `listings`,
`tikz`, `hypdoc` and a few common ones):

    lualatex zmath
    makeindex -s gind.ist zmath.idx
    lualatex zmath
    lualatex zmath

or run `l3build doc` in the repository. The `gind.ist` index style is required;
`-shell-escape` is not. With `latexmk`, add
`$makeindex = 'makeindex -s gind.ist %O -o %D %S';` to a `latexmkrc`.

## License

Copyright (C) 2020-2026 Tiago Pomella Lobo. Distributed and modified under the
LaTeX Project Public License, version 1.3c or later
(https://www.latex-project.org/lppl.txt). Maintenance status: author-maintained.

## Author and support

Tiago Pomella Lobo — https://github.com/tplobo/zmath (source, issues and
releases).
