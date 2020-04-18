(defun bb-eshell-projectile-here ()
  (interactive)
  (let ((project (projectile-project-root)))
    (if project
        (projectile-with-default-dir project (eshell-toggle))
      (eshell-toggle))))


(defun bb-eval-and-next-paragraph ()
  (interactive)
  (evil-forward-paragraph)
  (call-interactively #'eval-last-sexp))

(defun bb-ivy-switch-buffer ()
  (interactive)
  (let ((buffers (projectile-project-buffer-names)))
    (if (projectile-project-root)
        (ivy-read "Project buffers: " buffers
                  :keymap ivy-switch-buffer-map
                  :action #'ivy--switch-buffer-action
                  :preselect (buffer-name (other-buffer (current-buffer)))
                  :matcher #'ivy--switch-buffer-matcher
                  :caller 'ivy-switch-buffer)
      (ivy-switch-buffer))))

(provide 'bb-func)
