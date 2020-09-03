
;; Load fonts
(when (eq system-type 'gnu/linux)
  (progn
    (add-to-list 'default-frame-alist '(font . "tewi:pixelsize=11:foundry=lucy:weight=normal:slant=normal:width=normal:spacing=110:scalable=false"))))

;; Don't resize frame if font is smaller/larger than system default, Improve startupe time
(setq frame-inhibit-implied-resize t)

; Skip scratch buffer at startup, improves startup time
(setq initial-major-mode 'fundamental-mode)

;; Theme
(load-theme 'miami-night t)

;; Disable startup screens/messages
(setq inhibit-splash-screen t
      inhibit-startup-message t
      inhibit-startup-echo-area-message t)

;; Nice scrolling
(setq scroll-margin 0
      scroll-conservatively 100000
      scroll-preserve-screen-position 1)

;; Higlight matching parens
(show-paren-mode 1)

;; Disable blinking cursor
(blink-cursor-mode 0)

;; Don't use gtkk-system tooltips
;;(setq-default x-gtk-use-system-tooltips nil)

(setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))
(global-visual-line-mode nil)
(setq-default left-fringe-width nil)

;; Toggle linenumbers
(autoload 'linum-mode "linum" "toggle line numbers on/off" t) 
(setq linum-format " %d ")

;; Show me empty lines after buffer end
;; (set-default 'indicate-empty-lines t)

;; Better window title
(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

;; Minibuffer resizing
(setq resize-mini-windows 'grow-only)
(setq max-mini-window-height 0.3)

;; Don't pauzse display on input
(setq redisplay-dont-pause t)

;; Remove continuation arrow on right fringe
(setq fringe-indicator-alist (delq (assq 'continuation fringe-indicator-alist)
                                   fringe-indicator-alist))


;; Define syntax vars
(defface font-lock-annotation-face
  '((t (:foreground "purple1")))
  "Color of parenthesis in varous languages")

(defface font-lock-operator-face
  '((t (:foreground "cyan1")))
  "Operator color in varous languages")

(defface font-lock-return-face
  '((t (:foreground "cyan1")))
  "Color of return keyword")

(defface font-lock-parenthesis-face
  '((t (:foreground "purple1")))
  "Color of parenthesis in varous languages")

(defface highlight-todo 
  '((t (:foreground "white" :background "purple1")))
  "Highlight TODO word in sourcoede.")

(defface highlight-fixme 
  '((t (:foreground "black" :background "red")))
  "Highlight FIXME word in sourcoede.")

(defun my-global-highlights ()
  (defvar prog-extra-keywords
    '(
      ; ("\\([~^<>:=,.\\+*/%-]\\)" 1 'font-lock-operator-face)
      ("\\([{}()]\\)" 1 'font-lock-parenthesis-face)
      ("\\(TODO\\):" 1 'highlight-todo prepend)
      ("\\(FIXME\\):" 1 'highlight-fixme prepend)
      ))
  (font-lock-add-keywords nil prog-extra-keywords))

(add-hook 'prog-mode-hook 'my-global-highlights)


(provide 'init-interface)
