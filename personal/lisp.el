;; display the majors mode with buffer-mode cmd
(defun buffer-mode (&optional buffer-or-name)
  (interactive)
  "Returns the major mode associated with a buffer.
If buffer-or-name is nil return current buffer's mode."
  (message "%s" major-mode)
  (buffer-local-value 'major-mode
		      (if buffer-or-name (get-buffer buffer-or-name) (current-buffer))))



;; https://stackoverflow.com/questions/57304580/how-to-move-an-emacs-buffer-to-a-new-window
(defun bb/tear-off-window ()
  "Delete the selected window, and create a new frame displaying its buffer."
  (interactive)
  (let* ((window (selected-window))
     (buf (window-buffer window))
     (frame (make-frame)))          
    (select-frame frame)
    (switch-to-buffer buf)
    (delete-window window)))

;; currently not used, using smart-hungry-delete instead
(defun contextual-backspace ()
  "Hungry whitespace or delete word depending on context."
  (interactive)
  (if (looking-back "[[:space:]\n]\\{2,\\}" (- (point) 2))
      (while (looking-back "[[:space:]\n]" (- (point) 1))
        (delete-char -1))
    (cond
     ((and (boundp 'smartparens-strict-mode)
           smartparens-strict-mode)
      (sp-backward-kill-word 1))
     ((and (boundp 'subword-mode)
           subword-mode)
      (subword-backward-kill 1))
     (t
      (backward-kill-word 1)))))

(defun update_tags ()
  (interactive)
  (shell-command "gtags --gtagslabel=ctags"))

(defun thunar ()
  (interactive)
  (shell-command "thunar &")
  (delete-window (get-buffer-window "*Async Shell Command*")))

(defun xfce4-terminal ()
  (interactive)
  (shell-command "xfce4-terminal &")
  (delete-window (get-buffer-window "*Async Shell Command*")))

;;; View tags other window
(defun view-tag-other-window (tagname &optional next-p regexp-p)
  "Same as `find-tag-other-window' but doesn't move the point"
  (interactive (find-tag-interactive "View tag other window: "))
  (let ((window (get-buffer-window)))
    (find-tag-other-window tagname next-p regexp-p)
    (recenter 0)
        (select-window window)))

;; save the most recent macro at the end of .emacs
(defun save-macro (name)
    "save a macro. Take a name as argument
     and save the last defined macro under
     this name at the end of your .emacs"
     (interactive "SName of the macro :")  ; ask for the name of the macro
     (kmacro-name-last-macro name)         ; use this name for the macro
     (find-file user-init-file)            ; open ~/.emacs or other user init file
     (goto-char (point-max))               ; go to the end of the .emacs
     (newline)                             ; insert a newline
     (insert-kbd-macro name)               ; copy the macro
     (newline)                             ; insert a newline
     (switch-to-buffer nil))               ; return to the initial buffer

;; open eshell function
(add-hook
 'eshell-mode-hook
 (lambda ()
   (setq pcomplete-cycle-completions nil)))

(defun eshell-here ()
  "Opens up a new shell in the directory associated with the
current buffer's file. The eshell is renamed to match that
directory to make multiple eshell windows easier."
  (interactive)
  (let* ((parent (if (buffer-file-name)
                     (file-name-directory (buffer-file-name))
                   default-directory))
         (height (/ (window-total-height) 3))
         (name   (car (last (split-string parent "/" t)))))
    (split-window-vertically (- height))
    (other-window 1)
    (eshell "new")
    (rename-buffer (concat "*eshell: " name "*"))

    (insert (concat "ls"))
    (eshell-send-input)))


;; back / forward button

(defun marker-is-point-p (marker)
  "test if marker is current point"
  (and (eq (marker-buffer marker) (current-buffer))
       (= (marker-position marker) (point))))

(defun push-mark-maybe ()
  "push mark onto `global-mark-ring' if mark head or tail is not current location"
  (if (not global-mark-ring) (error "global-mark-ring empty")
    (unless (or (marker-is-point-p (car global-mark-ring))
                (marker-is-point-p (car (reverse global-mark-ring))))
      (push-mark))))


(defun backward-global-mark ()
  "use `pop-global-mark', pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark))

(defun forward-global-mark ()
  "hack `pop-global-mark' to go in reverse, pushing current point if not on ring."
  (interactive)
  (push-mark-maybe)
  (setq global-mark-ring (nreverse global-mark-ring))
  (when (marker-is-point-p (car global-mark-ring))
    (call-interactively 'pop-global-mark))
  (call-interactively 'pop-global-mark)
  (setq global-mark-ring (nreverse global-mark-ring)))

(defun thunar ()
  (interactive)
  (shell-command "thunar &")
  (delete-window (get-buffer-window "*Async Shell Command*")))
