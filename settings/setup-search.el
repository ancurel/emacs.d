
;; Setup search plugins 
;; -----------------------------------------
;; ag                | https://github.com/Wilfred/ag.el 


(use-package ag
  :commands ag
  :init
  (setq ag-reuse-window 't)
  :config
  (add-hook 'ag-search-finished-hook (lambda () (pop-to-buffer next-error-last-buffer))))



(provide 'setup-search)
