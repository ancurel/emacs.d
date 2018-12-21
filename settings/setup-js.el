
;; Setup js2-mode
;; https://github.com/mooz/js2-mode

;; Other packages:
;;    json-mode    | https://github.com/joshwnj/json-mode
;;    rjsx-mode    | https://github.com/felipeochoa/rjsx-mode
;;    js2-refactor | https://github.com/magnars/js2-refactor.el
;;    tern         | https://github.com/marijnh/tern/tree/master/emacs
;;    company-tern | https://github.com/proofit404/company-tern

(use-package js2-mode
  :mode (("\\.js\\'" . js2-mode)
         ("\\.jsx\\'" . rjsx-mode))
  :config
  (progn
    (use-package json-mode)
    (use-package rjsx-mode)

    (require 'js2-imenu-extras)
    (js2-imenu-extras-setup)

    (setq-default js2-global-externs '("module" "require" "assert" "refute"
                                       "setTimeout" "clearTimeout" "setInterval"
                                       "clearInterval" "location" "__dirname"
                                       "console" "JSON"))

    ;; Setup some custom syntax highlighting
    (defface js2-instruction-separator
      '((t (:foreground "dim gray")))
      "Used in Javascript to end instructions.")

    (defface js2-return-statement
      '((t (:foreground "cyan")))
      "Used in Javascript to return from a function.")

    (defvar js2-extra-keywords
      '(
        ("\\(;\\)$" 0 'js2-instruction-separator append)
        ("\\(return\\)" 0 'js2-return-statement prepend)
        ))

    (font-lock-add-keywords 'js2-mode js2-extra-keywords)
    (font-lock-add-keywords 'js2-jsx-mode js2-extra-keywords)

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

    (define-key js2-mode-map (kbd "TAB") 'js2-tab-properly)

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

    ;; (use-package tern
    ;;   :init
    ;;   (progn
    ;;     (add-hook 'js-mode-hook 'tern-mode)

    ;;     (evil-leader/set-key-for-mode 'js2-mode "mrrV" 'tern-rename-variable)
    ;;     (evil-leader/set-key-for-mode 'js2-mode "mhd" 'tern-get-docs)
    ;;     (evil-leader/set-key-for-mode 'js2-mode "mgg" 'tern-find-definition)
    ;;     (evil-leader/set-key-for-mode 'js2-mode "mgG" 'tern-find-definition-by-name)
    ;;     (evil-leader/set-key-for-mode 'js2-mode (kbd "m C-g") 'tern-pop-find-definition)
    ;;     (evil-leader/set-key-for-mode 'js2-mode "mht" 'tern-get-type)

    ;;     (use-package company-tern
    ;;       :init (progn (add-to-list 'company-backends 'company-tern)))))

    ))


(use-package lsp-javascript-typescript
  :after (lsp-mode)
  :init
  (add-hook 'js-mode-hook #'lsp-javascript-typescript-enable)
  (add-hook 'typescript-mode-hook #'lsp-javascript-typescript-enable) ;; for typescript support
  (add-hook 'rjsx-mode #'lsp-javascript-typescript-enable)) ;; for rjsx-mode support



(provide 'setup-js)
