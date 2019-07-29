
;; Setup 

;; Other packages:
;;    rust-mode | https://github.com/rust-lang/rust-mode
;;    company-racer | https://github.com/emacs-pe/company-racer
;;    flycheck-rust | https://github.com/flycheck/flycheck-rust

(use-package rust-mode
  :init
  (require 'rust-mode)
  (add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))
  
  :config
  ;; (use-package company-racer)
  (use-package flycheck-rust
    :init
    (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  
  (after-load 'smartparens
    (sp-local-pair 'rust-mode "'" nil :actions nil))

  )


(provide 'setup-rust)
