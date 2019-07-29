
;; Setup lsp mode
;; -----------------------------------------
;; lsp-mode          | https://github.com/emacs-lsp/lsp-mode
;; lsp-ui            | https://github.com/emacs-lsp/lsp-ui

(use-package lsp-mode
  :diminish lsp-mode
  :hook (prog-mode . lsp)
  :commands lsp)

(use-package lsp-ui
  :commands lsp-ui-mode)
  


(provide 'setup-lsp)
