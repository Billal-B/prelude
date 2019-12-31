(use-package smartparens
  :ensure t)

(require 'smartparens-config)

(smartparens-global-mode t)
;;;;; default conf of the author
(defhydra smartparens-hydra (global-map "S-<SPC>")
  "Smartparens"
  ("e" sp-end-of-sexp "End")
  ("a" sp-beginning-sexp "Begin")
  ("f" sp-forward-sexp "Forward")
  ("b" sp-backward-sexp "Backward")
  ("k" sp-kill-sexp "Kill" :color blue)
  ("s" sp-forward-slurp-sexp "Slurp F" :color blue)
  ("S" sp-backward-slurp-sexp "Slurp B" :color blue)
  ("q" nil "Quit" :color blue))
;;;;; end of the default conf
(provide 'bb-smartparens)
