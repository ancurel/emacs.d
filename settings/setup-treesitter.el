
;; Packages:
;;    treesitter      | https://github.com/ubolonton/emacs-tree-sitter 

;; (use-package tree-sitter
;;   :hook (
;;          ;; JS/CSS causes problems with web-mode
;;          ;; (css-mode . tree-sitter-hl-mode)
;;          ;; (js-mode . tree-sitter-hl-mode)
;;          (typescript-mode . tree-sitter-hl-mode)
;;          (python-mode . tree-sitter-hl-mode)
;;          (rust-mode . tree-sitter-hl-mode)
;;          )
;;   )

;; (use-package tree-sitter-langs)

(setq treesit-language-source-alist
   '((bash "https://github.com/tree-sitter/tree-sitter-bash")
     (cmake "https://github.com/uyha/tree-sitter-cmake")
     (css "https://github.com/tree-sitter/tree-sitter-css")
     (elisp "https://github.com/Wilfred/tree-sitter-elisp")
     (go "https://github.com/tree-sitter/tree-sitter-go")
     (html "https://github.com/tree-sitter/tree-sitter-html")
     (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
     (json "https://github.com/tree-sitter/tree-sitter-json")
     (make "https://github.com/alemuller/tree-sitter-make")
     (markdown "https://github.com/ikatyang/tree-sitter-markdown")
     (python "https://github.com/tree-sitter/tree-sitter-python")
     (toml "https://github.com/tree-sitter/tree-sitter-toml")
     (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
     (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
     (yaml "https://github.com/ikatyang/tree-sitter-yaml")))



(provide 'setup-treesitter)
