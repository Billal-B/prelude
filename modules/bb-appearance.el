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

;; required for  (setq doom-modeline-github t)
(use-package ghub
  :ensure t)

(use-package doom-modeline
  :ensure t
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 20)
  (setq doom-modeline-bar-width 3)
  (setq doom-modeline-icon (display-graphic-p))
  (setq doom-modeline-major-mode-icon t)
  (setq doom-modeline-major-mode-color-icon t)
  (setq doom-modeline-buffer-state-icon nil)
  (setq doom-modeline-buffer-modification-icon nil)
  (setq doom-modeline-minor-modes nil)
  (setq doom-modeline-indent-info nil)
  (setq doom-modeline-checker-simple-format t)
  (setq doom-modeline-github t)
  (setq doom-modeline-github-interval (* 30 60))
  (setq doom-modeline-persp-name nil)
  (setq doom-modeline-modal-icon t)
  (setq doom-modeline-gnus nil))


(provide 'bb-appearance)
