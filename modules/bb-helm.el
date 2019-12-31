;; open helm in its own frame, see https://www.reddit.com/r/emacs/comments/7rho4f/now_you_can_use_helm_with_frames_instead_of/
;;(setq helm-display-function 'helm-display-buffer-in-own-frame
;;      ;helm-display-buffer-reuse-frame t
;;      helm-use-undecorated-frame-option t)
(setq helm-display-header-line t)
(helm-autoresize-mode 1)
(setq helm-autoresize-min-height 100)
(setq helm-autoresize-max-height 100)
(setq helm-move-to-line-cycle-in-source nil)
(setq helm-allow-mouse t)
(setq helm-prevent-escaping-from-minibuffer nil)
(customize-set-variable 'helm-ff-lynx-style-map t) ; allow going up/down dir with helm using arrow keys
(provide 'bb-helm)
