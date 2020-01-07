(set-language-environment "UTF-8")
(global-visual-line-mode t) ; enable visual line mode (soft wrap) globally
(show-paren-mode t)
(electric-pair-mode 1)
(setq eshell-highlight-prompt 1)
(scroll-bar-mode 0)
(menu-bar-mode 1)
(setq scroll-margin 3)
(setq mouse-yank-at-point t)
(global-hi-lock-mode 1)

;; https://mollermara.com/blog/emacs-sysadmin/
(require 'dired-x)


;; mouse scroll
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq prelude-guru nil)
(advice-add #'smartparens-mode :before-until (lambda (&rest args) t)) ;; disable smartparens
(server-start)
