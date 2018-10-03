;; Mode line setup
;; (setq-default
;;  mode-line-format
;;  '(
;;    " "
;;    ;; evil support
;;    (:eval (when (bound-and-true-p evil-mode)
;;             (cond 
;;              ((evil-insert-state-p)
;;               (propertize " I " 'face 'evil-mode-line-insert))
;;              ((evil-visual-state-p)
;;               (propertize " V " 'face 'evil-mode-line-visual))
;;              ((evil-replace-state-p)
;;               (propertize " R " 'face 'evil-mode-line-replace))
;;              (t (propertize "   " 'face 'evil-mode-line-normal))
;;              )))
;;    ;; Position, including warning for 120 columns
;;    (:propertize "%4l:" face mode-line-position-face)
;;    (:eval (propertize "%3c" 'face
;;                       (if (>= (current-column) 120)
;;                           'mode-line-collimit-face
;;                         'mode-line-position-face)))
;;    ;; emacsclient [default -- keep?]
;;    mode-line-client
;;    "    "
;;    ;; read-only or modified status
;;    (:eval
;;     (cond (buffer-read-only
;;            (propertize " RO " 'face 'mode-line-read-only-face))
;;           ((buffer-modified-p)
;;            (propertize " ** " 'face 'mode-line-modified-face))
;;           (t "    ")))
;;    "    "
;;    ;; directory and buffer/file name
;;    (:propertize (:eval (shorten-directory default-directory 30))
;;                 face mode-line-folder-face)
;;    (:propertize "%b"
;;                 face mode-line-filename-face)
;;    ;; narrow [default -- keep?]
;;    " %n "
;;    ;; mode indicators: vc, recursive edit, major mode, minor modes, process, global
;;    (vc-mode vc-mode)
;;    "  %["
;;    (:propertize mode-name
;;                 face mode-line-mode-face)
;;    "%] "
;;    (:eval (propertize (format-mode-line minor-mode-alist)
;;                       'face 'mode-line-minor-mode-face))
;;    (:propertize mode-line-process
;;                 face mode-line-process-face)
;;    (global-mode-string global-mode-string)
;;    "    "
;;    ))

(use-package powerline
  :ensure t)

;; Helper function
(defun *shorten-directory (dir max-length)
  "Show up to `max-length' characters of a directory name `dir'."
  (let ((path (reverse (split-string (abbreviate-file-name dir) "/")))
        (output ""))
    (when (and path (equal "" (car path)))
      (setq path (cdr path)))
    (while (and path (< (length output) (- max-length 4)))
      (setq output (concat (car path) "/" output))
      (setq path (cdr path)))
    (when path
      (setq output (concat ".../" output)))
    output))

(defun *buffer-name ()
  "The buffer's name."
  (s-trim-left (format-mode-line "%b")))

(defun *buffer-state ()
  (when buffer-file-name
    (propertize
     (concat (if (not (file-exists-p buffer-file-name))
                 "∄"
               (if (buffer-modified-p) "✱"))
             (if buffer-read-only ""))
     'face 'mode-line-modified-face)))

(defun *buffer-pwd ()
  "Displays `default-directory'."
  (propertize
   (concat "[" (abbreviate-file-name default-directory) "]")
   'face 'mode-line-folder-face))

(defun *buffer-encoding-abbrev ()
  "The line ending convention used in the buffer."
  (if (memq buffer-file-coding-system '(utf-8 utf-8-unix prefer-utf-8-unix))
      ""
    (symbol-name buffer-file-coding-system)))

(defun *buffer-position ()
  "A more vim-like buffer position."
  (let ((start (window-start))
        (end (window-end))
        (pend (point-max)))
    (if (and (= start 1)
             (= end pend))
        ":A"
      (cond ((= start 1) ":T")
            ((= end pend) ":B")
            (t (format ":%d%%%%" (/ end 0.01 pend)))))))

(defun *vc ()
  "Displays the current branch, colored based on its state."
  (when vc-mode
    (let ((backend (concat " " (substring vc-mode (+ 2 (length (symbol-name (vc-backend buffer-file-name))))) " "))
          (face (let ((state (vc-state buffer-file-name)))
                  (cond ((memq state '(edited added))
                         'mode-line-vcs-info)
                        ((memq state '(removed needs-merge needs-update conflict removed unregistered))
                         'mode-line-vcs-warning)
                        ('mode-line-vcs)))))
      (if active
          (propertize backend 'face face)
        backend))))

(defun *evil-mode-state ()
  "Indicator of what editing mode is activated in evil"
  (when (bound-and-true-p evil-mode)
    (cond 
     ((evil-insert-state-p)
      (propertize " I " 'face 'evil-mode-line-insert))
     ((evil-visual-state-p)
      (propertize " V " 'face 'evil-mode-line-visual))
     ((evil-replace-state-p)
      (propertize " R " 'face 'evil-mode-line-replace))
     (t (propertize "   " 'face 'evil-mode-line-normal))
     ))
  )

  
(defun *evil-substitute ()
  "Show number of :s matches in real time."
  (when (and (evil-ex-p) (evil-ex-hl-active-p 'evil-ex-substitute))
    (propertize
     (let ((range (if evil-ex-range
                      (cons (car evil-ex-range) (cadr evil-ex-range))
                    (cons (line-beginning-position) (line-end-position))))
           (pattern (car-safe (evil-delimited-arguments evil-ex-argument 2))))
       (if pattern
           (format " %s matches "
                   (count-matches pattern (car range) (cdr range))
                   evil-ex-argument)
         " ... "))
     'face (if active 'mode-line-count-face))))


(defun powerline-custom-theme (&optional id)
  "A powerline focused on being distraction free"
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          ;; (mode-line-buffer-id (if active 'mode-line-buffer-id 'mode-line-buffer-id-inactive))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (cur-face (if active 'mode-line 'mode-line-inactive))

                          (lhs (list
                                " " (*evil-mode-state) " "
                                (*evil-substitute)
                                (propertize (*shorten-directory default-directory 30) 'face (if active 'mode-line-folder-face))
                                (propertize (*buffer-name) 'face (if active 'mode-line-filename-face))
                                " "
                                (*buffer-state)
                                ))
                          (rhs (list
                                (if active (concat
                                            (*buffer-encoding-abbrev)
                                            "  " (propertize
                                                  (powerline-major-mode)
                                                  'face 'mode-line-mode-face) "  "))
                                (*vc)
                                (propertize
                                 (concat "| %l,%c " (*buffer-position))
                                 'face (if active 'mode-line-position-face))
                                )))
                     (concat (powerline-render lhs)
                             (powerline-fill nil (powerline-width rhs))
                             (powerline-render rhs)))))))  

(powerline-custom-theme)


;; Evil mode line faces
(defface evil-mode-line-insert
  '((t (:foreground "black" :background "green-2" :inherit mode-line)))
  "Face used to indicate evil insert mode in the mode line"
  :group 'faces
  :group 'evil)

(defface evil-mode-line-visual
  '((t (:foreground "black" :background "blue-2" :inherit mode-line)))
  "Face used to indicate evil visual mode in the mode line"
  :group 'faces
  :group 'evil)

(defface evil-mode-line-replace
  '((t (:foreground "black" :background "red-2" :inherit mode-line)))
  "Face used to indicate evil replace mode in the mode line"
  :group 'faces
  :group 'evil)

(defface evil-mode-line-normal
  '((t (:inherit mode-line)))
  "Face used to indicate normal/emacs mode in the mode line"
  :group 'faces
  :group 'evil)


;; Generic mode line faces
(defface mode-line-read-only-face
  '((t :foreground "#68aff7"))
  "Face used to indicate read only buffer in mode line"
  :group 'faces
  :group 'mode-line)

(defface mode-line-modified-face
  '((t :foreground "#d83b8c"))
  "Face used to indicate modified buffer in mode line"
  :group 'faces
  :group 'mode-line)

(defface mode-line-folder-face
  '((t :foreground "gray60"))
  "Face used to indicate directory path in mode line"
  :group 'faces
  :group 'mode-line)

(defface mode-line-filename-face
  '((t :foreground "#ad73f9"))
  "Face used to indicated filename mode line"
  :group 'faces
  :group 'mode-line)

(defface mode-line-position-face
  '((t :foreground "gray70"))
  "Face used to indicated line & column number in mode line"
  :group 'faces
  :group 'mode-line)

(defface mode-line-mode-face
  '((t :foreground "#5a70ad"))
  "Face used to indicated main mode in mode line"
  :group 'faces
  :group 'mode-line)

(defface mode-line-minor-mode-face
  '((t :foreground "gray40"))
  "Face used to indicated minor modes in mode line"
  :group 'faces
  :group 'mode-line)

(defface mode-line-count-face
  '((t :foreground "black" :background "#939bcc"))
  "Font used to indicate search count in mode-line"
  :group 'faces
  :group 'mode-line)

(defface mode-line-process-face
  '((t :foreground "#718c00"))
  "Face used to indicated process in mode line"
  :group 'faces
  :group 'mode-line)

(defface mode-line-collimit-face
  '((t :inherit mode-line-positon-face :foreground "black" :background "#8056f3"))
  "Face used to indicate column length of line beyond a limit in the mode line"
  :group 'faces
  :group 'mode-line)


;; VCS part faces
(defface mode-line-vcs
  '((t :foreground "#939bcc"))
  "Face used for VCS info"
  :group 'faces
  :group 'mode-line)

(defface mode-line-vcs-info
  '((t :foreground "#68aff7"))
  "Face used for VCS info"
  :group 'faces
  :group 'mode-line)

(defface mode-line-vcs-warning
  '((t :foreground "#25d4e2"))
  "Face used for VCS warning"
  :group 'faces
  :group 'mode-line)


(provide 'init-modeline)
;;; init-modeline.el ends here
