(require 'xmp-common)

(define-derived-mode xmp-f-mode f90-mode "XcalableMP/F90"
  (xmp-make-function "!$xmp ")
  (define-key xmp-f-mode-map "\C-c\C-c" 'xmp-f-compile)
  (let ((tmp xmp-directive-keybind-message))
    (while (not (null tmp))
      (let (
 	    (xmp-directive (car (cdr (car tmp))))
 	    (xmp-keybind (car (car tmp)))
 	    (xmp-message (substring (symbol-name (car (cdr (car tmp)))) 11 nil))
 	    )
 	(define-key xmp-f-mode-map xmp-keybind xmp-directive)
 	(setq tmp (cdr tmp))
 	)
      )
    )
  (define-key xmp-f-mode-map [menu-bar] (make-sparse-keymap))
  (define-key xmp-f-mode-map [menu-bar xmp-f-func] (cons "XcalableMP" (make-sparse-keymap "XcalableMP")))
  (define-key xmp-f-mode-map [menu-bar xmp-f-func xmp-f-compile] '("Compile" . xmp-f-compile))
  (xmp-add-function-to-menubar xmp-f-mode-map xmp-f-func)
  (font-lock-add-keywords
   'xmp-f-mode
   (xmp-font-lock-keywords (concat "!$" xmp-spc "*xmp") "(" ")")
   )
)

(provide 'xmp-f-mode)
