(use-package general
  :config
  (require 'general)
  ;; disable for prefix key
  (define-key evil-normal-state-map (kbd "SPC") nil)
  (define-key evil-normal-state-map (kbd "w") nil)
  :ensure t)


(defun eval-and-next-paragraph ()
  (interactive)
  (evil-forward-paragraph)
  (call-interactively #'eval-last-sexp)
  )

(general-define-key
 :states 'normal
 "!" 'eval-and-next-paragraph)

;; ** Global Keybindings
(general-define-key
 :keymaps '(normal visual insert emacs)
 :prefix "SPC"
 :non-normal-prefix "<f12>"
 :keymaps 'override
 "e" '(:ignore t :which-key "Edits")
 "ee" 'helm-show-kill-ring
 "eu" 'undo-tree-visualize
 "f" '(:ignore t :which-key "Files")
 "fd" 'dired-jump
 "ff" 'helm-find-files
 "fg" 'thunar
 "fl" 'helm-locate
 "fn" 'deft
 "fN" 'deft-new-file
 "fr" 'helm-recentf
 "fs" 'crux-create-scratch-buffer
 "ft" 'treemacs
 "o" '(:ignore t :which-key "Search (occur/ag)")
 "oa" 'helm-do-ag
 "og" 'helm-do-grep-ag
 "om" 'helm-multi-swoop-all
 "oM" 'helm-multi-swoop
 "oo" 'helm-occur
 "oO" 'helm-swoop
 "t" '(:ignore t :which-key "Tools")
 "td" 'docker
 "tk" 'kubernetes-overview
 "tm" 'magit-status
 "tt" 'terminal-here
 "t+" 'calc
 "w" '(:ignore t :which-key "Window")
 "wm" 'menu-bar-mode
 "ww" 'bb/tear-off-window
 "<" '(:ignore t :which-key "Multiedit")
 "<<" 'evil-multiedit-toggle-marker-here
 "<a" 'evil-multiedit-match-all
 ;; others
 "a" 'org-capture
 "A" 'org-agenda
 "b" 'helm-buffers-list
 "p" 'projectile-command-map
 "RET" 'helm-resume
 "M-x" 'helm-M-x ; useful in cases of bugs
 )

;; visual mode bindings
(general-define-key
 :keymaps '(visual normal)
 "+" 'er/expand-region
 "-" 'er/contract-region)

;; avy bindings
(general-define-key
 :keymaps '(normal visual)
 "tt" 'avy-goto-char-timer
 "tj" 'avy-goto-line-below
 "tk" 'avy-goto-line-above
 "tw" 'avy-goto-word-1
 "tn" 'avy-isearch)

;; smartparens bindings
(general-define-key
 :keymaps '(normal insert emacs)
 "S-SPC" 'hydra-smartparens/body)

(provide 'bb-commander)
