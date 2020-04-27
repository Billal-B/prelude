(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(setq use-package-always-defer t
      use-package-always-ensure nil)

(use-package multiple-cursors)

(use-package hydra)

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

(use-package projectile
  :config
  (projectile-mode +1)
  ;; allows files to be ignored
  (setq projectile-enable-caching t)
  (setq projectile-indexing-method 'hybrid)
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

(use-package docker
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

;; allows creating child frame
(use-package posframe
  :config
  (setq posframe-mouse-banish nil)
  :ensure t)

;; others
(beacon-mode 0)
(super-save-mode 1)
