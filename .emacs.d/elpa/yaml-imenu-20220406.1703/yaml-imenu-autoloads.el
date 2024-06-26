;;; yaml-imenu-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:

(add-to-list 'load-path (or (and load-file-name (directory-file-name (file-name-directory load-file-name))) (car load-path)))



;;; Generated autoloads from yaml-imenu.el

(autoload 'yaml-imenu-create-index "yaml-imenu" "\
Create an imenu index for the current YAML file.")
(autoload 'yaml-imenu-activate "yaml-imenu" "\
Set the buffer local `imenu-create-index-function' to `yaml-imenu-create-index'.")
(autoload 'yaml-imenu-enable "yaml-imenu" "\
Globally enable `yaml-imenu-create-index' in yaml-mode by adding `yaml-imenu-activate' to `yaml-mode-hook'." t)
(autoload 'yaml-imenu-disable "yaml-imenu" "\
Globally disable `yaml-imenu-create-index' in yaml-mode." t)
(register-definition-prefixes "yaml-imenu" '("yaml-imenu-"))

;;; End of scraped data

(provide 'yaml-imenu-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; yaml-imenu-autoloads.el ends here
