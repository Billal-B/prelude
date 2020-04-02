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
  :keymaps '(normal insert emacs)
  :prefix "SPC"
  :non-normal-prefix "<f12>"
  :keymaps 'override
  "e" '(:ignore t :which-key "Edits")
  "eu" 'undo-tree-visualize
  "ee" 'helm-show-kill-ring
  "f" '(:ignore t :which-key "Files")
  "fr" 'helm-recentf
  "ff" 'helm-find-files
  "fd" 'dired-jump
  "fl" 'helm-locate
  "ft" 'treemacs
  "fn" 'deft
  "fN" 'deft-new-file
  "fs" 'crux-create-scratch-buffer
  "o" '(:ignore t :which-key "Search (occur/ag)")
  "oa" 'helm-do-ag
  "og" 'helm-do-grep-ag
  "oo" 'helm-occur
  "oO" 'helm-swoop
  "oM" 'helm-multi-swoop
  "om" 'helm-multi-swoop-all
  "t" '(:ignore t :which-key "Tools")
  "tt" 'terminal-here
  "td" 'docker
  "tm" 'magit-status
  "tg" 'thunar
  "tk" 'kubernetes-overview
  "t+" 'calc
  "w" '(:ignore t :which-key "Window")
  "ww" 'bb/tear-off-window
  "wm" 'menu-bar-mode
  ;; others
  "a" 'org-capture
  "A" 'org-agenda
  "M-x" 'helm-M-x ; useful in cases of bugs
  "p" 'projectile-command-map
  "b" 'helm-buffers-list
  "RET" 'helm-resume
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

(provide 'bb-commander)
