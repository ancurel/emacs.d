
;; Setup CSS 

;; Other packages:
;;    rainbow-mode (https://julien.danjou.info/projects/emacs-packages#rainbow-mode)

(use-package rainbow-mode
  :diminish rainbow-mode
  :mode (("\\.css$"  . scss-mode)
         ("\\.scss$" . scss-mode))
  :config
  (dolist (hook '(css-mode-hook scss-mode-hook html-mode-hook))
    (add-hook hook 'rainbow-mode)))

(use-package css-mode
  :mode (("\\.css$"  . scss-mode)
         ("\\.scss$" . scss-mode))
  :config
  (defun my-css-settings ()
    (local-set-key (kbd "RET") 'newline-and-indent)
    (electric-indent-local-mode)

    ;; Tone down highlighting to avoid breaking syntax-highlighting
    (highlight-operators-mode -1)
    (highlight-numbers-mode -1)
    )
  
  (add-hook 'css-mode-hook 'my-css-settings))


(provide 'setup-css)
