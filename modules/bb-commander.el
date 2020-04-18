(use-package general
  :config
  (require 'general)
  ;; disable for prefix key
  (define-key evil-normal-state-map (kbd "SPC") nil)
  (define-key evil-normal-state-map (kbd "w") nil)
  :ensure t)

(general-create-definer leader-def
  ;; :prefix my-leader
  :keymaps '(normal visual insert emacs)
  :prefix "SPC"
  :non-normal-prefix "<f12>")

;; ** Global Keybindings
(leader-def
  "e" '(:ignore t :which-key "Edits")
  "ee" 'helm-show-kill-ring
  "eu" 'undo-tree-visualize
  "f" '(:ignore t :which-key "Files")
  "fd" 'dired-jump
  "fD" 'ranger
  "ff" 'helm-find-files
  "fg" 'thunar
  "fl" 'helm-locate
  "fn" 'deft
  "fN" 'deft-new-file
  "fr" 'helm-recentf
  "fs" 'crux-create-scratch-buffer
  "ft" 'treemacs
  "o" '(:ignore t :which-key "Search (occur/ag)")
  "oa" 'helm-do-grep-ag
  "oA" 'helm-do-ag
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
  "wc" 'bb/tear-off-window
  "ww" 'toggle-truncate-lines
  ;; others
  "a" 'org-capture
  "A" 'org-agenda
  "b" 'helm-mini
  "p" 'projectile-command-map
  "RET" 'helm-resume
  "!" 'helm-company
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

;; ivy/counsel
(general-define-key
 :keymaps 'ivy-minibuffer-map
 "TAB" 'ivy-call
 "C-z" 'ivy-dispatching-done
 "RET" 'ivy-alt-done
 )

;; smartparens bindings
(general-define-key
 :keymaps '(normal insert emacs)
 "S-SPC" 'hydra-smartparens/body)

(general-create-definer mode-leader
  :prefix "<tab>")

(mode-leader python-mode-map
  "²" 'hydra-lsp/body
  "w" 'pyvenv-workon)

;;;; python bindings
;;(general-define-key
 ;;:states '(normal visual)
 ;;:keymaps 'python-mode-map
 ;;"SPC SPC" 'hydra-lsp/body
 ;;"SPC w" 'pyvenv-workon)

;; cider/clojure bingings
;;(general-define-key
 ;;:states '(normal visual)
 ;;:keymaps 'cider-mode-map
 ;;"ù" 'cider-test-rerun-test
 ;;"M-ù" 'cider-test-rerun-failed-tests
 ;;"SPC SPC d" 'cider-hydra-doc/body
 ;;"SPC SPC e" 'cider-hydra-eval/body
 ;;"SPC SPC r" 'cider-hydra-repl/body
 ;;"SPC SPC u" 'cider-hydra-test/body
 ;;"SPC SPC T" 'cider-test-rerun-test
 ;;"SPC SPC t" 'cider-test-run-test)
(mode-leader cider-mode-map
 "<tab>" 'cider-test-rerun-test
 "d" 'cider-hydra-doc/body
 "e" 'cider-hydra-eval/body
 "r" 'cider-hydra-repl/body
 "u" 'cider-hydra-test/body
 "T" 'cider-test-rerun-failed-tests
 "t" 'cider-test-run-test)

;; elisp bindins
(general-define-key
 :states 'normal
 :keymaps 'emacs-lisp-mode-map
 "!" 'bb-eval-and-next-paragraph)

(provide 'bb-commander)
