(defun bb-eshell-projectile-here ()
  (interactive)
  (let ((project (projectile-project-root)))
    (if project
        (projectile-with-default-dir project (eshell-toggle))
      (eshell-toggle))))

(provide 'bb-func)
