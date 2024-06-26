;;; osx-clipboard-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from osx-clipboard.el

(let ((loads (get 'osx-clipboard 'custom-loads))) (if (member '"osx-clipboard" loads) nil (put 'osx-clipboard 'custom-loads (cons '"osx-clipboard" loads)) (put 'environment 'custom-loads (cons 'osx-clipboard (get 'environment 'custom-loads)))))
(defvar osx-clipboard-mode nil "\
Non-nil if OSX-Clipboard mode is enabled.
See the `osx-clipboard-mode' command
for a description of this minor mode.
Setting this variable directly does not take effect;
either customize it (see the info node `Easy Customization')
or call the function `osx-clipboard-mode'.")
(custom-autoload 'osx-clipboard-mode "osx-clipboard" nil)
(autoload 'osx-clipboard-mode "osx-clipboard" "\
Kill and yank using the OS X clipboard when running in a text terminal.

This mode allows Emacs to use the OS X system clipboard when
running in the terminal, making killing and yanking behave
similarly to a graphical Emacs.  It is not needed in a graphical
Emacs, where NS clipboard integration is built in.

It sets the variables `interprogram-cut-function' and
`interprogram-paste-function' to thin wrappers around the
\"pbcopy\" and \"pbpaste\" command-line programs.

Consider also customizing the variable
  `save-interprogram-paste-before-kill' to `t' for best results.

This is a global minor mode.  If called interactively, toggle the
`OSX-Clipboard mode' mode.  If the prefix argument is positive,
enable the mode, and if it is zero or negative, disable the mode.

If called from Lisp, toggle the mode if ARG is `toggle'.  Enable
the mode if ARG is nil, omitted, or is a positive number.
Disable the mode if ARG is a negative number.

To check whether the minor mode is enabled in the current buffer,
evaluate `(default-value \\='osx-clipboard-mode)'.

The mode's hook is called both when the mode is enabled and when
it is disabled.

(fn &optional ARG)" t)
(register-definition-prefixes "osx-clipboard" '("osx-clipboard-"))

;;; End of scraped data

(provide 'osx-clipboard-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; osx-clipboard-autoloads.el ends here
