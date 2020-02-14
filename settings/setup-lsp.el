
;; Setup lsp mode
;; -----------------------------------------
;; lsp-mode          | https://github.com/emacs-lsp/lsp-mode
;; lsp-ui            | https://github.com/emacs-lsp/lsp-ui

(use-package lsp-mode
  :diminish lsp-mode
  :hook (prog-mode . lsp)
  :commands lsp
  :config
  ;; Don't prompt the user for the project root every time we open a new
  ;; lsp-worthy file, instead, try to guess it with projectile.
  (setq lsp-auto-guess-root t)

  ;; Auto-kill LSP server once you've killed the last buffer associated with its
  ;; project.
  (setq lsp-keep-workspace-alive nil)

  (setq lsp-prefer-flymake nil)

  (setenv "TSSERVER_LOG_FILE" "/tmp/tsserver.log")
)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (setq lsp-ui-doc-max-height 8
        lsp-ui-doc-max-width 35
        lsp-ui-flycheck-entable t
        lsp-ui-sideline-ignore-duplicate t
        ;; Don't show symbol definitions in the sideline. They are pretty noisy,
        ;; and there is a bug preventing Flycheck errors from being shown (the
        ;; errors flash briefly and then disappear).
        lsp-ui-sideline-show-hover nil))



(provide 'setup-lsp)
