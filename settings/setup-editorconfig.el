
;; EditorConfig plugin for emacs 
;; https://github.com/editorconfig/editorconfig-emacs 


(use-package editorconfig
  :ensure t
  :init
  (add-hook 'prog-mode-hook (editorconfig-mode 1))
  (add-hook 'text-mode-hook (editorconfig-mode 1)))     


(provide 'setup-editorconfig)
