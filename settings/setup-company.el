
;; Setup company mode
;; -----------------------------------------
;; company-mode      | https://github.com/company-mode/company-mode 
;; company-quickhelp | https://github.com/expez/company-quickhelp
;; company-lsp       | https://github.com/tigersoldier/company-lsp
;; helm-company      | https://github.com/yasuyk/helm-company 
;; company-posframe  | https://github.com/tumashu/company-posframe


(use-package company
  :diminish company-mode
  :init
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 20)

  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case t)

  (setq company-dabbrev-code-ignore-case t)
  (setq company-dabbrev-code-everywhere t)

  (setq company-etags-ignore-case t) 

  (setq company-global-modes
        '(not
          eshell-mode comint-mode org-mode erc-mode))

  :config
  (defadvice company-complete-common (around advice-for-company-complete-common activate)
    (when (null (yas-expand))
      ad-do-it))

  (defun my-company-tab ()
    (interactive)
    (when (null (yas-expand))
      (company-select-next)))

  (add-hook 'after-init-hook 'global-company-mode))

(use-package company-quickhelp
  :after (company)
  :init (company-quickhelp-mode))

(use-package company-lsp
  :after (company lsp-mode)
  :init (push 'company-lsp company-backends))

;; (use-package helm-company)

(use-package company-posframe
  :init (company-posframe-mode 1))



(provide 'setup-company)
