# zmath — Smart Math Typesetting Utilities for LaTeX

**zmath** provides a high-level, unified interface for advanced mathematical typesetting. It extends classical `amsmath`-style constructs with semantic, scalable, and mode-independent commands optimized for engineering, physics, and applied mathematics.

The package eliminates typographic boilerplate (such as manual `\left...\right` tuning, fine-grained kerning adjustments, and context-dependent script scaling) by implementing robust, deterministic rendering heuristics.

---

## 1. Key Core Features

### ✦ Unified Scaling & Scripts

- **`\zscale`**: Applies a consistent global scaling factor (configurable via package options) across constructs.
- **`\zscript`**: Manages up to four scripts simultaneously (pre/post-subscripts and superscripts) with automated scaling and predictable nesting.
- **`\zprime`**: Streamlines structural and visual handling of accent vs. superscript primes.

### ✦ Advanced Fraction System (`\zfrac`)

- Supports standard fractions (`\frac`), nice fractions (`\nicefrac`), and raw inline slash notation (`/`).
- **Intelligent Parsing**: Material wrapped in brackets `[x]` is automatically parenthesized using standard parentheses in text mode or dynamic `\left(\right)` delimiters in math mode.
- Safe for deep nesting and direct text-mode embedding.

### ✦ Evaluation Bar (`\zcond`)

- Typesets an "evaluated at" vertical condition bar with a unified sizing paradigm.
- **Syntax**: `\zcond****[expression]{condition}`
  - **No Expression**: Prints a standalone bar (e.g., `\zcond{x=0}` $\rightarrow$ $|_{x=0}$).
  - **With Expression**: Encloses the expression inside an auto-scaling `\left. ... \right|` pair.
  - **Manual Sizing**: Adding 1 to 4 stars explicitly overrides auto-scaling to enforce fixed bar heights (`\big`, `\Big`, `\bigg`, `\Bigg`) while shifting the subscript to standard size for optimal visual weight.

### ✦ Structured Integral System (`\zint`)

- Unifies single, multiple (clustered glyphs), and contour integrals via structural arguments rather than font-dependent strings.
- Decouples limit scaling, limits positioning (side vs. stacked), and style overrides (inline vs. display mode).
- Inserts automated invisible vertical struts in text mode to prevent stacked limits from disrupting ambient line spacing.

### ✦ Differential & Notation Utilities

- **`\zdiff`**: Semantic operators for plain differentials ($dx$) and multi-order derivatives using automatic `\frac` or `\nicefrac` routing.
- **`\zarg`**: Enforces visually tight, dynamically kerned, and scaled function arguments.
- **`\zvec` / `\zmat`**: Unified, mode-safe math underlining for vector and matrix tensors.
- **`\zpunct`**: Buffers equation-line punctuation to guarantee it scales perfectly and displays _before_ the math tag numbering structure.

---

## 2. Package Options

```latex
\usepackage[
  scale=0.6,                 % Global scaling factor for \zscale
  arg-scale=0.9,             % Font scaling factor for function arguments
  arg-kern=-1mu,             % Tight horizontal kerning for \zarg
  int-sep=-22mu,             % Display-mode spacing for clustered integrals
  int-sep-inline=-13mu,      % Inline-mode spacing for clustered integrals
  int-dots-left=-20mu,       % Spacing preceding ellipsis bridge in integrals
  int-dots-right=-10mu       % Spacing following ellipsis bridge in integrals
]{zmath}

```

---

## 3. Reference Examples

### Fractions & Scaling

```latex
\zfrac{a}{b}                     % Standard fraction
\zfrac[a]{b}                     % Parenthesized numerator: (a)/b
\zfrac**{1}[\zfrac[\mu]{\nu}]    % Slash notation with nested parenthesized parsing

```

### Integrals & Limits

```latex
\zint[a][b]                      % Single integral with side limits
\zint[a][b]*[2]                  % Double integral with stacked limits
\zint*[a][b][o]                  % Contour integral with scaled lower limit

```

### Condition Bars

```latex
\zcond{x=0}                      % Bare subscript condition bar
\zcond[f(x)]{x=0}                % Auto-scaled evaluation enclosure
\zcond*[\frac{df}{dx}]{x=0}      % \big| fixed-size manual override (bypasses zscale)

```

---

## 4. Environment & Dependencies

- **Engine Compatibility**: LaTeX2e (2020/10/01 or newer). Fully compatible with modern OpenType math workflows under `LuaLaTeX` and `XeLaTeX`.
- **Required Packages**: `amsmath`, `graphicx`, `unicode-math`, `nicefrac`, `accents`, `xkeyval`.

---

## 5. License

Licensed under the **LaTeX Project Public License (LPPL) 1.3c**.
