(defun doom-call-process (command &rest args)
  "Execute COMMAND with ARGS synchronously.

Returns (STATUS . OUTPUT) when it is done, where STATUS is the returned error
code of the process and OUTPUT is its stdout output."
  (with-temp-buffer
    (cons (or (apply #'call-process command nil t nil args)
              -1)
          (string-trim (buffer-string)))))


(defmacro add-hook! (hooks &rest rest)
  "A convenience macro for adding N functions to M hooks.

If N and M = 1, there's no benefit to using this macro over `add-hook'.

This macro accepts, in order:

  1. The mode(s) or hook(s) to add to. This is either an unquoted mode, an
     unquoted list of modes, a quoted hook variable or a quoted list of hook
     variables.
  2. Optional properties :local and/or :append, which will make the hook
     buffer-local or append to the list of hooks (respectively),
  3. The function(s) to be added: this can be one function, a quoted list
     thereof, a list of `defun's, or body forms (implicitly wrapped in a
     lambda).

\(fn HOOKS [:append :local] FUNCTIONS)"
  (declare (indent (lambda (indent-point state)
                     (goto-char indent-point)
                     (when (looking-at-p "\\s-*(")
                       (lisp-indent-defform state indent-point))))
           (debug t))
  (let* ((hook-forms (doom--resolve-hook-forms hooks))
         (func-forms ())
         (defn-forms ())
         append-p
         local-p
         remove-p
         forms)
    (while (keywordp (car rest))
      (pcase (pop rest)
        (:append (setq append-p t))
        (:local  (setq local-p t))
        (:remove (setq remove-p t))))
    (let ((first (car-safe (car rest))))
      (cond ((null first)
             (setq func-forms rest))

            ((eq first 'defun)
             (setq func-forms (mapcar #'cadr rest)
                   defn-forms rest))

            ((memq first '(quote function))
             (setq func-forms
                   (if (cdr rest)
                       (mapcar #'doom-unquote rest)
                     (doom-enlist (doom-unquote (car rest))))))

            ((setq func-forms (list `(lambda (&rest _) ,@rest)))))
      (dolist (hook hook-forms)
        (dolist (func func-forms)
          (push (if remove-p
                    `(remove-hook ',hook #',func ,local-p)
                  `(add-hook ',hook #',func ,append-p ,local-p))
                forms)))
      (macroexp-progn
       (append defn-forms
               (if append-p
                   (nreverse forms)
                 forms))))))

(defun doom--resolve-hook-forms (hooks)
  "Converts a list of modes into a list of hook symbols.

If a mode is quoted, it is left as is. If the entire HOOKS list is quoted, the
list is returned as-is."
  (declare (pure t) (side-effect-free t))
  (let ((hook-list (doom-enlist (doom-unquote hooks))))
    (if (eq (car-safe hooks) 'quote)
        hook-list
      (cl-loop for hook in hook-list
               if (eq (car-safe hook) 'quote)
               collect (cadr hook)
               else collect (intern (format "%s-hook" (symbol-name hook)))))))


(defun doom-enlist (exp)
  "Return EXP wrapped in a list, or as-is if already a list."
  (declare (pure t) (side-effect-free t))
  (if (listp exp) exp (list exp)))

(defun doom-unquote (exp)
  "Return EXP unquoted."
  (declare (pure t) (side-effect-free t))
  (while (memq (car-safe exp) '(quote function))
    (setq exp (cadr exp)))
  exp)



(provide 'doom-core)
