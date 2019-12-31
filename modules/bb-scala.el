(require 'bb-lsp)

(require 'use-package)

;; Enable scala-mode and sbt-mode
(use-package scala-mode
  :interpreter
  ("scala" . scala-mode)
  :ensure t)

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map)
  :ensure t)


(provide 'bb-scala)
