;; open helm in its own frame, see https://www.reddit.com/r/emacs/comments/7rho4f/now_you_can_use_helm_with_frames_instead_of/
(setq helm-display-function 'helm-display-buffer-in-own-frame
      helm-display-buffer-reuse-frame nil
      helm-use-undecorated-frame-option t)

;; bb bindings
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB work in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(customize-set-variable 'helm-ff-lynx-style-map t) ; allow going up/down dir with helm using arrow keys
(setq helm-display-header-line t
      helm-autoresize-mode t
      helm-autoresize-min-height 20
      helm-autoresize-max-height 40
      helm-move-to-line-cycle-in-source nil
      helm-allow-mouse t
      helm-prevent-escaping-from-minibuffer nil)


;; eshell improvements
(add-hook 'eshell-mode-hook
          (lambda ()
            (eshell-cmpl-initialize)
            (define-key eshell-mode-map [remap eshell-pcomplete] 'helm-esh-pcomplete)
            (define-key eshell-mode-map (kbd "M-p") 'helm-eshell-history)))

(use-package helm-swoop
  :ensure t)

(use-package helm-company
  :ensure t)

(provide 'bb-helm)
