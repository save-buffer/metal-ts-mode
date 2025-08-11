# Tree-sitter-based Major Mode for Metal Shading Language
Uses a custom tree-sitter parser to parse, and uses a mode derived from c++-mode for 
syntax highlighting. Unfortunately I have not figured out how to add extra keywords to be
highlighted, so `constant`, `device`, etc. do not get highlighted. If you know how to do that
please help!

## Installation
Simply add this to your emacs init file. 
```lisp
(use-package metal-ts-mode
  :commands metal-ts-mode
  :vc (:url "https://github.com/save-buffer/metal-ts-mode"
            :rev :newest))

```
