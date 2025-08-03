# Tree-sitter-based Major Mode for Metal Shading Language
Uses a custom tree-sitter parser to parse, and uses a mode derived from c++-mode for 
syntax highlighting. The mode includes custom highlighting for Metal-specific keywords like 
`constant`, `device`, `vertex`, `fragment`, and Metal data types.

## Installation
Simply add this to your emacs init file. 
```lisp
(use-package metal-ts-mode
  :commands metal-ts-mode
  :vc (:url "https://github.com/save-buffer/metal-ts-mode"
            :rev :newest))

```
