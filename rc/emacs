;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;;
;;; NO SPLASH

(setq inhibit-startup-message t)

;;;
;;; TAB

;;(setq default-tab-width 4)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80 84 88 92 96 100))
(setq-default indent-tabs-mode nil)

;;;
;;; EDITING

(setq kill-whole-line t)
(delete-selection-mode t)

;;;
;;; LINE WRAP

(setq truncate-partial-width-windows nil)

;;;
;;; MAC

(when (string-equal "mac" window-system)
  (setq mac-command-key-is-meta nil)
  (setq mac-option-modifier 'meta)
  (setq mac-allow-anti-aliasing nil)
  (setq mac-command-modifier 'meta)
  )

;;;
;;; DISPLAY

(setq font-lock-maximum-decoration t)
(setq-default show-trailing-whitespace t)

;;;(global-font-lock-mode 1 t)
(transient-mark-mode t)
(show-paren-mode t)

(column-number-mode t)

;(when (> emacs-major-version 20)
;  (tool-bar-mode nil)
;  )

(unless (string-equal "mac" window-system)
  (menu-bar-mode nil)
  )

;;;
;;; GLOBAL KEY MAP

(when (< emacs-major-version 22)
  (define-key global-map "\M-g\M-g" 'goto-line)
  )

;;;
;;; ISEARCH MODE HOOK

(defun my-isearch-toggle-word ()
  "Toggle word searching on or off."
  (interactive)
  (setq isearch-word (not isearch-word))
  (setq isearch-success t isearch-adjusted t)
  ;; Work-around for isearch lazy highlight routine does not check word mode change
  (setq isearch-lazy-highlight-last-string "")
  (isearch-update)
  )

(defun my-isearch-mode-hook ()
  (define-key isearch-mode-map "\M-w" 'my-isearch-toggle-word)
  )
(add-hook 'isearch-mode-hook 'my-isearch-mode-hook)

;;;
;;; TEXT MODE HOOK

(defun my-text-mode-hook ()
  (define-key text-mode-map "\t" 'tab-to-tab-stop)
  )
(add-hook 'text-mode-hook 'my-text-mode-hook)

;;;
;;; C MODE HOOK

(defun my-c-mode-common-hook ()
  (c-set-style "stroustrup")
  (c-set-offset 'case-label '+)
  (c-set-offset 'statement-case-open '+)
  (c-set-offset 'inline-open 0)
  (set-variable 'c-backslash-max-column 100)
  (define-key c-mode-base-map "\C-m" 'c-context-line-break)
  (define-key c-mode-base-map "\C-c\C-c" 'comment-or-uncomment-region)
  )
(add-hook 'c-mode-common-hook 'my-c-mode-common-hook)

;;;
;;; AUTO MODE

(setq auto-mode-alist (append '(("\.outline$" . outline-mode)) auto-mode-alist))

(cond
 ((string-match "darwin" system-configuration)
  (progn
    (setq auto-mode-alist (append '(("\.h$" . objc-mode)) auto-mode-alist))
    ))
 (t
  (progn
    (setq auto-mode-alist (append '(("\.h$" . c++-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.i$" . c++-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.l$" . c++-mode)) auto-mode-alist))
    (setq auto-mode-alist (append '(("\.y$" . c++-mode)) auto-mode-alist))
    ))
 )

;;;
;;; DISABLE RING BELL

(defun my-dummy-ring-bell-function () nil)
(setq ring-bell-function 'my-dummy-ring-bell-function)

;;;
;;; HANGUL

;;(setq default-korean-keyboard "2")
(set-language-environment 'korean)

;;;
;;; CODING SYSTEM

(set-default-coding-systems 'euc-kr-unix)
(set-buffer-file-coding-system 'euc-kr-unix)
(set-clipboard-coding-system 'euc-kr-unix)
(set-selection-coding-system 'euc-kr-unix)
(set-keyboard-coding-system 'euc-kr-unix)

;(when (string-match "darwin" system-configuration)
;  (set-file-name-coding-system 'euc-kr-unix)
;  (set-terminal-coding-system 'euc-kr-unix)
;  ;;(require 'mac-utf)
;  )
;
;(when (string-match "laurel" system-name)
;  (set-file-name-coding-system 'euc-kr-unix)
;  (set-terminal-coding-system 'euc-kr-unix)
;  )

;;;
;;; WINDOW SYSTEM

;(when window-system
; (mwheel-install)
; (cond
;  ((string-equal "mac" window-system)
;   (progn
;     (add-to-list 'default-frame-alist '(font . "-apple-monaco-medium-r-normal--14-*"))
;     ))
;  (t
;   (progn
;     (create-fontset-from-fontset-spec
;      "6x13,korean-ksc5601:-sun-gothic-medium-r-normal--14-140-75-75-c-140-ksc5601.1987-0")
;     (add-to-list 'default-frame-alist '(font . "6x13"))
;     ))
;  )
; (cond
;  ((string-match "laurel" system-name)
;   (progn
;     (add-to-list 'default-frame-alist '(width . 120))
;     (add-to-list 'default-frame-alist '(height . 60))
;     ))
;  (t
;   (progn
;     (add-to-list 'default-frame-alist '(width . 100))
;     (add-to-list 'default-frame-alist '(height . 50))
;     ))
;  )
;)
;

;(set-fontset-font "fontset-default" '(#xe0bc . #xf66e) '("NanumGothicCoding" . "unicode-bmp"))

(global-set-key [C-f1] 'man)
(global-set-key [f2] 'grep)
(global-set-key [f4] 'query-replace)
(global-set-key [f5] 'goto-line)
(global-set-key [f6] 'other-window)
(global-set-key [f7] 'previous-error)
(global-set-key [f8] 'next-error)

(global-set-key [f9] 'call-last-kbd-macro)
(global-set-key [C-f9] 'compile)
(global-set-key [f10] 'shell)
(global-set-key [C-f12] 'indent-region)
(fset 'find-next-tag "\C-u\256")          ; macro for C-u M-.
(define-key global-map "\M-]" 'find-next-tag)

(pc-selection-mode)
(pc-bindings-mode)

(put 'upcase-region 'disabled nil)

(put 'downcase-region 'disabled nil)
