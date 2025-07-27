
;; Setup js2-mode
;; https://github.com/mooz/js2-mode

;; Other packages:
;;    json-mode       | https://github.com/joshwnj/json-mode
;;    typescript-mode | https://github.com/emacs-typescript/typescript.el 
;;    svelte-mode     | https://github.com/leafOfTree/svelte-mode

(use-package json-mode)

(use-package svelte-mode
  :mode ("\\.svelte\\'" . svelte-mode))

(use-package typescript-mode
  :mode ("\\.tsx?\\'" . typescript-mode)
  :config
  (setq typescript-indent-level 2))

(use-package js
  :config
  (progn
    (require 'js2-imenu-extras)
    (js2-imenu-extras-setup)

    (electric-indent-mode +1)
    (add-hook 'js-mode #'electric-operator-mode)
    (add-hook 'js-mode-hook 'js2-minor-mode)

    (setq-default js2-global-externs '("module" "require" "assert" "refute"
                                       "setTimeout" "clearTimeout" "setInterval"
                                       "clearInterval" "location" "__dirname"
                                       "console" "JSON"))

    ;; Setup some custom syntax highlighting
    (defface js-instruction-separator
      '((t (:foreground "dim gray")))
      "Used in Javascript to end instructions.")

    (defface js-return-statement
      '((t (:foreground "#4fddea")))
      "Used in Javascript to return from a function.")

    (defvar js-extra-keywords
      '(
        (";$" 0 'js-instruction-separator prepend)
        ("\\_<\\(return\\)\\_>" 1 'js-return-statement prepend)
        ))

    (font-lock-add-keywords 'js2-mode js-extra-keywords)
    (font-lock-add-keywords 'rjsx-mode js-extra-keywords)

    (setq-default sgml-basic-offset 2)
    (setq-default js2-basic-offset 2)
    (setq-default js2-highlight-level 3)
    (setq-default js-switch-indent-offset 2)
    (setq js2-indent-switch-body t)

    ;; Preferend indentation
    (defun my-webmode-twospace ()
      (setq web-mode-markup-indent-offset 2)
      (setq web-mode-code-indent-offset 2)
      (setq web-mode-css-indent-offset 2))

    ;; js2-mode steals TAB, let's steal it back for yasnippet
    (defun js2-tab-properly ()
      (interactive)
      (let ((yas-fallback-behavior 'return-nil))
        (unless (yas-expand)
          (indent-for-tab-command)
          (if (looking-back "^\s*")
              (back-to-indentation)))))

    (define-key js-mode-map (kbd "TAB") 'js2-tab-properly)

    ;; Let flycheck handle parse errors
    (setq-default js2-show-parse-errors nil)
    (setq-default js2-mode-show-parse-errors nil)
    (setq-default js2-mode-show-strict-warnings nil)
    (setq-default js2-strict-cond-assign-warning nil)
    (setq-default js2-strict-missing-semi-warning nil)
    (setq-default js2-strict-trailing-comma-warning t) ;; jshint does not warn about this now for some reason

    (add-hook 'js2-mode-hook (lambda ()
                               (flycheck-mode 1)
                               (js2-imenu-extras-mode +1)
                               (setq mode-name "JS2")))
    
    ;; electric-layout-mode doesn't play nice with smartparens
    (setq-local electric-layout-rules '((?\; . after)))

    ))



(provide 'setup-js)
