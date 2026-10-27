# The Next Generation of Diagnostic Tools for Astrophysical Turbulence

LaTeX source for the Ph.D. dissertation of Trung Ha, Department of Astronomy,
University of Massachusetts Amherst (September 2026). Advisor: Yuan Li.

## Contents

| Path | Description |
|---|---|
| `MAIN.tex` | Top-level document: metadata, macros, dedication, acknowledgements, abstract |
| `FrontMatter.tex` | Title, copyright, signature, and table-of-contents pages |
| `Chapter1.tex` – `Chapter5.tex` | Introduction, stellar kinematics, plasma turbulence, SMBH accretion, outlook |
| `*_img/` | Figures for each chapter |
| `references.bib` | Bibliography (only entries cited in the text) |
| `UMassDissAN.cls` | UMass Amherst dissertation class (author-note variant) |
| `aasjournal.bst` | AAS journal bibliography style |

## Building

Requires a TeX Live distribution with XeLaTeX and `latexmk` (the class uses `fontspec`):

```sh
latexmk -xelatex MAIN.tex
```

## Related software

The current-sheet identification method in Chapter 3 is implemented in the
open-source package [aweSOM](https://github.com/tvh0021/aweSOM).

## Official version

The complete dissertation is available through the University of
Massachusetts Amherst ScholarWorks repository.
