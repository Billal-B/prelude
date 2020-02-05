(use-package centaur-tabs
  :demand
  :config
  (centaur-tabs-mode t)
  (setq centaur-tabs-set-icons t)
  (centaur-tabs-group-by-projectile-project)
  ;;(centaur-tabs-inherit-tabbar-faces)
  :bind
  ("C-<prior>" . centaur-tabs-forward)
  ("C-<next>" . centaur-tabs-backward)
  :ensure t)

(use-package all-the-icons
  :ensure t)

(use-package all-the-icons-dired
  :config
  (add-hook 'dired-mode-hook 'all-the-icons-dired-mode)
  :ensure t)

(use-package rainbow-delimiters
  :config
  (add-hook 'elisp-mode-hook #'rainbow-delimiters-mode)
  :ensure t)

(use-package ewal-spacemacs-themes
  :ensure t)
;;(load-theme 'dracula)
<<<<<<< 093f93a70bd73b5ece4bcdc0775d1796cdd26299
=======
;;(load-theme 'doom-laserwave)
>>>>>>> fixes ruby conf plus calendar auto startup

(provide 'bb-appearance)
