(unless (assoc 'metal treesit-language-source-alist)
  (add-to-list 'treesit-language-source-alist
               '(metal "https://github.com/save-buffer/tree-sitter-metal" "master")))

;; Define Metal-specific keywords for font-lock
(defvar metal-font-lock-keywords
  '(;; Address space qualifiers
    ("\\<\\(device\\|constant\\|threadgroup\\|threadgroup_imageblock\\)\\>" . font-lock-keyword-face)
    ;; Function type keywords
    ("\\<\\(vertex\\|fragment\\|kernel\\)\\>" . font-lock-keyword-face)
    ;; Metal-specific types
    ("\\<\\(half[2-4]?\\|float[2-4]\\|int[2-4]\\|uint[2-4]\\|texture2d\\|texture3d\\|texturecube\\|sampler\\|depth2d\\|buffer\\|atomic_\\(int\\|uint\\)\\|packed_\\(float3\\|half3\\)\\)\\>" . font-lock-type-face)
    ;; Shader attributes (simplified - matching double brackets with content)
    ("\\[\\[\\(vertex_id\\|instance_id\\|position\\|point_size\\|front_facing\\|sample_id\\|color\\|depth\\|stage_in\\|texture\\|sampler\\|buffer\\|thread_position_in_grid\\|threads_per_grid)\\]\\]" . font-lock-preprocessor-face))
  "Font-lock keywords for Metal Shading Language.")

;;;###autoload
(define-derived-mode metal-ts-mode c++-mode "Metal"
  "Major mode for Metal Shading Language with tree-sitter"
  :group 'metal

  ;; Add Metal-specific font-lock keywords to the existing C++ ones
  (font-lock-add-keywords nil metal-font-lock-keywords)

  (when (treesit-ready-p 'metal)
    (treesit-parser-create 'metal)
    (treesit-major-mode-setup)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.metal\\'" . metal-ts-mode))

(provide 'metal-ts-mode)
;;; metal-ts-mode.el ends here
