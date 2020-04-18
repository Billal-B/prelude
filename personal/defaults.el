(global-visual-line-mode t) ; enable visual line mode (soft wrap) globally
(show-paren-mode t)
(setq eshell-highlight-prompt 1)
(scroll-bar-mode 0)
(menu-bar-mode 1)
(setq scroll-margin 3)
(setq mouse-yank-at-point t)
(global-hi-lock-mode 1)

;; mouse scroll
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse
(setq scroll-step 1) ;; keyboard scroll one line at a time

(setq prelude-guru nil)

;; disable annoying white space mode
(setq prelude-whitespace nil)
(whitespace-mode -1)
(global-whitespace-mode -1)

;; disable smart parens mode
(advice-add #'smartparens-mode :before-until (lambda (&rest args) t)) ;; disable smartparens
(advice-add #'smartparens-global-mode :before-until (lambda (&rest args) t)) ;; disable smartparens
(advice-add #'smartparens-strict-mode :before-until (lambda (&rest args) t)) ;; disable smartparens
(advice-add #'show-smartparens-global-mode :before-until (lambda (&rest args) t)) ;; disable smartparens
(advice-add #'show-smartparens-mode :before-until (lambda (&rest args) t)) ;; disable smartparens
(add-hook 'prelude-prog-mode-hook (lambda () (smartparens-mode -1)) t)
(electric-pair-mode 1) ;; broken when used with smartparens
