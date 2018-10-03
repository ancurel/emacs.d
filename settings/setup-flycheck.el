
;; Setup flycheck  
;; -----------------------------------------
;; flycheck           | https://github.com/flycheck/flycheck 
;; lsp-flycheck       | https://github.com/joshwnj/json-mode
;; flycheck-posframe  | https://github.com/alexmurray/flycheck-posframe


(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))


(use-package flycheck
  :config
  ;; (use-package flycheck-pos-tip)

  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  
  ;; disable json-jsonlist checking for json files
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(json-jsonlist)))
  
  ;; Try to use local eslint in projects
  (add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)

  ;; use eslint with web-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode)


  ;; Each buffer gets its own idle-change-delay because of the
  ;; buffer-sensitive adjustment above.
  (make-variable-buffer-local 'flycheck-idle-change-delay)

  (add-hook 'flycheck-after-syntax-check-hook
            'magnars/adjust-flycheck-automatic-syntax-eagerness)

  ;; Remove newline checks, since they would trigger an immediate check
  ;; when we want the idle-change-delay to be in effect while editing.
  (setq flycheck-check-syntax-automatically '(save
                                              idle-change
                                              mode-enabled))

  ;; (custom-set-variables
  ;;  '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages))

  (defun magnars/adjust-flycheck-automatic-syntax-eagerness ()
    "Adjust how often we check for errors based on if there are any.
This lets us fix any errors as quickly as possible, but in a
clean buffer we're an order of magnitude laxer about checking."
    (setq flycheck-idle-change-delay
          (if flycheck-current-errors 0.5 30.0)))

  (defun flycheck-handle-idle-change ()
    "Handle an expired idle time since the last change.
This is an overwritten version of the original
flycheck-handle-idle-change, which removes the forced deferred.
Timers should only trigger inbetween commands in a single
threaded system and the forced deferred makes errors never show
up before you execute another command."
    (flycheck-clear-idle-change-timer)
    (flycheck-buffer-automatically 'idle-change))

  ;; Some binds
  (add-hook 'flycheck-mode-hook (lambda ()
                                  (evil-define-key 'normal flycheck-mode-map (kbd "]e") 'flycheck-next-error)
                                  (evil-define-key 'normal flycheck-mode-map (kbd "[e") 'flycheck-previous-error))))


(use-package flycheck-posframe
  :after flycheck
  :config (add-hook 'flycheck-mode-hook #'flycheck-posframe-mode))
  


(provide 'setup-flycheck)

