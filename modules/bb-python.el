(unless (package-installed-p 'pyvenv)
  (package-install 'pyvenv))

(unless (package-installed-p 'elpy)
  (package-install 'elpy))


;; bb conf
(elpy-enable)
(setq elpy-rpc-backend "jedi")
(defalias 'workon 'pyvenv-workon)
(add-hook 'elpy-mode-hook (lambda () (highlight-indentation-mode -1)))
(setenv "WORKON_HOME" "~/.conda/envs")
(setq python-shell-interpreter "jupyter"
      python-shell-interpreter-args "console --simple-prompt"
      python-shell-prompt-detect-failure-warning nil)
(add-to-list 'python-shell-completion-native-disabled-interpreters
             "jupyter")

(use-package ein
  :ensure t)

(provide 'bb-python)
