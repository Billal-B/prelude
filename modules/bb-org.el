(use-package org-ref
  :ensure t)

(add-to-list 'auto-mode-alist '("\\.txt\\'" . org-mode))

;;;; my conf ;;;;
;; (setq org-latex-inputenc-alist '(("utf8" . "utf8x")))
;;
;; ;; better agenda
;; (setq org-agenda-span 10
;;       org-agenda-start-on-weekday nil
;;       org-agenda-start-day "-3d")
;;
(setq org-agenda-files '("~/org-files/"))
;;
;;
;; ;; org-ref + write paper etc
;; ;; see org-ref for use of these variables
;; ;; (use-package org-ref
;; ;;   :ensure t)
;; ;; (require 'org-ref)
;; ;; (setq org-ref-bibliography-notes "~/Dropbox/bibliography/notes.org"
;; ;;       org-ref-default-bibliography '("~/Cours/references.bib")
;; ;;       org-ref-pdf-directory "~/Dropbox/bibliography/bibtex-pdfs/")
;; ;; (setq bibtex-completion-bibliography "~/Cours/references.bib"
;; ;;       bibtex-completion-library-path "~/Dropbox/bibliography/bibtex-pdfs"
;; ;;       bibtex-completion-notes-path "~/Dropbox/bibliography/helm-bibtex-notes")
;; ;; (setq reftex-default-bibliography '("~/Dropbox/bibliography/references.bib"))
;; ;; beamer integration
;; ;; (require 'ox-beamer)
;; ;; (require 'ox-latex)
;; ;; open pdf with system pdf viewer (works on mac)
;; ;; (setq bibtex-completion-pdf-open-function
;; ;;       (lambda (fpath)
;; ;;         (start-process "open" "*open*" "open" fpath)))
;;
;; ;; org
;; (defun my-org-bindings ()
;;   (local-set-key "\C-cl" 'org-store-link 'bb-org-modes-key-map)
;;   (local-set-key "\C-ca" 'org-agenda 'bb-org-modes-key-map)
;;   (local-set-key "\C-cb" 'org-iswitchb 'bb-org-modes-key-map)
;;   (local-set-key (kbd "<f9>") 'bb-org-modes-key-map)
;;   (local-set-key (kbd "<S-iso-lefttab>") 'outline-hide-entry))
;; (add-hook 'org-mode-hook 'my-org-bindings)
;;
;; (progn
;;   ;; define a prefix keymap
;;   (define-prefix-command 'bb-org-modes-key-map)
;;   (define-key bb-org-modes-key-map (kbd "f") 'helm-org-in-buffer-headings)
;;   (define-key bb-org-modes-key-map (kbd "r") 'org-insert-r-command)
;;   (define-key bb-org-modes-key-map (kbd "<f9>") 'org-insert-heading)
;;   (define-key bb-org-modes-key-map (kbd "c") 'org-insert-r-command))
;;
;; ;;(add-hook 'org-agenda-mode-hook 'org-agenda-log-mode)


;; https://emacs.stackexchange.com/questions/48444/grouping-tasks-in-org-agenda
(use-package org-super-agenda
  :ensure t
  :config
  (setq org-super-agenda-groups '((:name "Today"
                                         :time-grid t
                                         :scheduled today)
                                  (:name "Due today"
                                         :deadline today)
                                  (:name "Important"
                                         :priority "A")
                                  (:name "Overdue"
                                         :deadline past)
                                  (:name "Due soon"
                                         :deadline future)
                                  (:name "Waiting"
                                         :todo "WAIT"))))

<<<<<<< 093f93a70bd73b5ece4bcdc0775d1796cdd26299
=======

>>>>>>> fixes ruby conf plus calendar auto startup
;; capture templates
(setq org-capture-templates
      '(("t" "Todo (ADYL)" entry (file+headline "~/org-files/agenda-adyl.org" "ADYL")
         "* TODO %?\n  %U\n")
        ("T" "Todo" entry (file+headline "~/org-files/agenda.org" "Others")
         "* TODO %?\n  %U\n")
        ("a" "Agenda" entry (file+datetree "~/org-files/agenda.org" "Agenda ADYL")
         "* %?\nEntered on %U\n")))
(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-compact-blocks t
      org-agenda-start-day nil ;; i.e. today
      org-agenda-span 1
      org-agenda-start-on-weekday nil)
(setq org-agenda-custom-commands
      '(("c" "Super view"
         ((agenda "" ((org-agenda-overriding-header "")
                      (org-super-agenda-groups
                       '((:name "Today"
                                :time-grid t
                                :date today
                                :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:log t)
                          (:name "To refile"
                                 :file-path "refile\\.org")
                          (:name "Next to do"
                                 :todo "NEXT"
                                 :order 1)
                          (:name "Important"
                                 :priority "A"
                                 :order 6)
                          (:name "Today's tasks"
                                 :file-path "journal/")
                          (:name "Due Today"
                                 :deadline today
                                 :order 2)
                          (:name "Scheduled Soon"
                                 :scheduled future
                                 :order 8)
                          (:name "Overdue"
                                 :deadline past
                                 :order 7)
                          (:name "Meetings"
                                 :and (:todo "MEET" :scheduled future)
                                 :order 10)
                          (:discard (:not (:todo "TODO")))))))))))


(provide 'bb-org)
