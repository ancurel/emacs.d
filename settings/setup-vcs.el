
;; Packages:
;;    magit      | https://github.com/magit/magit 
;;    git-gutter | https://github.com/syohex/emacs-git-gutter
;;    diff-hl    | https://github.com/dgutov/diff-hl

(setq vc-make-backup-files t)

;; (after-load 'vc-git 
;;   (if (display-graphic-p)
;;       (use-package git-gutter-fringe+
;;         :config (git-gutter-fr+-minimal))
;;     (use-package git-gutter+
;;       :config (global-git-gutter+-mode))
;;     ))

(use-package git-gutter
  :config
  (set-face-foreground 'git-gutter:modified "#ad73f9")
  (set-face-foreground 'git-gutter:added "#25d4e2")
  (set-face-foreground 'git-gutter:deleted "#d83b8c")
  )

(use-package diff-hl
  :config (add-hook 'dired-mode-hook 'diff-hl-dired-mode))


(use-package magit
  ;; :pin melpa-stable
  :init
  (setq magit-status-buffer-switch-function 'switch-to-buffer)
  (setq magit-section-show-child-count t)
  (setq magit-diff-arguments '("--histogram")))


(unless (display-graphic-p)
  (diff-hl-margin-mode))


(provide 'setup-vcs)
