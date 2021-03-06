
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(add-to-list 'load-path "~/.bash/emacs/popup-el")
(add-to-list 'load-path "~/.bash/emacs/ac")
(add-to-list 'load-path "~/.bash/emacs/mplayer-mode")
(add-to-list 'load-path "~/.bash/emacs/bash-completion")
(add-to-list 'load-path "~/.bash/emacs/cython-mode")
(add-to-list 'load-path "~/.bash/emacs/move-text")
(add-to-list 'load-path "~/.bash/emacs")

(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; file-type hooks
(add-hook 'c++-mode-hook 'fci-mode)
(add-hook 'c++-mode-hook 'highlight-indentation-mode)
(add-hook 'c-mode-hook 'fci-mode)
(add-hook 'c-mode-hook 'highlight-indentation-mode)
(add-hook 'python-mode-hook 'fci-mode)
(add-hook 'python-mode-hook 'highlight-indentation-mode)

;; Define + active modification to compile that locally sets
;; shell-command-switch to "-ic".
(defadvice compile (around use-bashrc activate)
  "Load .bashrc in any calls to bash (e.g. so we can use aliases)"
  (let ((shell-command-switch "-ic"))
    ad-do-it))

(require 'highlight-indentation)
(require 'fill-column-indicator)
(require 'auto-complete-config)
(require 'mplayer-mode)
(require 'bash-completion)
(require 'cython-mode)
(require 'web-mode)
(require 'move-text)

(move-text-default-bindings)

(set-face-background 'highlight-indentation-face "#7e7e7e")
(set-variable 'highlight-indentation-blank-lines "t")

(bash-completion-setup)
(global-auto-complete-mode t)

(column-number-mode 1)
(setq compilation-scroll-output t)
(savehist-mode 1)

(setq-default indent-tabs-mode nil)

(if (boundp tool-bar-mode) (tool-bar-mode -1))
(if (boundp menu-bar-mode) (menu-bar-mode -1))

(defun bury-compile-buffer-if-successful (buffer string)
  "Bury a compilation buffer if succeeded without warnings "
  (if (and
       (string-match "compilation" (buffer-name buffer))
       (string-match "finished" string)
       (not
        (with-current-buffer buffer
          (search-forward "warning" nil t))))
      (run-with-timer 1 nil
                      (lambda (buf)
			(delete-windows-on buf))
                      buffer)))
(add-hook 'compilation-finish-functions 'bury-compile-buffer-if-successful)

(defun compile-in-new-window ()
  "Always does compilation in a new window, so old buffers aren't buried."
  (interactive)
  (progn
    (if (not (get-buffer "*compilation*"))
	  (progn
	    (split-window-vertically)))))

(fset 'plusone
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([23 24 42 113 49 43 25 return 25] 0 "%d")) arg)))

(global-set-key [hpDeleteChar] 'delete-char)
   (setq line-number-mode t)
   (setq line-number-display-limit 3000000)
   (setq next-line-add-newlines nil)
   (setq auto-mode-alist (cons (cons "\\akefile$" 'makefile-mode) auto-mode-alist))
   (setq calendar-latitude 52)
   (setq calendar-longitude -122)
   (setq-default fill-column 80)

   (global-set-key [f1] 'goto-line)
   (global-set-key [f2] 'compile)
   (global-set-key [f3] 'undo)
   (global-set-key [f4] 'repeat-complex-command)
;;;
   (global-set-key [f5] 'query-replace)
   (global-set-key [f6] 'tags-search)
   (global-set-key [f7] 'tags-query-replace)
   (global-set-key [f8] 'tags-loop-continue)
;;;
   (global-set-key [f9] 'start-kbd-macro)
   (global-set-key [f10] 'end-kbd-macro)
   (global-set-key [f11] 'call-last-kbd-macro)
   (global-set-key [f12] 'next-error)

   (global-set-key [(control-c) (r)] 'repeat-complex-command)
   (global-set-key [(control-c) (q)] 'tags-query-replace)
   (global-set-key [(control-c) (c)] 'tags-loop-continue)
   (global-set-key [(control-c) (s)] 'tags-search)

   (global-set-key [insertchar] nil)

;; Commented because it was breaking access to certain built-in macros
;;(setq help-char nil)

(global-set-key "\C-h"  'backward-kill-word)


(setq org-todo-keywords
  '((sequence "TODO" "IN-PROGRESS" "WAITING" "DONE")))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(custom-enabled-themes (quote (deeper-blue))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(font-lock-comment-delimiter-face ((t (:foreground "color-190"))))
 '(font-lock-comment-face ((t (:foreground "color-190")))))

(set-frame-parameter (selected-frame) 'alpha '(85 . 40))
(add-to-list 'default-frame-alist '(alpha . (85 . 40)))
(set-face-attribute 'default nil :background "black"
		      :foreground "white")

;; Set transparency of emacs
(defun transparency (value)
  "Sets the transparency of the frame window. 0=transparent/100=opaque"
  (interactive "nTransparency Value 0 - 100 opaque:")
     (set-frame-parameter (selected-frame) 'alpha value))

;;; CUSTOM MACROS ;;;

(fset 'todays_post
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([24 6 S-home delete 126 47 68 111 99 tab 112 114 backspace 101 114 tab 110 111 tab 116 111 tab return] 0 "%d")) arg)))

(fset 'new_post
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([134217761 99 100 32 126 47 68 111 99 101 backspace 117 109 101 110 116 115 47 112 101 114 115 111 110 97 108 47 110 111 101 backspace 116 101 98 111 111 107 32 38 33554464 S-backspace 38 33554464 109 97 107 101 32 110 101 119 return] 0 "%d")) arg)))
(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)
