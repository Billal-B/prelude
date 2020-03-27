(use-package ejc-sql
  :config
  (add-hook 'ejc-sql-minor-mode-hook
          (lambda ()
            (auto-complete-mode t)
            (ejc-ac-setup)))
  (add-hook 'ejc-sql-minor-mode-hook
          (lambda ()
            (ejc-eldoc-setup)))
  (add-hook 'ejc-sql-connected-hook
          (lambda ()
            (ejc-set-fetch-size 150)
            (ejc-set-max-rows 100)
            (ejc-set-column-width-limit 99)))
  (setq ejc-result-table-impl 'orgtbl-mode)
  :ensure t)


(provide 'bb-sql)
