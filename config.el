t;; Set the debug option to enable a backtrace when a
;; problem occurs.
(setq debug-on-error t)

;; Disable tab \t character for indent
(setq-default indent-tabs-mode nil)

;; Customization
(global-font-lock-mode t)
(transient-mark-mode t)

;; Screen/display preferences
(set-frame-size (selected-frame) 80 54)
(tool-bar-mode -1)

;; Custom visible bell
(setq visible-bell nil)
(setq ring-bell-function 
      (lambda () 
        (set 'tmpc (face-background 'fringe))
        (set-face-background 'fringe "Orchid")
        (redisplay t)
        (run-at-time 
         "500 msec" nil 
         '(lambda() (set-face-background 'fringe tmpc)))
))

(message (concat "Salut à toi, " (user-full-name))) 
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
(add-to-list 'load-path (expand-file-name "~/Library/Emacs/site"))

;; Setup Emacs to run bash as its primary shell.
(setq shell-file-name "bash")
(setq shell-command-switch "-c")
(setq explicit-shell-file-name shell-file-name)
(setenv "SHELL" shell-file-name)
(setq explicit-sh-args '("-login" "-i"))

;; JDEE
;(load-file "~/Library/Emacs/site/cedet-1.1/common/cedet.el")
;;(add-to-list 'load-path 
;;             (expand-file-name "~/Library/Emacs/site/cedet-1.1/common"))
;(add-to-list 'load-path (expand-file-name "~/Library/Emacs/site/jdee-2.4.0.1/lisp"))
;(add-to-list 'load-path (expand-file-name "~/Library/Emacs/site/elib-1.0"))

;(require 'jde)
;;(global-set-key "\C-c\C-vg" 'jde-gen-get-set) ; get/set generator shortcut

;; JavaScript
(require 'javascript-mode)

;; Markdown
(require 'markdown-mode)

;; Scala
(add-to-list 'load-path (expand-file-name "~/Library/Emacs/site/scala-mode2-20130406"))
(add-to-list 'load-path (expand-file-name "~/Library/Emacs/site/ensime_2.9.2-RC1-0.9.3.RC4/elisp"))

(require 'scala-mode2)
(require 'ensime)

(defconst scala-rigid-indent t)
(add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; Scala - Ensime integration
(defun my-scala-save-hook ()
  (if (and (ensime-connected-p)
           (buffer-modified-p))
      (ensime-format-source))
  nil)

(add-hook 'scala-mode-hook
          (lambda()
            (add-hook 'local-write-file-hooks
                      '(lambda()
                         (save-excursion (my-scala-save-hook))))))
