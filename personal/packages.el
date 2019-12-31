(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(use-package multiple-cursors
  :bind (("C->" . mc/mark-all-dwim)
         ("C-<" . mc/edit-lines))
  :ensure t)

(use-package hydra
  :ensure t)

(use-package smart-hungry-delete
  :bind ("C-<backspace>" . smart-hungry-delete-backward-char)
  :ensure t)

;; better regexp support
(use-package pcre2el
  :ensure t)
(use-package visual-regexp-steroids
  :bind ("M-%" . vr/query-replace)
  :ensure t)
(require 'visual-regexp-steroids)


(use-package ranger
  :bind ("C-x f" . ranger)
  :ensure t)

(use-package dumb-jump
  :bind ("S-<f5>" . dumb-jump-back)
  :bind ("M-<f5>" . dumb-jump-go-other-window)
  :bind ("<f5>" . dumb-jump-go)
  :config
  (setq dumb-jump-confirm-jump-to-modified-file nil)
  (setq -jump-selector 'helm)
  (setq dumb-jump-force-searcher 'ag)
  :ensure t)


(use-package projectile
  :config
  (projectile-mode +1)
  :ensure t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; CONFIG ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; flyspell
(setq prelude-flyspell nil)

;; Elscreen
;;(elscreen-start)
;;(elscreen-set-prefix-key (kbd "M-n"))
;;(setq elscreen-display-tab nil) ; disable tabs display

;; doc view mode
(add-hook 'doc-view-mode-hook 'auto-revert-mode) ;; auto reload the file opened with doc view

;; tramp
(setq tramp-default-method "ssh")

;; ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)


;; zeal
(add-hook 'clojure-mode-hook
          (lambda () (setq zeal-at-point-docset '("clojure" "opencv"))))

;; open pdf files with xpdf by default
(use-package openwith
  :ensure t)

(openwith-mode t)
(setq openwith-associations '(("\\.pdf\\'" "zathura" (file))))
(setq openwith-associations '(("\\.jpg\\'" "feh" (file))))
(setq openwith-associations '(("\\.png\\'" "feh" (file))))

;; here to fix a bug with undo tree
(use-package undo-tree
  :load-path "site-lisp/undo-tree/undo-tree")


(use-package restart-emacs
  :ensure t)

;; docker
(use-package docker
  :ensure t)

;; treemacs
(use-package treemacs
  :ensure t)

(use-package deft
  :ensure t)

(use-package terminal-here
  :ensure t)

;; handle very large files
(use-package vlf
  :config
  (require 'vlf-setup)
  :ensure t)

;; others
(beacon-mode 0)
(super-save-mode 1)
