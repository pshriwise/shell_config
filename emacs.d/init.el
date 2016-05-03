(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives '("site-lisp" . "~/,emacs.d/site-lisp"))


;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

(require-package 'evil)

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/") 

(setq x-super-keysym 'meta)
(set-keyboard-coding-system nil)


(require-package 'color-theme)
(require 'color-theme)
(color-theme-initialize)
(load-file "~/.emacs.d/themes/color-theme-darkmate.el")
 (color-theme-darkmate) 

(require 'gnuplot-mode)

;; specify the gnuplot executable (if other than /usr/bin/gnuplot)
(setq gnuplot-program "/sw/bin/gnuplot")

;; automatically open files ending with .gp or .gnuplot in gnuplot mode
(setq auto-mode-alist
      (append '(("\\.\\(gp\\|gnuplot\\)$" . gnuplot-mode)) auto-mode-alist))
