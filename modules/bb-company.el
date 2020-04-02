(use-package company
  :config
  (setq company-idle-delay 0)
  :ensure t)


(use-package company-quickhelp
  :config
  (company-quickhelp-mode 1)
  (setq company-quickhelp-delay 0)
  :ensure t)
(eval-after-load 'company
  '(define-key company-active-map (kbd "C-q") #'company-quickhelp-manual-begin))


(provide 'bb-company)
