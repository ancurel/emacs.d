
;; Setup smartparens
;; -- https://github.com/Fuco1/smartparens


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
              typescript-mode-hook
              php-mode-hook
              markdown-mode
              rust-mode
              restclient-mode-hook)
      (add-hook it 'turn-on-smartparens-mode))

    ))



(provide 'setup-smartparens)
