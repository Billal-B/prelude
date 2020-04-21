(ivy-mode 1)
(counsel-mode 1)
(setq ivy-use-virtual-buffers t
      enable-recursive-minibuffers t)

(use-package all-the-icons-ivy
  :init (add-hook 'after-init-hook 'all-the-icons-ivy-setup)
  :config
  (setq all-the-icons-ivy-file-commands
        '(counsel-find-file counsel-file-jump counsel-recentf counsel-projectile-find-file counsel-projectile-find-dir))
  (setq all-the-icons-spacer " ")
  :ensure t)

;; (use-package ivy-posframe
;;   :config
;;   (require 'ivy-posframe)
;;   ;; display at `ivy-posframe-style'
;;   ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display)))
;;   ;;(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-point)))
;;   ;;(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-center)))
;;   ;;(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
;;   (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-center)))
;;   ;;(setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-bottom-left)))
;;   ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-window-bottom-left)))
;;   ;; (setq ivy-posframe-display-functions-alist '((t . ivy-posframe-display-at-frame-top-center)))
;;   (setq ivy-posframe-min-width 60)
;;   (setq ivy-posframe-height 100)
;;   (ivy-posframe-mode 1)
;;   :ensure t)

(provide 'bb-ivy)
