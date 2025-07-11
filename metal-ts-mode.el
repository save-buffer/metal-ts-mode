(unless (assoc 'metal treesit-language-source-alist)
  (add-to-list 'treesit-language-source-alist
               '(metal "https://github.com/save-buffer/tree-sitter-metal" "master")))


;;;###autoload
(define-derived-mode metal-ts-mode c++-mode "Metal"
  "Major mode for Metal Shading Language with tree-sitter"
  :group 'metal

  (when (treesit-ready-p 'metal)
    (treesit-parser-create 'metal)
    (treesit-major-mode-setup)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.metal\\'" . metal-ts-mode))

(provide 'metal-ts-mode)
;;; metal-ts-mode.el ends here
