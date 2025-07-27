
;; Setup search plugins 
;; -----------------------------------------
;; rg                | https://github.com/dajva/rg.el 


(use-package rg
  :commands rg
  ;; :config
  ;; (add-hook 'ag-search-finished-hook (lambda () (pop-to-buffer next-error-last-buffer))))
  )



(provide 'setup-search)
