;(require 'git)
;; ____________________________________________________________________________
;; Aquamacs custom-file warning:
;; Warning: After loading this .emacs file, Aquamacs will also load
;; customizations from `custom-file' (customizations.el). Any settings there
;; will override those made here.
;; Consider moving your startup settings to the Preferences.el file, which
;; is loaded after `custom-file':
;; ~/Library/Preferences/Aquamacs Emacs/Preferences
;; _____________________________________________________________________________

;;
;; general setup
;;

(setq-default tab-width 4)
(setq-default tab-always-indent nil)
(setq-default c-basic-offset 4)
(setq-default truncate-lines t)
(setq-default show-trailing-whitespace t)
(setq-default indent-tabs-mode nil)

(electric-indent-local-mode nil)
(electric-indent-mode nil)
(column-number-mode 1)
(display-time-mode)

;;
;; Fx keys
;;

(global-set-key (kbd "<f12>") 'whitespace-cleanup)
(global-set-key (kbd "<f9>") 'whitespace-mode)
(global-set-key (kbd "<f8>") 'indent-buffer)
(global-set-key (kbd "<f7>") 'eval-buffer)
(global-set-key (kbd "<f6>") 'isearch-forward)
(global-set-key (kbd "<f5>") 'new-frame)
(global-set-key (kbd "<f4>") 'goto-line)
(global-set-key (kbd "<f3>") 'toggle-truncate-lines)

;;
;; Magic keys
;;
(global-set-key (kbd "C-c c") 'compile)
(global-set-key (kbd "C-c s") 'go-scratch)

;;
;; emacs window 120x60@50x50
;;

(if (display-graphic-p)
	(progn
	  (setq initial-frame-alist
			'(
			  (tool-bar-lines . 0)
			  (width . 160)
			  (height . 60)
			  (left . 0)
			  (top . 0)))
	  (setq default-frame-alist
			'(
			  (tool-bar-lines . 0)
			  (width . 160)
			  (height . 60)
			  (left . 0)
			  (top . 0))))
  (progn
	(setq initial-frame-alist '( (tool-bar-lines . 0)))
	(setq default-frame-alist '( (tool-bar-lines . 0)))))

;;
;; custom autosave part
;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(custom-enabled-themes '(tsdh-dark))
 '(custom-safe-themes
   '("c92a0fece9ad256d83a0ce85df1f15e1c9280eba91c0cc06f8879b9572a855c7" "e28246005845509308f992e6fa8524249e13b65192572c9cc9f412a4c5150373" default))
 '(delete-selection-mode nil)
 '(display-time-mode t)
 '(ispell-dictionary nil)
 '(package-selected-packages
   '(oberon dockerfile-mode dart-mode go-direx company-go gotest flymake-go flycheck-golangci-lint flycheck go-projectile yaml-pro go-eldoc golint go-mode ## gotham-theme json-navigator json-mode jsonrpc yaml-mode pyfmt py-yapf night-owl-theme gitconfig gited git symon srcery-theme python python-info python-mode pylint elpy dracula-theme magit))
 '(show-paren-mode t))

;;; MELPA

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

;;; CPP

(c-add-style "my-style"
			 '("linux"
			   (indent-tabs-mode . nil)      ; use spaces rather than tabs
			   (c-indent-level 4)            ; TAB is 4 spaces
			   (c-basic-offset . 4)          ; indent by four spaces
			   (c-offsets-alist . ((inline-open . 0)  ; custom indentation rules
								   (brace-list-open . 0)
								   (statement-case-open . +)))))

(defun my-c++-mode-hook ()
  (c-set-style "my-style")
  (auto-fill-mode)
  (c-toggle-auto-hungry-state 1))

(add-hook 'c++-mode-hook 'my-c++-mode-hook)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;;; GOLANG

(autoload 'go-mode "go-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

(setq exec-path (append '("/usr/local/go/bin") exec-path))
(setenv "PATH" (concat "/usr/local/go/bin:" (getenv "PATH")))

;(add-hook 'after-init-hook #'global-flycheck-mode)

(defun my-go-mode-hook ()
  (setq tab-width 4 indent-tabs-mode 1)
  ; eldoc shows the signature of the function at point in the status bar.
  (go-eldoc-setup)
  ; Customize compile command to run go build
  (if (not (string-match "go" compile-command))
      (set (make-local-variable 'compile-command)
           "go build && go test -v ./... && go vet"))
  (global-set-key (kbd "C-c c") #'compile)
  ; goto definition and back
  (local-set-key (kbd "M-.") #'godef-jump)
  (local-set-key (kbd "M-*") #'pop-tag-mark)
  ; save formated file
  (add-hook 'before-save-hook 'gofmt-before-save)
  ; extra keybindings from https://github.com/bbatsov/prelude/blob/master/modules/prelude-go.el
  (let ((map go-mode-map))
    (define-key map (kbd "C-c a") 'go-test-current-project) ;; current package, really
    (define-key map (kbd "C-c m") 'go-test-current-file)
    (define-key map (kbd "C-c .") 'go-test-current-test)
    (define-key map (kbd "C-c b") 'go-run)))

(add-hook 'go-mode-hook 'my-go-mode-hook)

(require 'go-autocomplete)
(require 'auto-complete-config)
(define-key ac-mode-map (kbd "M-TAB") 'auto-complete)
(defun auto-complete-for-go ()
(auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

; Use projectile-test-project in place of 'compile'; assign whatever key you want.
;(global-set-key [f11] 'projectile-test-project)

; "projectile" recognizes git repos (etc) as "projects" and changes settings
; as you switch between them.
;(projectile-global-mode 1)
;(require 'go-projectile)
;(go-projectile-tools-add-path)
(setq gofmt-command "/usr/local/go/bin/goimports")

; "company" is auto-completion
;(require 'company)
;(require 'go-mode)
;(require 'company-go)
;(add-hook 'go-mode-hook (lambda ()
;                          (company-mode)
;                          (set (make-local-variable 'company-backends) '(company-go))))

; gotest defines a better set of error regexps for go tests, but it only
; enables them when using its own functions. Add them globally for use in
(require 'compile)
(require 'gotest)
(dolist (elt go-test-compilation-error-regexp-alist-alist)
  (add-to-list 'compilation-error-regexp-alist-alist elt))
(defun prepend-go-compilation-regexps ()
  (dolist (elt (reverse go-test-compilation-error-regexp-alist))
   (add-to-list 'compilation-error-regexp-alist elt t)))
(add-hook 'go-mode-hook 'prepend-go-compilation-regexps)

;;; PYTHON

(require 'python)
(autoload 'pylint "pylint")
(add-hook 'python-mode-hook 'pylint-add-menu-items)
(add-hook 'python-mode-hook 'pylint-add-key-bindings)
(put 'upcase-region 'disabled nil)

;;; XML

(add-to-list 'auto-mode-alist '("\\.xml\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.cfg\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.tmpl\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.inc\\'" . xml-mode))
(add-to-list 'auto-mode-alist '("\\.xslt\\'" . xml-mode))

;;; YAML

(require 'yaml-mode)
(add-to-list 'auto-mode-alist '("\\.yml\\'" . yaml-mode))
(add-hook 'yaml-mode-hook
          '(lambda ()
             (define-key yaml-mode-map "\C-m" 'newline-and-indent)))

;;; DART

(require 'dart-mode)
(add-to-list 'auto-mode-alist '("\\.dart\\'" . dart-mode))

;; Oberon

(require 'oberon)
(add-to-list 'auto-mode-alist '("\\.obn\\'" . oberon-mode))

;;; Ubuntu Mono font for Emacs

;(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 ;'(default ((t (:family "Ubuntu Mono" :slant normal :weight normal :height 98 :width normal)))))

(osx-clipboard-mode +1)

;(osx-lib-say "emacs ready!!!")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
