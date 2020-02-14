
;; Configure evil mode & evil plugins

;; Packages:
;;    evil-commentary  | https://github.com/linktohack/evil-commentary
;;    evil-exchange    | https://github.com/Dewdrops/evil-exchange
;;    evil-indent-plus | https://github.com/timcharper/evil-surround
;;    evil-leader      | https://github.com/cofi/evil-leader
;;    evil-magit       | https://github.com/emacs-evil/evil-magit
;;    evil-matchit     | https://github.com/redguardtoo/evil-matchit
;;    evil-org         | https://github.com/edwtjo/evil-org-mode
;;    evil-snipe       | https://github.com/hlissner/evil-snipe
;;    evil-surround    | https://github.com/timcharper/evil-surround
;;    evil-vimish-fold | https://github.com/alexmurray/evil-vimish-fold
;;    evil-visualstar  | https://github.com/bling/evil-visualstar

(use-package evil-commentary
  :diminish evil-commentary-mode
  :config
  (evil-commentary-mode))

(use-package evil-exchange
  :config
  (evil-exchange-install))

(use-package evil-leader
  :config
  (global-evil-leader-mode)
  (setq evil-leader/in-all-states 1))

(use-package evil-magit
  :after (magit))

(use-package evil-matchit
  :config
  (global-evil-matchit-mode 1))

(use-package evil-indent-plus)

(use-package evil-org
  :after (evil org)
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))  

(use-package evil-snipe
  :diminish evil-snipe-local-mode
  :init
  (setq evil-snipe-repeat-keys t)

  ;; or 'buffer, 'whole-visible or 'whole-buffer
  (setq evil-snipe-scope 'buffer)
  (setq evil-snipe-repeat-scope 'whole-visible)
  (setq evil-snipe-enable-highlight t)
  (setq evil-snipe-enable-incremental-highlight t)
  :config
  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
  (evil-snipe-mode 1)
  (evil-snipe-override-mode 2))

(use-package evil-smartparens
  :after (smartparens)
  :config (add-hook 'smartparens-strict-mode-hook #'evil-smartparens-mode))

(use-package evil-surround
  :config
  (global-evil-surround-mode 1))

(use-package evil-vimish-fold
  :config
  (evil-vimish-fold-mode 1))

(use-package evil-visualstar
  :config
  (global-evil-visualstar-mode))


(use-package evil
  :config
  ;; Always use evil mode.
  (evil-mode 1)

  ;; My personal evil settings.
  (setq evil-want-C-u-scroll t)
  (setq-default evil-want-C-i-jump nil)
  (setq-default evil-symbol-word-search t)

  (setq evil-normal-state-tag    "N")
  (setq evil-insert-state-tag    "I")
  (setq evil-visual-state-tag    "V")
  (setq evil-emacs-state-tag     "E")
  (setq evil-operator-state-tag  "O")
  (setq evil-motion-state-tag    "M")
  (setq evil-replace-state-tag   "R")

  (evil-set-initial-state 'git-commit-mode 'insert)
  (evil-set-initial-state 'magit-log-edit-mode 'insert)
  (evil-set-initial-state 'sunshine-mode 'emacs)

  (add-to-list 'evil-buffer-regexps '("\\*magit:"))

  (evil-add-hjkl-bindings org-agenda-mode-map 'emacs
    "RET" 'org-agenda-switch-to)

  (defun next-conflict-marker ()
    (interactive)
    (search-forward-regexp "\\(>>>>\\|====\\|<<<<\\)" (point-max) t)
    (move-beginning-of-line nil))

  (defun previous-conflict-marker ()
    (interactive)
    (search-backward-regexp "\\(>>>>\\|====\\|<<<<\\)" (point-min) t)
    (move-beginning-of-line nil))

  (defun minibuffer-keyboard-quit ()
    "Abort recursive edit.
    In Delete Selection mode, if the mark is active, just deactivate it;
    then it takes a second \\[keyboard-quit] to abort the minibuffer."
    (interactive)
    (if (and delete-selection-mode transient-mark-mode mark-active)
        (setq deactivate-mark  t)
      (when (get-buffer "*Completions*") (delete-windows-on "*Completions*"))
      (abort-recursive-edit))))



(provide 'setup-evil)
