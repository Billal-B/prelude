;; taken from https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/
(use-package lsp-mode
  :requires hydra helm helm-lsp
  :hook
  (lsp-mode . lsp-lens-mode)
  :config (setq lsp-prefer-flymake nil)
  :ensure t)

;; Enable nice rendering of diagnostics like compile errors.
(use-package flycheck
  :init (global-flycheck-mode)
  :ensure t)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode)
  :config
  (lsp-ui-imenu-enable nil)
  (lsp-ui-peek-enable t)
  (setq lsp-ui-doc-mode t
        lsp-ui-doc-position 'bottom
        lsp-ui-doc-alignment 'window
        lsp-ui-doc-include-signature t
        lsp-ui-sideline-mode t
        lsp-ui-sideline-show-hover t
        lsp-ui-sideline-show-diagnostics t
        lsp-ui-sideline-ignore-duplicate t
        lsp-ui-sideline-show-symbol t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-sideline-show-code-actions t
        lsp-ui-imenu-enable t
        lsp-ui-imenu-colors `(,(face-foreground 'font-lock-keyword-face)
                              ,(face-foreground 'font-lock-string-face)
                              ,(face-foreground 'font-lock-constant-face)
                              ,(face-foreground 'font-lock-variable-name-face)))
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (define-key lsp-ui-mode-map (kbd "C-q") 'lsp-ui-doc-glance)
  (define-key lsp-ui-mode-map (kbd "<C-mouse-1>") 'lsp-find-references)
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



(defhydra hydra-lsp (:exit t :hint nil)
  "
 Buffer^^               Server^^                   Symbol
-------------------------------------------------------------------------------------
 [_f_] format           [_M-r_] restart            [_d_] declaration  [_i_] implementation  [_o_] documentation
 [_m_] imenu            [_S_]   shutdown           [_D_] definition   [_t_] type            [_r_] rename
 [_x_] execute action   [_M-s_] describe session   [_R_] references   [_s_] signature"
  ("d" lsp-find-declaration)
  ("D" lsp-ui-peek-find-definitions)
  ("R" lsp-ui-peek-find-references)
  ("i" lsp-ui-peek-find-implementation)
  ("t" lsp-find-type-definition)
  ("s" lsp-signature-help)
  ("o" lsp-describe-thing-at-point)
  ("r" lsp-rename)

  ("f" lsp-format-buffer)
  ("m" lsp-ui-imenu)
  ("x" lsp-execute-code-action)

  ("M-s" lsp-describe-session)
  ("M-r" lsp-restart-workspace)
  ("S" lsp-shutdown-workspace))


(provide 'bb-lsp)
