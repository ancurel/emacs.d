
;; Setup search plugins 
;; -----------------------------------------
;; ag                | https://github.com/Wilfred/ag.el 


(use-package ag
  :commands ag
  :config
  (add-hook 'ag-search-finished-hook (lambda () (pop-to-buffer next-error-last-buffer))))



(provide 'setup-search)
