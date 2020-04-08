(unless (package-installed-p 'pyvenv)
  (package-install 'pyvenv))

(unless (package-installed-p 'elpy)
  (package-install 'elpy))


;; bb conf
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(defalias 'workon 'pyvenv-workon)
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
(setenv "WORKON_HOME" "~/.cache/pypoetry/virtualenvs")
(setq python-shell-interpreter "ipython"
      python-shell-interpreter-args "-i --simple-prompt")
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

(use-package ein
  :ensure t)

;;(add-hook 'python-mode-hook #'lsp-deferred)
;;(require 'dap-python)

(provide 'bb-python)
