;; taken from https://www.mortens.dev/blog/emacs-and-the-language-server-protocol/
(use-package lsp-mode
  :requires hydra helm helm-lsp
  :ensure t)

(add-hook 'python-mode-hook #'lsp)

(setq netrom--general-lsp-hydra-heads
      '(;; Xref
        ("d" xref-find-definitions "Definitions" :column "Xref")
        ("D" xref-find-definitions-other-window "-> other win")
        ("r" xref-find-references "References")
        ("s" netrom/helm-lsp-workspace-symbol-at-point "Helm search")
        ("S" netrom/helm-lsp-global-workspace-symbol-at-point "Helm global search")

        ;; Peek
        ("C-d" lsp-ui-peek-find-definitions "Definitions" :column "Peek")
        ("C-r" lsp-ui-peek-find-references "References")
        ("C-i" lsp-ui-peek-find-implementation "Implementation")

        ;; LSP
        ("p" lsp-describe-thing-at-point "Describe at point" :column "LSP")
        ("C-a" lsp-execute-code-action "Execute code action")
        ("R" lsp-rename "Rename")
        ("t" lsp-goto-type-definition "Type definition")
        ("i" lsp-goto-implementation "Implementation")
        ("f" helm-imenu "Filter funcs/classes (Helm)")
        ("C-c" lsp-describe-session "Describe session")

        ;; Flycheck
        ("l" lsp-ui-flycheck-list "List errs/warns/notes" :column "Flycheck"))

      netrom--misc-lsp-hydra-heads
      '(;; Misc
        ("q" nil "Cancel" :column "Misc")
        ("b" pop-tag-mark "Back")))

;; Create general hydra.
(eval `(defhydra netrom/lsp-hydra (:color blue :hint nil)
         ,@(append
            netrom--general-lsp-hydra-heads
            netrom--misc-lsp-hydra-heads)))

(add-hook 'lsp-mode-hook
          (lambda () (local-set-key (kbd "S-<SPC>") 'netrom/lsp-hydra/body)))
(define-key lsp-ui-mode-map (kbd "<S-down-mouse-1>") 'lsp-find-references)

(setq lsp-prefer-flymake nil)


(use-package helm-lsp
  :ensure t)

(defun netrom/helm-lsp-workspace-symbol-at-point ()
  (interactive)
  (let ((current-prefix-arg t))
    (call-interactively #'helm-lsp-workspace-symbol)))

(defun netrom/helm-lsp-global-workspace-symbol-at-point ()
  (interactive)
  (let ((current-prefix-arg t))
    (call-interactively #'helm-lsp-global-workspace-symbol)))


(use-package lsp-ui
  :ensure t)

(use-package company-lsp
  :requires company
  :ensure t)

(push 'company-lsp company-backends)

;; Disable client-side cache because the LSP server does a better job.
(setq company-transformers nil
      company-lsp-async t
      company-lsp-cache-candidates nil)

(use-package yasnippet
  :ensure t)

(provide 'bb-lsp)
