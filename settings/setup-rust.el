
;; Setup 

;; Other packages:
;;    rust-mode | https://github.com/rust-lang/rust-mode
;;    company-racer | https://github.com/emacs-pe/company-racer
;;    flycheck-rust | https://github.com/flycheck/flycheck-rust

(use-package rust-mode
  :mode "\\.rs\\'"
  :config
  ;; (use-package company-racer)
  (use-package flycheck-rust
    :init
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  
  (electric-indent-mode +1)

  (add-hook 'rust-mode-hook #'electric-operator-mode)

  (after-load 'smartparens
    (sp-local-pair 'rust-mode "'" nil :actions nil))

  )


(provide 'setup-rust)
