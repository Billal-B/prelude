(require 'dash)

(use-package load-dir
  :ensure t)

(defvar doom-emacs-dir "~/.emacs.d") ; TODO track whoever use doom-bin-dir and removes it
(load-file "~/.emacs.d.doom/core/core-lib.el")
(load-file "~/.emacs.d.doom/core/core.el")
(load-file "~/.emacs.d.doom/core/core-packages.el")
(load-file "~/.emacs.d.doom/core/core-modules.el")
(load-dir-one "~/.emacs.d.doom/core/autoload")
(load-file "~/.emacs.d.doom/core/packages.el")
(load-file "~/.emacs.d.doom/core/core-keybinds.el")


;; TODO handles disabled modules better
(setq disabled-modules (list "workspaces"))

(defmacro featurep! (category &optional module flag)
  (let ((module-name (symbol-name module)))
    (not (member module-name disabled-modules))))


(provide 'doom-core)
