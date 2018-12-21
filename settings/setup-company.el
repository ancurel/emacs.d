
;; Setup company mode
;; -----------------------------------------
;; company-mode      | https://github.com/company-mode/company-mode 
;; company-quickhelp | https://github.com/expez/company-quickhelp
;; company-lsp       | https://github.com/tigersoldier/company-lsp
;; helm-company      | https://github.com/yasuyk/helm-company 
;; company-box       | https://github.com/sebastiencs/company-box
;; company-posframe  | https://github.com/tumashu/company-posframe


(use-package company
  :diminish company-mode
  :init
  (setq company-idle-delay 0.2)
  (setq company-minimum-prefix-length 2)
  (setq company-show-numbers t)
  (setq company-tooltip-limit 20)

  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-ignore-case t)

  (setq company-dabbrev-code-ignore-case t)
  (setq company-dabbrev-code-everywhere t)

  (setq company-etags-ignore-case t) 

  (setq company-global-modes
        '(not
          eshell-mode comint-mode org-mode erc-mode))

  :config
  (defadvice company-complete-common (around advice-for-company-complete-common activate)
    (when (null (yas-expand))
      ad-do-it))

  (defun my-company-tab ()
    (interactive)
    (when (null (yas-expand))
      (company-select-next)))

  (add-hook 'after-init-hook 'global-company-mode))

;; (use-package company-quickhelp
;;   :after (company)
;;   :init (company-quickhelp-mode))

(use-package company-lsp
  :after (company lsp-mode)
  :config (push 'company-lsp company-backends))

(use-package company-box
  :diminish
  :after (company)
  :hook (company-mode . company-box-mode)
  :config
  (when (eq system-type 'gnu/linux)
    (progn
      (require 'icons-in-terminal)
      (setq company-box-icons-unknown 'fa_question_circle)

      (setq company-box-icons-elisp
            '((fa_tag :face font-lock-function-name-face) ;; Function
              (fa_cog :face font-lock-variable-name-face) ;; Variable
              (fa_cube :face font-lock-constant-face) ;; Feature
              (md_color_lens :face font-lock-doc-face))) ;; Face

      (setq company-box-icons-yasnippet 'fa_bookmark)

      (setq company-box-icons-lsp
            '((1 . fa_text_height) ;; Text
              (2 . (fa_tags :face font-lock-function-name-face)) ;; Method
              (3 . (fa_tag :face font-lock-function-name-face)) ;; Function
              (4 . (fa_tag :face font-lock-function-name-face)) ;; Constructor
              (5 . (fa_cog :foreground "#FF9800")) ;; Field
              (6 . (fa_cog :foreground "#FF9800")) ;; Variable
              (7 . (fa_cube :foreground "#7C4DFF")) ;; Class
              (8 . (fa_cube :foreground "#7C4DFF")) ;; Interface
              (9 . (fa_cube :foreground "#7C4DFF")) ;; Module
              (10 . (fa_cog :foreground "#FF9800")) ;; Property
              (11 . md_settings_system_daydream) ;; Unit
              (12 . (fa_cog :foreground "#FF9800")) ;; Value
              (13 . (md_storage :face font-lock-type-face)) ;; Enum
              (14 . (md_closed_caption :foreground "#009688")) ;; Keyword
              (15 . md_closed_caption) ;; Snippet
              (16 . (md_color_lens :face font-lock-doc-face)) ;; Color
              (17 . fa_file_text_o) ;; File
              (18 . md_refresh) ;; Reference
              (19 . fa_folder_open) ;; Folder
              (20 . (md_closed_caption :foreground "#009688")) ;; EnumMember
              (21 . (fa_square :face font-lock-constant-face)) ;; Constant
              (22 . (fa_cube :face font-lock-type-face)) ;; Struct
              (23 . fa_calendar) ;; Event
              (24 . fa_square_o) ;; Operator
              (25 . fa_arrows)) ;; TypeParameter
            )
      )
    ))

;; (use-package helm-company)

(use-package company-posframe
  :after (company posframe)
  :init (company-posframe-mode 1))



(provide 'setup-company)
