
;; Setup smartparens
;; -- https://github.com/Fuco1/smartparens

(defun my-create-newline-and-enter-sexp (id action context)
  "Open a new brace or bracket expression, with relevant newlines and indent. "
  (newline)
  (indent-according-to-mode)
  (forward-line -1)
  (indent-according-to-mode))


(use-package smartparens
  :diminish smartparens-mode
  :config
  (progn 
    ;; Smartparen setup
    (require 'smartparens-config)

    (setq sp-autoescape-string-quote nil)
    (setq sp-highlight-pair-overlay nil)
    (--each '(css-mode-hook
              scss-mode-hook
              js-mode-hook
              php-mode-hook
              markdown-mode
              restclient-mode-hook)
      (add-hook it 'turn-on-smartparens-mode))

    (sp-with-modes '(js2-mode
                     js2-jsx-mode
                     rjsx-mode
                     css-mode
                     scss-mode)
      (sp-local-pair  "{" "}" :post-handlers '((my-create-newline-and-enter-sexp newline-and-indent))))

    (sp-with-modes '(js2-mode js2-jsx-mode rjsx-mode) 
      (sp-local-pair "[" "]" :post-handlers '((my-create-newline-and-enter-sexp newline-and-indent))))

    (sp-with-modes '(js2-mode js2-jsx-mode rjsx-mode) 
      (sp-local-pair "(" ")" :post-handlers '((my-create-newline-and-enter-sexp newline-and-indent))))
    ))



(provide 'setup-smartparens)
