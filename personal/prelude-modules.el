; Uncomment the modules you'd like to use and restart Prelude afterwards
(require 'prelude-erc) ;; Emacs IRC client
;;(require 'prelude-ido) ;; Super charges Emacs completion for C-x C-f and more
;; (require 'prelude-ivy) ;; A mighty modern alternative to ido
(require 'prelude-helm) ;; Interface for narrowing and search
(require 'prelude-helm-everywhere) ;; Enable Helm everywhere
(require 'prelude-company)
;; (require 'prelude-key-chord) ;; Binds useful features to key combinations
;; (require 'prelude-evil)

;;; Programming languages support
(require 'prelude-c)
(require 'prelude-clojure)
;; (require 'prelude-coffee)
(require 'prelude-common-lisp)
;; (require 'prelude-css)
(require 'prelude-emacs-lisp)
;; (require 'prelude-erlang)
;; (require 'prelude-elixir)
;; (require 'prelude-go)
;; (require 'prelude-haskell)
(require 'prelude-js)
;; (require 'prelude-latex)
(require 'prelude-lisp)
;; (require 'prelude-lsp)
;; (require 'prelude-ocaml)
(require 'prelude-org) ;; Org-mode helps you keep TODO lists, notes and more
(require 'prelude-perl)
;;(require 'prelude-python)
(require 'prelude-ruby)
;; (require 'prelude-rust)
;; (require 'prelude-scala)
(require 'prelude-scheme)
(require 'prelude-shell)
; (require 'prelude-scss)
;; (require 'prelude-ts)
;; (require 'prelude-web) ;; Emacs mode for web templates
(require 'prelude-xml)
;;require 'prelude-yaml)


(require 'doom-core)
;; LANG
(require 'bb-clojure)
(require 'bb-groovy)
(require 'bb-io)
(require 'bb-python)
(require 'bb-ruby)
(require 'bb-scala)
(require 'bb-sql)
;; OTHERS
(require 'bb-company)
;;(require 'bb-dired)
(require 'bb-evil)
(require 'bb-helm) ; require prelude-helm 
;;(require 'bb-ivy) ; require prelude-ivy
;;(require 'bb-lsp)
(require 'bb-org)
(require 'bb-term)
(require 'bb-smartparens)
(require 'bb-appearance)
(require 'bb-func)
(require 'bb-commander) ; must be loaded last
