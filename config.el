;; Set the debug option to enable a backtrace when a problem occurs.
(setq debug-on-error t)

;; Disable tab \t character for indent
(setq-default indent-tabs-mode nil)

;; Customization
(global-font-lock-mode t)
(transient-mark-mode t)

;; Screen/display preferences
(set-frame-size (selected-frame) 92 62)
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

;; JavaScript
(require 'javascript-mode)
(setq javascript-indent-level 2)

;; Markdown
(add-to-list 'load-path (expand-file-name "~/Library/Emacs/site/yaml-mode/"))
(require 'yaml-mode)

;; Scala
(add-to-list 'load-path (expand-file-name "~/Library/Emacs/site/scala-mode2-20130406"))

(require 'scala-mode2)

;; Ensime dependencies
(load (expand-file-name "~/Library/Emacs/site/popup-el-0.5.9/popup.el"))
(load (expand-file-name "~/Library/Emacs/site/company-mode-0.10.1/company.el"))

(use-package ensime-mode
  :ensure nil
  :load-path "~/Library/Emacs/site/ensime-tng-3.0.15/lisp/"
  :commands ensime-mode
  :bind
  (:map ensime-mode-map
        ("M-." . ensime-jump-to-definition)
        ("C-c C-i t" . ensime-type-at-point)
        ("C-c C-i s" . ensime-symbol-at-point)
        ("C-c C-r i" . ensime-import-symbol-at-point)))

(add-hook 'scala-mode-hook #'ensime-mode)

;(defconst scala-rigid-indent t)

;; Haskell
(add-to-list 'load-path 
             (expand-file-name "~/Library/Emacs/site/haskell-mode-2.8.0"))
(require 'haskell-mode)
(setq auto-mode-alist (append auto-mode-alist
                              '(("\\.hs\\'" . turn-on-haskell-indent))))
(autoload 'turn-on-haskell-indent "hindent" "Indentation mode for Haskell" t)

;; Go
(load (expand-file-name "~/Library/Emacs/site/go-mode/go-mode-autoloads.el"))

;; Rust
(load (expand-file-name "~/Library/Emacs/site/rust-mode-0.4.0/rust-mode.el"))

;; Typescript
(load (expand-file-name "~/Library/Emacs/site/typescript/typescript-mode.elc"))
(setq typescript-indent-level 2)

(add-to-list 'auto-mode-alist (cons "\\.svelte\\'" 'typescript-mode))
