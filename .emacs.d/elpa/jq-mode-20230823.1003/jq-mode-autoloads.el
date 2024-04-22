;;; jq-mode-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from jq-mode.el

(autoload 'jq-mode "jq-mode" "\
Major mode for jq scripts.
\\{jq-mode-map}

(fn)" t)
(autoload 'jq-interactively "jq-mode" "\
Runs jq interactively on a json buffer.

(fn BEG END)" t)
(register-definition-prefixes "jq-mode" '("jq-"))


;;; Generated autoloads from ob-jq.el

(register-definition-prefixes "ob-jq" '("org-babel-"))

;;; End of scraped data

(provide 'jq-mode-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; jq-mode-autoloads.el ends here
