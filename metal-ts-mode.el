(unless (assoc 'metal treesit-language-source-alist)
  (add-to-list 'treesit-language-source-alist
               '(metal "https://github.com/save-buffer/tree-sitter-metal" "master")))

(defvar metal-ts-font-lock-rules
  (treesit-font-lock-rules
   :language 'metal
   :feature 'metal-keywords
   :override t
   '(;; Address space qualifiers
     (["device" "constant" "threadgroup" "threadgroup_imageblock"] @font-lock-type-face)
     ;; Function type keywords
     (["vertex" "fragment" "kernel"] @font-lock-function-name-face)
     ;; Metal-specific types and qualifiers
     (["half" "half2" "half3" "half4"
       "float2" "float3" "float4"
       "int2" "int3" "int4"
       "uint2" "uint3" "uint4"
       "texture2d" "texture3d" "texturecube"
       "sampler" "depth2d"
       "buffer" "atomic_int" "atomic_uint"
       "packed_float3" "packed_half3"] @font-lock-type-face)
     ;; Shader attributes
     (["[[vertex_id]]" "[[instance_id]]" "[[position]]"
       "[[point_size]]" "[[front_facing]]" "[[sample_id]]"
       "[[color]]" "[[depth]]" "[[stage_in]]"
       "[[texture]]" "[[sampler]]" "[[buffer]]"] @font-lock-preprocessor-face)))

  "Tree-sitter font-lock settings for Metal mode.")

;;;###autoload
(define-derived-mode metal-ts-mode c++-mode "Metal"
  "Major mode for Metal Shading Language with tree-sitter"
  :group 'metal

  (when (treesit-ready-p 'metal)
    (treesit-parser-create 'metal)
    
    ;; Set up custom font-lock rules for Metal keywords
    (setq-local treesit-font-lock-settings
                (append treesit-font-lock-settings metal-ts-font-lock-rules))
    (setq-local treesit-font-lock-feature-list
                '((comment definition)
                  (keyword string type)
                  (assignment builtin constant escape-sequence
                             label number operator preprocessor property variable)
                  (bracket delimiter error function metal-keywords)))
    
    (treesit-major-mode-setup)))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.metal\\'" . metal-ts-mode))

(provide 'metal-ts-mode)
;;; metal-ts-mode.el ends here
