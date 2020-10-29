
;; Setup 

;; Other packages:
;;    rustic | https://github.com/brotzeit/rustic 
;;    company-racer | https://github.com/emacs-pe/company-racer
;;    flycheck-rust | https://github.com/flycheck/flycheck-rust

(use-package rustic
  :mode "\\.rs\\'"
  :config
  ;; (use-package flycheck-rust
  ;;   :init
  ;;   (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
  
  (add-hook 'rust-mode-hook #'electric-operator-mode)
  
  (after-load 'smartparens
    (sp-local-pair 'rust-mode "'" nil :actions nil))

  (electric-indent-mode +1)
  (electric-operator-mode +1)
  )


(provide 'setup-rust)
