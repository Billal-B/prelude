(use-package company
  :config
  (setq company-idle-delay 0)
  :ensure t)


(use-package company-quickhelp
  :config
  (company-quickhelp-mode 1)
  (setq company-quickhelp-delay nil)
  :ensure t)
(eval-after-load 'company
  '(define-key company-active-map (kbd "C-q") #'company-quickhelp-manual-begin))

;; (use-package company-posframe
  ;; :config
  ;; (require 'company-posframe)
  ;; (company-posframe-mode)
  ;; :ensure t)

(provide 'bb-company)
