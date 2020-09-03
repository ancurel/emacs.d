
;; Configure helm & helm plugins

;; Packages:
;;    treesitter      | https://github.com/ubolonton/emacs-tree-sitter 

(use-package tree-sitter
  :pin ublt
  :config
  (global-tree-sitter-mode)
)

(use-package tree-sitter-langs
  :pin ublt)



(provide 'setup-treesitter)
