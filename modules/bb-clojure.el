(use-package cider-hydra
  :ensure t)

(add-hook 'clojure-mode-hook #'cider-hydra-mode)

(provide 'bb-clojure)
