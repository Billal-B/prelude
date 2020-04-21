(require 'posframe)

(when (posframe-workable-p)
  (posframe-show
   "* Buffers *"
   :string "Tmp"
   :position (point)
   ))

(provide 'bb-buffers)
