(require 'xmp-common)

(defun xmp-c-compile ()
  (interactive)
  (let (file buff opts)
    (setq file (buffer-file-name))
    (setq opts (read-string "Option: "))
    (setq buff (get-buffer-create "*xmp-c-compile-buffer*"))
    (with-current-buffer buff (erase-buffer))
    (call-process-shell-command "xmpcc" nil buff nil opts file)
    (display-buffer buff)
    )
  )

(define-derived-mode xmp-c-mode c-mode "XcalableMP/C"
  (xmp-make-function "#pragma xmp ")
  (define-key xmp-c-mode-map "\C-c\C-c" 'xmp-c-compile)
  (let ((tmp xmp-directive-keybind-message))
    (while (not (null tmp))
      (let (
 	    (xmp-directive (car (cdr (car tmp))))
 	    (xmp-keybind (car (car tmp)))
 	    (xmp-message (substring (symbol-name (car (cdr (car tmp)))) 11 nil))
 	    )
 	(define-key xmp-c-mode-map xmp-keybind xmp-directive)
 	(setq tmp (cdr tmp))
 	)
      )
    )
  (define-key xmp-c-mode-map [menu-bar] (make-sparse-keymap))
  (define-key xmp-c-mode-map [menu-bar xmp-c-func] (cons "XcalableMP" (make-sparse-keymap "XcalableMP")))
  (define-key xmp-c-mode-map [menu-bar xmp-c-func xmp-c-compile] '("Compile" . xmp-c-compile))
  (xmp-add-function-to-menubar xmp-c-mode-map xmp-c-func)
  (font-lock-add-keywords
   'xmp-c-mode
   (xmp-font-lock-keywords (concat "#" xmp-spc "*pragma" xmp-sep "xmp") "\\[" "\\]")
   )
  )

(provide 'xmp-c-mode)