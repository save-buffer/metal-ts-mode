# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a simple Emacs Lisp package that provides a tree-sitter-based major mode for Metal Shading Language files. The project consists of only two files:

- `metal-ts-mode.el` - The main Emacs Lisp package file
- `README.md` - Documentation with installation instructions

## Architecture

The mode is implemented as a derived mode from `c++-mode` that integrates with Emacs tree-sitter functionality:

1. **Tree-sitter Integration**: Uses a custom tree-sitter parser from https://github.com/save-buffer/tree-sitter-metal
2. **Mode Definition**: `metal-ts-mode` derives from `c++-mode` for basic syntax highlighting
3. **File Association**: Automatically associates `.metal` files with the mode via `auto-mode-alist`

## Key Components

- `metal-ts-mode.el:1-3` - Configures tree-sitter language source for Metal parser
- `metal-ts-mode.el:7-13` - Defines the derived mode with tree-sitter setup
- `metal-ts-mode.el:16` - Associates `.metal` file extension with the mode

## Development Notes

- This is a pure Emacs Lisp package with no build system, tests, or dependencies beyond Emacs tree-sitter
- The main limitation noted in README is that Metal-specific keywords like `constant`, `device` are not highlighted
- Installation is via Emacs package managers using the GitHub repository URL

## No Build Commands

This package requires no compilation or build steps - it's installed directly as Emacs Lisp source code.