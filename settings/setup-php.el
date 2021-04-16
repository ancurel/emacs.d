
;; Setup php-mode
;; https://github.com/ejmr/php-mode


(use-package php-mode
  :pin melpa
  :mode ("\\.php\\'" . php-mode);
  :config
  (require 'newcomment)

  ;; Custom php syntax highlighting
  (defface php-variable-identifier
    '((t (:foreground "cyan1")))
    "Used in PHP before variable names.")

  (defface php-object-arrow
    '((t (:foreground "red1")))
    "Used in PHP to call object properties.")

  (defface php-instruction-separator
    '((t (:foreground "dim gray")))
    "Used in PHP to end instructions.")

  (defface php-return-statement
    '((t (:foreground "cyan")))
    "Used in PHP to return from a function.")

  (defface php-this-variable
    '((t (:foreground "light sky blue")))
    "Used in PHP to highlight $this object.")

  (defvar php-extra-keywords
    '(
      ("\\(\\$\\)\\(\\sw+\\)" 1 'php-variable-identifier) 
      ("\\(->\\)" 0 'php-object-arrow prepend)
      ("\\(;\\)$" 0 'php-instruction-separator)
      ("\\(die\\)" 0 'error)
      ("\\(var_dump\\)" 0 'error)
      ("\\(return\\)" 0 'php-return-statement)
      ("\\$\\(this\\|that\\)" 1 'php-this-variable)
      ))

  (font-lock-add-keywords 'php-mode php-extra-keywords)

  (setq comment-auto-fill-only-comments 1)
  (setq auto-fill-function 'do-auto-fill)
  (setq flycheck-disabled-checkers '(php-phpmd))

  (turn-on-eldoc-mode)
  (electric-operator-mode)

  (turn-on-auto-fill)
  (set-fill-column 120)
  (add-to-list 'write-file-functions 'delete-trailing-whitespace)
  (flycheck-mode))



(provide 'setup-php)
