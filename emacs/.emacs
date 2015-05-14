

(add-to-list 'load-path "/home/shriwise/.bash/emacs/popup-el")
(add-to-list 'load-path "/home/shriwise/.bash/emacs/ac")
(add-to-list 'load-path "/home/shriwise/.bash/emacs/mplayer-mode")
(add-to-list 'load-path "/home/shriwise/.bash/emacs/bash-compl")

(require 'auto-complete-config)
(require 'mplayer-mode)
(require 'bash-completion)
(bash-completion-setup)
(global-auto-complete-mode t)

(column-number-mode 1)

(global-set-key [hpDeleteChar] 'delete-char)
   (setq line-number-mode t)
   (setq line-number-display-limit 3000000)
   (setq next-line-add-newlines nil)
   (setq auto-mode-alist (cons (cons "\\akefile$" 'makefile-mode) auto-mode-alist))
   (setq calendar-latitude 52)
   (setq calendar-longitude -122)

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
 )
