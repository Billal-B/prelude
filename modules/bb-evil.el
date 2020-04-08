;; evil bindings
(global-set-key (kbd "M-h") 'evil-window-move-far-left)
(global-set-key (kbd "M-j") 'evil-window-move-very-bottom)
(global-set-key (kbd "M-k") 'evil-window-move-very-top)
(global-set-key (kbd "M-l") 'evil-window-move-far-right)
(global-set-key (kbd "C-%") 'evil-jump-item)
(global-set-key (kbd "C-z") 'evil-force-normal-state)
(global-set-key (kbd "<escape>") 'evil-force-normal-state)

(define-key evil-normal-state-map (kbd "q") 'nil)
(define-key evil-normal-state-map (kbd "Q") 'evil-record-macro)
(define-key evil-insert-state-map (kbd "C-k") 'windmove-up)


;; force emacs state
(setq evil-default-state 'normal)
(evil-set-initial-state 'term-mode 'emacs)
(evil-set-initial-state 'magit-mode 'emacs)
(evil-set-initial-state 'dired-mode 'emacs)
(evil-set-initial-state 'docker-image-mode 'emacs)
(evil-set-initial-state 'docker-container-mode 'emacs)
(evil-set-initial-state 'docker-volume-mode 'emacs)
(evil-set-initial-state 'docker-network-mode 'emacs)
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'help-mode 'emacs)
(evil-set-initial-state 'xref--xref-buffer-mode 'emacs)
(evil-set-initial-state 'kubernetes-mode 'emacs)
(evil-set-initial-state 'flycheck-error-list-mode 'emacs)
;;(defalias 'evil-insert-state 'evil-emacs-state)
;; others
(global-evil-visualstar-mode)

;; enable M-. in normal mode
(define-key evil-normal-state-map (kbd "M-.")
  `(menu-item "" evil-repeat-pop :filter
              ,(lambda (cmd) (if (eq last-command 'evil-repeat-pop) cmd))))

;; some colors
;;(setq evil-emacs-state-cursor '(bar "red")
;;      evil-insert-state-cursor '(bar "salmon")
;;      evil-normal-state-cursor '(box "salmon"))

(provide 'bb-evil)
