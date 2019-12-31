(use-package org-ref
  :ensure t)

(setq org-agenda-custom-commands
      '(("c" "Simple agenda view"
         ((agenda "")
          (alltodo "")))))

;;;; my conf ;;;;
(setq org-latex-inputenc-alist '(("utf8" . "utf8x")))
(setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))

;; better agenda
(setq org-agenda-span 10
      org-agenda-start-on-weekday nil
      org-agenda-start-day "-3d")

;; org-ref
;; see org-ref for use of these variables
(use-package org-ref
  :ensure t)
(require 'org-ref)
(setq org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
      org-ref-default-bibliography '("~/Cours/references.bib")
      org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")
(setq bibtex-completion-bibliography "~/Cours/references.bib"
      bibtex-completion-library-path "~/Dropbox/bibliography/bibtex-pdfs"
      bibtex-completion-notes-path "~/Dropbox/bibliography/helm-bibtex-notes")

;; open pdf with system pdf viewer (works on mac)
(setq bibtex-completion-pdf-open-function
      (lambda (fpath)
        (start-process "open" "*open*" "open" fpath)))

;; alternative
;; (setq bibtex-completion-pdf-open-function 'org-open-file)


;; org
(defun my-org-bindings ()
  (local-set-key "\C-cl" 'org-store-link 'bb-org-modes-key-map)
  (local-set-key "\C-ca" 'org-agenda 'bb-org-modes-key-map)
  (local-set-key "\C-cb" 'org-iswitchb 'bb-org-modes-key-map)
  (local-set-key (kbd "<f9>") 'bb-org-modes-key-map)
  (local-set-key (kbd "<S-iso-lefttab>") 'outline-hide-entry))
(add-hook 'org-mode-hook 'my-org-bindings)

(progn
  ;; define a prefix keymap
  (define-prefix-command 'bb-org-modes-key-map)
  (define-key bb-org-modes-key-map (kbd "f") 'helm-org-in-buffer-headings)
  (define-key bb-org-modes-key-map (kbd "r") 'org-insert-r-command)
  (define-key bb-org-modes-key-map (kbd "<f9>") 'org-insert-heading)
  (define-key bb-org-modes-key-map (kbd "c") 'org-insert-r-command))

;; beamer integration
(require 'ox-beamer)
(require 'ox-latex)
;;(add-hook 'org-agenda-mode-hook 'org-agenda-log-mode)

(provide 'bb-org)
