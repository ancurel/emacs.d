
;; Setup web-mode
;; http://web-mode.org/

(use-package web-mode
  :mode "\\.phtml\\'" 
  "\\.tpl\\.php\\'" 
  "\\.html\\.twig\\'"
  "/\\(views\\|html\\|theme\\|templates\\)/.*\\.php\\'"
  :config
  (defun webmode-smartparens-settings ()
    (setq web-mode-enable-auto-pairing nil) 

    (sp-with-modes '(web-mode)
      (sp-local-pair "%" "%"
                     :unless '(sp-in-string-p)
                     :post-handlers '(((lambda (&rest _ignored)
                                         (just-one-space)
                                         (save-excursion (insert " ")))
                                       "SPC" "=" "#")))
      (sp-local-pair "<% "  " %>" :insert "C-c %")
      (sp-local-pair "<%= " " %>" :insert "C-c =")
      (sp-local-pair "<%# " " %>" :insert "C-c #")
      (sp-local-tag "%" "<% "  " %>")
      (sp-local-tag "=" "<%= " " %>")
      (sp-local-tag "#" "<%# " " %>")))

  (add-hook 'turn-on-smartparens-mode 'webmode-smartparens-settings) )


(provide 'setup-web)
