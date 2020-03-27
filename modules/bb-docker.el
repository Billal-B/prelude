(use-package docker
  :ensure t)

(use-package dockerfile-mode
  :config
  (add-to-list 'auto-mode-alist '("Dockerfile\\'" . dockerfile-mode))
  :ensure t)

(use-package kubernetes
  :ensure t
  :commands (kubernetes-overview))

(provide 'bb-docker)
