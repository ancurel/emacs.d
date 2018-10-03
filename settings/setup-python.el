
;; Setup python 
;; -----------------------------------------
;; elpy | https://github.com/jorgenschaefer/elpy 


(use-package elpy
  :init (elpy-enable)
  :config
  (defalias 'workon 'pyvenv-workon)

  (setq elpy-rpc-backend "jedi")
  (when (executable-find "ipython") 
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt")
    ) 

  (defvar python-extra-keywords
    '(
      ("\\(return\\)" 0 'font-lock-return-face prepend)
      ))

  (font-lock-add-keywords 'python-mode python-extra-keywords)

  (add-hook 'python-mode-hook #'electric-operator-mode))



(provide 'setup-python)
