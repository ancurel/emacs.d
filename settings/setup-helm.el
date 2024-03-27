
;; Configure helm & helm plugins

;; Packages:
;;    helm            | https://github.com/emacs-helm  
;;    helm-ag         | https://github.com/emacsorphanage/helm-ag
;;    helm-posframe   | https://github.com/tumashu/helm-posframe
;;    helm-projectile | https://github.com/bbatsov/helm-projectile 
;;    helm-swoop      | https://github.com/emacsorphanage/helm-swoop

(use-package helm
  :config
  (progn
    (setq helm-boring-buffer-regexp-list '("\\` " "\\*helm" "\\*Echo Area"
    "\\*Minibuf" "\\`\\'" "\\*Messages" "\\*Help" "\\*Shell Command Output"
    "\\*Flycheck error message" "\\*flycheck-posframe" "\\*Compile-Log"
    "\\*eslint" "\\*lsp-" "\\*ts-" "\\*Completions" "\\*company-" "-ls\\*$"
    "stderr\\*$"))
    ))

(use-package helm-ag
  :after (helm))

(use-package helm-projectile
  :after (helm projectile))

(use-package helm-posframe
  :after (help)
  :config
  (helm-posframe-enable))

;; (use-package helm-swoop
;;   :after (helm))


(provide 'setup-helm)
