(use-package terraform-mode
  :ensure t)

(use-package company-terraform
  :config
  (require 'company-terraform)
  (company-terraform-init)
  :ensure t)

(provide 'bb-hcl)
