;; Set the debug option to enable a backtrace when a
;; problem occurs.
(setq debug-on-error t)

;; Disable tab \t character for indent
(setq-default indent-tabs-mode nil)

;; Customization
(global-font-lock-mode t)
(transient-mark-mode t)

;; Screen/display preferences
(set-frame-size (selected-frame) 80 50)
(setq visible-bell t) ; Turn noisy bell into a visible one
;(setq ring-bell-function (lambda () (message "*beep*")))

(message (concat "Salut � toi, " (user-full-name))) 
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b")) 
(fset 'yes-or-no-p 'y-or-n-p)
(put 'narrow-to-region 'disabled nil)

(set-cursor-color "Orchid")
;(set-cursor-color "HotPink") ;
(set-face-background 'region "LightBlue")
(set-face-background 'default "White")
(set-face-foreground 'default "Black")

;; Key bindings
(when (eq system-type 'darwin)
  (setq mac-option-modifier 'nil))

;; Common load path
(add-to-list 'load-path (expand-file-name "~/Library/Emacs-23/site"))

;; Setup Emacs to run bash as its primary shell.
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))

;; JDEE
(add-to-list 'load-path (expand-file-name "~/Library/Emacs-23/site/jdee/lisp"))
(add-to-list 'load-path (expand-file-name "~/Library/Emacs-23/site/elib"))
(add-to-list 'load-path 
             (expand-file-name "~/Library/Emacs-23/site/cedet/common"))

(require 'cedet)
(require 'jde)
;(global-set-key "\C-c\C-vg" 'jde-gen-get-set) ; get/set generator shortcut

;; JavaScript
(require 'javascript-mode)

;; Scala
(add-to-list 'load-path (expand-file-name "~/Library/Emacs-23/site/scala"))
;(add-to-list 'load-path (expand-file-name "~/Library/Emacs/site/ensime/elisp"))

(require 'scala-mode-auto)
;(require 'ensime)

;(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)