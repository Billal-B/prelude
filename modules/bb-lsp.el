;; taken from https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/
(use-package lsp-mode
  :requires hydra helm helm-lsp
  :ensure t)


(use-package lsp-ui
  :config
  (lsp-ui-doc-enable nil)
  (lsp-ui-imenu-enable nil)
  (lsp-ui-peek-enable t)
  (lsp-ui-sideline-enable nil)
  (define-key lsp-ui-mode-map [remap xref-find-definitions] #'lsp-ui-peek-find-definitions)
  (define-key lsp-ui-mode-map [remap xref-find-references] #'lsp-ui-peek-find-references)
  (define-key lsp-ui-mode-map (kbd "C-q") 'lsp-ui-doc-glance)
  :ensure t)

(provide 'bb-lsp)
