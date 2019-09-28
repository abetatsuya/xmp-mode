XMP-mode is an Emacs major mode for editing [XcalableMP](http://www.xcalablemp.org/) programs.

Requirement
===========
Emacsen (including font-lock-mode.el, c-mode.el, and f90-mode.el)

Install
=======
Decompress xmp-mode.zip.
(e.g., $ unzip xmp-mode.zip)

Put xmp-*.el in a directory (e.g. ~/lib/lisp).

Edit ~/.emacs as follows,

	(setq load-path (append '("~/lib/lisp") load-path))
	(require 'xmp-c-mode)
	(add-to-list 'auto-mode-alist '("\\.c" . xmp-c-mode))
	(require 'xmp-f-mode)
	(add-to-list 'auto-mode-alist '("\\.f90" . xmp-f-mode))

Uninstall
=========
Remove the above description in ~/.emacs and
$ rm -rf xmp-mode

Version
=======
0.0.1 (compatible with XcalableMP Application Program Interface Version
1 DRAFT 1.0)

Copyright and License
=====================
Copyright 2011 Tatsuya Abe

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

Acknowledgment
==============
The author thanks Tasuku Hiraishi for some advices of Lisp programming.
