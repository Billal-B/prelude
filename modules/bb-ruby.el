(use-package robe
  :config
  (add-hook 'ruby-mode-hook 'robe-mode)
  (eval-after-load 'company
  '(push 'company-robe company-backends))
  :ensure t)

(provide 'bb-ruby)
