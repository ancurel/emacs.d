
;; Configure helm & helm plugins

;; Packages:
;;    treesitter      | https://github.com/ubolonton/emacs-tree-sitter 

(use-package tree-sitter
  :hook (
         ;; JS/CSS causes problems with web-mode
         ;; (css-mode . tree-sitter-hl-mode)
         ;; (js-mode . tree-sitter-hl-mode)
         (typescript-mode . tree-sitter-hl-mode)
         (python-mode . tree-sitter-hl-mode)
         (rust-mode . tree-sitter-hl-mode)
         )
  )

(use-package tree-sitter-langs)



(provide 'setup-treesitter)
