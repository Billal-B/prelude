;; taken from https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/
(use-package lsp-mode
  :requires hydra helm helm-lsp
  :hook
  (lsp-mode . lsp-lens-mode)
  :config (setq lsp-prefer-flymake nil)
  :ensure t)

;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
  :init (global-flycheck-mode))


(use-package lsp-ui
  :config
  (lsp-ui-doc-enable nil)
  (lsp-ui-imenu-enable nil)
  (lsp-ui-peek-enable t)
  (lsp-ui-sideline-enable nil)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (define-key lsp-ui-mode-map (kbd "C-q") 'lsp-ui-doc-glance)
  (define-key lsp-ui-mode-map (kbd "<C-mouse-1>") 'lsp-find-references)
  ;;(define-key lsp-ui-mode-map (kbd "<S-down-mouse-1>") 'lsp-find-references)
  :ensure t)

(use-package company-lsp
  :config
  (require 'company-lsp)
  (push 'company-lsp company-backends)
  :ensure t)

(use-package helm-lsp
  :config
  (define-key lsp-ui-mode-map (kbd "M-n") 'helm-lsp-workspace-symbol)
  :ensure t)

;; lsp-mode supports snippets, but in order for them to work you need to use yasnippet
;; If you don't want to use snippets set lsp-enable-snippet to nil in your lsp-mode settings
;;   to avoid odd behavior with snippets and indentation
(use-package yasnippet
  :ensure t)

(use-package posframe
  ;; Posframe is a pop-up tool that must be manually installed for dap-mode
  :ensure t)


(use-package dap-mode
  :hook
  (lsp-mode . dap-mode)
  (lsp-mode . dap-ui-mode)
  :config
  ;; enables mouse hover support
  (dap-tooltip-mode 1)
  ;; use tooltips for mouse hover
  ;; if it is not enabled `dap-mode' will use the minibuffer.
  (tooltip-mode 1)
  ;; displays floating panel with debug buttons
  ;; requies emacs 26+
  (dap-ui-controls-mode 1)
  (add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))
  :ensure t)

(provide 'bb-lsp)
