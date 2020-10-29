
;; Setup python 
;; -----------------------------------------
;; elpy | https://github.com/jorgenschaefer/elpy 
;; lsp-pyright | https://emacs-lsp.github.io/lsp-pyright/


;; (use-package elpy
;;   :mode "\\.py\\'"
;;   :config
;;   (elpy-enable)
;;   (defalias 'workon 'pyvenv-workon)

;;   (setq elpy-rpc-backend "jedi")
;;   (when (executable-find "ipython") 
;;     (setq python-shell-interpreter "ipython"
;;           python-shell-interpreter-args "-i --simple-prompt")
;;     ) 

;;   (defvar python-extra-keywords
;;     '(
;;       ("\\(return\\)" 0 'font-lock-return-face prepend)
;;       ))

;;   (font-lock-add-keywords 'python-mode python-extra-keywords)

;;   (add-hook 'python-mode-hook #'electric-operator-mode))

(use-package lsp-pyright
  :ensure t
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp)))
  :config
  (add-hook 'python-mode-hook #'electric-operator-mode)

  (defvar python-extra-keywords
    '(
      ("\\(return\\)" 0 'font-lock-return-face prepend)
      ))

  (font-lock-add-keywords 'python-mode python-extra-keywords)
  ) 



(provide 'setup-python)
