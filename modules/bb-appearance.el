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

;; required for doom-modeline
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

;; (use-package    feebleline
;;   :ensure       t
;;   :config       (setq feebleline-msg-functions
;;                       '((feebleline-line-number         :post "" :fmt "%5s")
;;                         (feebleline-column-number       :pre ":" :fmt "%-2s")
;;                         (feebleline-file-directory      :face feebleline-dir-face :post "")
;;                         (feebleline-file-or-buffer-name :face font-lock-keyword-face :post "")
;;                         (feebleline-file-modified-star  :face font-lock-warning-face :post "")
;;                         (feebleline-git-branch          :face feebleline-git-face :pre " : ")
;;                         (feebleline-project-name        :align right)))
;;                 (feebleline-mode 1))
(setq-default cursor-type 'bar) 

(load-theme 'doom-one t)

(provide 'bb-appearance)
