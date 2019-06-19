
(global-set-key (kbd "<f8>") 'linum-mode)
(global-set-key (kbd "<f7>") 'git-gutter-mode)
(global-set-key (kbd "<S-insert>") 'clipboard-yank)


(after-load 'comint
  (define-key comint-mode-map [up] 'comint-previous-input)
  (define-key comint-mode-map [down] 'comint-next-input))


(after-load 'company
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-active-map (kbd "<tab>") 'my-company-tab)
  (define-key company-active-map (kbd "<backtab>") 'company-select-previous)
  (after-load "helm-company-autoloads"
    (define-key company-mode-map (kbd "<C-return>") 'helm-company)
    (define-key company-active-map (kbd "<C-return>") 'helm-company)))


(after-load 'evil
  (after-load 'key-chord
    (key-chord-define evil-insert-state-map "fj" 'evil-normal-state)
    (key-chord-define evil-insert-state-map "kj" 'newline-and-indent))

  (after-load 'evil-leader
    (evil-leader/set-leader ",")
    (evil-leader/set-key
      "aa" 'align-regexp
      "a=" 'my-align-single-equals
      "b"  'helm-mini             ;; Switch to another buffer
      "c"  (kbd "\"+y") 
      "B"  'magit-blame-popup
      "D"  'kill-this-buffer
      "d"  (lambda () (interactive) (evil-ex-call-command nil "bdelete" nil))
      "f"  'helm-imenu            ;; Jump to function in buffer
      "g"  'magit-status
      "l"  'whitespace-mode       ;; Show invisible characters
      "nn" 'narrow-and-set-normal ;; Narrow to region and enter normal mode
      "nw" 'widen
      "o"  'delete-other-windows  ;; C-w o
      "p"  'helm-show-kill-ring
      "s"  'ag-project            ;; Ag search from project's root
      "r"  (lambda () (interactive) (font-lock-fontify-buffer) (redraw-display))
      "S"  'delete-trailing-whitespace
      "T"  'gtags-reindex
      "t"  'gtags-find-tag
      "u"  'org-open-at-point-global
      "v"  (kbd "\"+p")
      "w"  'split-window-horizontally
      "x"  'helm-M-x
      ))

  (evil-add-hjkl-bindings ag-mode-map 'normal
    "n"   'evil-search-next
    "N"   'evil-search-previous
    "RET" 'compile-goto-error)

  (evil-add-hjkl-bindings occur-mode-map 'emacs
    (kbd "/")       'evil-search-forward
    (kbd "n")       'evil-search-next
    (kbd "N")       'evil-search-previous
    (kbd "C-d")     'evil-scroll-down
    (kbd "C-u")     'evil-scroll-up
    (kbd "C-w C-w") 'other-window)

  ;; Evil-snipe
  (after-load 'evil-snipe
    (evil-define-key 'motion evil-snipe-override-mode-map "f" 'evil-snipe-f)
    (evil-define-key 'motion evil-snipe-override-mode-map "F" 'evil-snipe-F)
    (evil-define-key 'motion evil-snipe-override-mode-map "t" 'evil-snipe-t)
    (evil-define-key 'motion evil-snipe-override-mode-map "T" 'evil-snipe-T))

  ;; Make escape quit everything, whenever possible
  (define-key evil-normal-state-map [escape] 'keyboard-quit)
  (define-key evil-visual-state-map [escape] 'keyboard-quit)
  (define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
  (define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

  (evil-ex-define-cmd "Q"  'evil-quit)
  (evil-ex-define-cmd "Qa" 'evil-quit-all)
  (evil-ex-define-cmd "QA" 'evil-quit-all)

  ;; Global evil bindings.
  (define-key evil-normal-state-map (kbd "C-S-P") 'helm-projectile-switch-project)
  (define-key evil-normal-state-map (kbd "C-p")   'helm-projectile)
  (define-key evil-normal-state-map (kbd "-")     'helm-find-files)
  (define-key evil-normal-state-map (kbd "C-]")   'gtags-find-tag-from-here)
  (define-key evil-normal-state-map (kbd "g/")    'occur-last-search)
  (define-key evil-normal-state-map (kbd "[i")    'show-first-occurrence)
  (define-key evil-normal-state-map (kbd "]n")    'next-conflict-marker)
  (define-key evil-normal-state-map (kbd "[n")    'previous-conflict-marker)
  (define-key evil-normal-state-map (kbd "SPC")   'evil-scroll-page-down)
  (define-key evil-normal-state-map (kbd "s-SPC") 'evil-scroll-page-up)
  (define-key evil-normal-state-map (kbd "s-p")   'evil-paste-pop)

  (define-key evil-insert-state-map (kbd "C-e")   'end-of-line)
  (define-key evil-insert-state-map (kbd "C-v")   'put-from-x-clipboard)


  ;; Navigate splits
  (global-set-key (kbd "C-w") 'evil-window-map)
  (define-key evil-motion-state-map (kbd "C-h") 'windmove-left)
  (define-key evil-motion-state-map (kbd "C-l") 'windmove-right)
  (define-key evil-motion-state-map (kbd "C-j") 'windmove-down)
  (define-key evil-motion-state-map (kbd "C-k") 'windmove-up)

  ;; Move cursor in insert mode
  (define-key evil-insert-state-map (kbd "C-h") 'left-char)
  (define-key evil-insert-state-map (kbd "C-l") 'right-char)
  (define-key evil-insert-state-map (kbd "C-j") 'next-line)
  (define-key evil-insert-state-map (kbd "C-k") 'previous-line)

  ;; Dired bindings
  (evil-define-key 'normal dired-mode-map "h" 'dired-up-directory)
  (evil-define-key 'normal dired-mode-map "l" 'dired-find-alternate-file)
  (evil-define-key 'normal dired-mode-map "o" 'dired-sort-toggle-or-edit)
  (evil-define-key 'normal dired-mode-map "v" 'dired-toggle-marks)
  (evil-define-key 'normal dired-mode-map "m" 'dired-mark)
  (evil-define-key 'normal dired-mode-map "u" 'dired-unmark)
  (evil-define-key 'normal dired-mode-map "U" 'dired-unmark-all-marks)
  (evil-define-key 'normal dired-mode-map "c" 'dired-create-directory)
  (evil-define-key 'normal dired-mode-map "n" 'evil-search-next)
  (evil-define-key 'normal dired-mode-map "N" 'evil-search-previous)
  (evil-define-key 'normal dired-mode-map "q" 'kill-this-buffer)
 )


(after-load 'smartparens
  (sp-local-pair 'prog-mode "{" nil :post-handlers '((util/create-newline-and-enter-sexp "RET")))
  (define-key smartparens-mode-map (kbd "C-; f") 'sp-forward-sexp)
  (define-key smartparens-mode-map (kbd "C-; b") 'sp-backward-sexp))


(after-load 'js2-mode
  ;; (define-key js2-mode-map [(return)]    'newline-and-indent)
  (define-key js2-mode-map [(backspace)] 'c-electric-backspace)
  (define-key js2-mode-map [(control d)] 'c-electric-delete-forward))


(after-load 'rjsx-mode
  (define-key rjsx-mode-map (kbd "<C-return>") 'rjsx-delete-creates-full-tag))


(after-load 'elpy
  (after-load 'evil
    (define-key evil-normal-state-map (kbd "g [") 'elpy-goto-definition)
    (define-key evil-normal-state-map (kbd "g r") 'elpy-refactor)

    (after-load 'evil-leader
      (evil-leader/set-key
        "mfi" 'elpy-importmagic-fixup
        "mfc" 'elpy-autopep8-fix-code
        "msb" 'elpy-shell-send-region-or-buffer
        "msl" 'elpy-shell-send-current-statement
        "msf" 'python-shell-send-defun
        "mss" 'elpy-shell-switch-to-shell
        )
      (after-load 'flycheck
        (evil-leader/set-key-for-mode 'elpy-mode
          "en" 'elpy-flymake-next-error
          "ep" 'elpy-flymake-previous-error
      )))

  ;; Reverse default enter behavour
  (define-key elpy-mode-map (kbd "RET") 'elpy-open-and-indent-line-below)
  (define-key elpy-mode-map (kbd "<S-return>") 'newline)))


(after-load 'smex
  (global-set-key (kbd "M-x") 'smex)
  (global-set-key (kbd "M-X") 'smex-major-mode-commands)
  (global-set-key (kbd "C-c C-c M-x") 'execute-extended-command))



(provide 'init-bindings)
