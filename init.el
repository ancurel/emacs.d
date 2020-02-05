
;; Hide menu/tool/scroll bars early
(if (fboundp 'menu-bar-mode) (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))

;; Global variables
(setq user-home-directory     (concat (getenv "HOME") "/")) ; must end with /
(setq user-emacs-directory    (concat user-home-directory ".emacs.d/")) ; must end with /
(setq emacs-version-short     (replace-regexp-in-string
                               "\\([0-9]+\\)\\.\\([0-9]+\\).*"
                               "\\1_\\2" emacs-version)) ; 25.0.50.1 -> 25_0
(setq org-directory           (concat user-home-directory "org/")) ; must end with /
(setq setup-packages-file     (locate-user-emacs-file "settings/init-package.el"))
(setq custom-file             (locate-user-emacs-file
                               (concat "custom_" emacs-version-short ".el")))


;; Fix for downloading packages from ELPA in emacs-27
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

;; List of packages to install at launch
(setq my-packages
      '(
        aggressive-indent
        all-the-icons
        ;; electric-spacing
        electric-operator 
        diminish
        ;; dired-details
        ;; fill-column-indicator
        guide-key
        helm
        helm-ag
        helm-projectile
        ; helm-swoop
	highlight-numbers
	highlight-operators
	highlight-parentheses
	;; highlight-symbol
        key-chord
        ;; nodejs-repl
        org
        ;; popwin
        ;; pos-tip
        posframe
        project-root
        projectile
        ranger
        ;; repl-toggle
        ;; restclient
        use-package
        ;; smex
        yaml-mode
        ))


;; Basic requires
(require 'cl)
(require 'cl-lib)

(when (file-exists-p custom-file)
  (load custom-file :noerror :nomessage))

(load setup-packages-file nil :nomessage) ; Load the packages
;; (package-initialize) ; Do NOT delete this comment
;;   In emacs 25+, the `package-initialize' call is auto-added to the top of
;; init.el unless the user already has a commented or uncommented
;; `(package-initialize)' line present in their init.el.
;;   I call this function in setup-packages.el and so am keeping the
;; commented out version here so that package.el does not add it again.

(eval-when-compile
  (require 'use-package)
  (setq use-package-always-ensure t))
(require 'bind-key)
(require 'saveplace)

;; Setup general settings/interface
(require 'sane-defaults)
(require 'init-utils)
(require 'init-interface)
(require 'init-modeline)
(require 'init-bindings)

;; Setup packages
(require 'setup-editorconfig)
(require 'setup-evil)
(require 'setup-lsp)
(require 'setup-company)
(require 'setup-smartparens)
(require 'setup-flycheck)
(require 'setup-yasnippet)
(require 'setup-gtags)
(require 'setup-vcs)
(require 'setup-search)

;; Setup languages
(require 'setup-js)
(require 'setup-php)
(require 'setup-css)
(require 'setup-web)
(require 'setup-python)
(require 'setup-rust)


;; Hide some modes
(after-load 'hs-minor-mode (dminish 'hs-minor-mode))
(after-load 'guide-key (diminish 'guide-key-mode))
(after-load 'projectile (diminish 'projectile-mode))
(after-load 'undo-tree (diminish 'undo-tree-mode))
(after-load 'git-gutter+ (diminish 'git-gutter-mode))


;; Save point position between sessions
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))


;;; Keychord mode
(key-chord-mode 1)
(setq key-chord-two-keys-delay 0.5)

(defun end-of-line-insert-delim ()
  "Go to the end of line and insert a ';' character if it's not already present"
  (interactive)
  (end-of-line)
  (when (> (line-end-position) 1)
    (let ((lastchar (buffer-substring-no-properties
                     (- (line-end-position) 1)
                     (line-end-position)
                     )))
      (when (not (equal ";" lastchar))
        (insert ";")))))

(--each '(css-mode-hook
          js-mode-hook
          c-mode-hook)
  (add-hook it (key-chord-define evil-insert-state-map ";;" 'end-of-line-insert-delim)))


;;; Always use guide-key mode, it is awesome.
(setq guide-key/guide-key-sequence t)
(setq guide-key/idle-delay 0.5)
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode 1)


;; Turn on that number coloring for most languages
(setq hl-paren-colors
      '("#25d4e2" "#c1fbff" "#ffffff" "#aaaaaa"))
(defun highlight-all-the-things () 
                             (highlight-numbers-mode)
                             (highlight-operators-mode)
                             (highlight-parentheses-mode))
(add-hook 'prog-mode-hook 'highlight-all-the-things)


;; Global modes
;; (global-aggressive-indent-mode 1)

;; Smex
(smex-initialize)


;;; Don't actually use VC, because it slows down loading.
(eval-after-load "vc" '(setq vc-handled-backends nil))
;;; Follow symlinks to version-controlled files without argument. Just do it.
(setq vc-follow-symlinks t)
;;; Don't warn me when files are big. It's fine.
(setq large-file-warning-threshold nil)
;;; Never "sensibly" split windows vertically.
;(setq split-width-threshold nil)


;; Disable stuff on large filesize
(defun conditional-disable-modes ()
  (when (> (buffer-size) 1000000)
    (flycheck-mode -1)))

(add-hook 'prog-mode-hook 'conditional-disable-modes)



;; Rainbow delimiters
;; (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
;; (setq rainbow-delimiters-outermost-only-face-count 0)
;; (setq rainbow-delimiters-max-face-count 1)


;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))
