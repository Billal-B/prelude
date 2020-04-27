(require 'term)

;; source :
;; https://echosa.github.io/blog/2012/06/06/improving-ansi-term/

;; close term buffer on exit
(defun oleh-term-exec-hook ()
  (let* ((buff (current-buffer))
         (proc (get-buffer-process buff)))
    (set-process-sentinel
     proc
     `(lambda (process event)
        (if (string= event "finished\n")
            (kill-buffer ,buff))))))
(add-hook 'term-exec-hook 'oleh-term-exec-hook)

;; force zsh and don't ask
(defvar my-term-shell "/bin/zsh")
(defadvice ansi-term (before force-bash)
  (interactive (list my-term-shell)))
(ad-activate 'ansi-term)

;; fix some utf8 chars
(defun my-term-use-utf8 ()
  (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
(add-hook 'term-exec-hook 'my-term-use-utf8)

;; fix yank in term
(defun my-term-paste (&optional string)
  (interactive)
  (process-send-string
   (get-buffer-process (current-buffer))
   (if string string (current-kill 0))))

(defun my-term-hook ()
  (goto-address-mode)
  (define-key term-raw-map "\C-y" 'my-term-paste))

(add-hook 'term-mode-hook 'my-term-hook)

(defun jnm/term-toggle-mode ()
  "Toggles term between line mode and char mode"
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(define-key term-mode-map (kbd "S-<SPC>") 'jnm/term-toggle-mode)
(define-key term-raw-map (kbd "S-<SPC>") 'jnm/term-toggle-mode)

(defalias 'term 'multi-term)

;;;;;;;;;;; ESHELL ;;;;;;;;;;;;;
(use-package virtualenvwrapper
  :ensure t)
(use-package eshell-prompt-extras
  :config
  (with-eval-after-load "esh-opt"
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda))

  (with-eval-after-load "esh-opt"
    (require 'virtualenvwrapper)
    (venv-initialize-eshell)
    (autoload 'epe-theme-lambda "eshell-prompt-extras")
    (setq eshell-highlight-prompt nil
          eshell-prompt-function 'epe-theme-lambda))
  :ensure t)

(use-package eshell-toggle
  :ensure t)


;;;###autoload
(defface +eshell-prompt-pwd '((t (:inherit font-lock-constant-face)))
  "TODO"
  :group 'eshell)

;;;###autoload
(defface +eshell-prompt-git-branch '((t (:inherit font-lock-builtin-face)))
  "TODO"
  :group 'eshell)

(defun +eshell--current-git-branch ()
  ;; TODO Refactor me
  (cl-destructuring-bind (status . output)
      (doom-call-process "git" "symbolic-ref" "-q" "--short" "HEAD")
    (if (equal status 0)
        (format " [%s]" output)
      (cl-destructuring-bind (status . output)
          (doom-call-process "git" "describe" "--all" "--always" "HEAD")
        (if (equal status 0)
            (format " [%s]" output)
          "")))))
(defun +eshell-default-prompt-fn ()
  "Generate the prompt string for eshell. Use for `eshell-prompt-function'."
  (require 'shrink-path)
  (concat (if (bobp) "" "\n")
          (let ((pwd (eshell/pwd)))
            (propertize (if (equal pwd "~")
                            pwd
                          (abbreviate-file-name (shrink-path-file pwd)))
                        'face '+eshell-prompt-pwd))
          (propertize (+eshell--current-git-branch)
                      'face '+eshell-prompt-git-branch)
          "\n"
          (propertize "λ " 'face (if (zerop eshell-last-command-status) 'success 'error))))

(setq eshell-banner-message
      '(format "%s %s\n"
               (propertize (format " %s " (string-trim (buffer-name)))
                           'face 'mode-line-highlight)
               (propertize (current-time-string)
                           'face 'font-lock-keyword-face))
      eshell-scroll-to-bottom-on-input 'all
      eshell-scroll-to-bottom-on-output 'all
      eshell-buffer-shorthand t
      eshell-kill-processes-on-exit t
      eshell-hist-ignoredups t
      ;; don't record command in history if prefixed with whitespace
      ;; TODO Use `eshell-input-filter-initial-space' when Emacs 25 support is dropped
      eshell-input-filter (lambda (input) (not (string-match-p "\\`\\s-+" input)))
      ;; em-prompt
      eshell-prompt-regexp "^.* λ "
      eshell-prompt-function #'+eshell-default-prompt-fn
      ;; em-glob
      eshell-glob-case-insensitive t
      eshell-error-if-no-glob t)

(add-hook! 'eshell-mode-hook
  (defun +eshell-remove-fringes-h ()
    (set-window-fringes nil 0 0)
    (set-window-margins nil 1 nil)))

(add-hook! 'eshell-mode-hook
  (defun +eshell-enable-text-wrapping-h ()
    (visual-line-mode +1)
    (set-display-table-slot standard-display-table 0 ?\ )))

(add-hook 'eshell-mode-hook #'hide-mode-line-mode)


(use-package eshell-z
  :config
  (add-hook 'eshell-mode-hook
            (defun my-eshell-mode-hook ()
              (require 'eshell-z)))
  (unless (file-exists-p eshell-z-freq-dir-hash-table-file-name)
    (setq eshell-z-freq-dir-hash-table-file-name
          (expand-file-name "z" eshell-directory-name)))
  :ensure t)

;; see : https://www.masteringemacs.org/article/complete-guide-mastering-eshell
;; TODO not working
;; (require 'eshell)
;; (require 'em-smart)
;; (setq eshell-where-to-jump 'begin)
;; (setq eshell-review-quick-commands nil)
;; (setq eshell-smart-space-goes-to-end t)

(provide 'bb-term)
