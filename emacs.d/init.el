(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(add-to-list 'package-archives
						 '("melpa-stable" . "https://stable.melpa.org/packages/"))
(add-to-list 'package-archives
						 '("site-lisp" . "~/,emacs.d/site-lisp"))


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


(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)
(setq font-latex-fontify-script t)


(add-hook 'prog-mode-hook 'line-number-mode t)
(add-hook 'prog-mode-hook 'column-number-mode t)

(add-hook 'text-mode-hook (lambda ()
                             (turn-on-auto-fill)
                             (set-fill-column 82)))
(add-hook 'markdown-mode-hook (lambda ()
                             (turn-on-auto-fill)
                             (fci-mode)
                             (set-fill-column 82)))
(add-hook 'python-mode-hook (lambda ()
                             (fci-mode)
                             (set-fill-column 94)))
(add-hook 'c-mode-hook (lambda ()
                             (fci-mode)
                             (set-fill-column 94)))

(add-hook 'd-mode-hook (lambda ()
                             (fci-mode)
                             (set-fill-column 94)))


(defvar my-LaTeX-no-autofill-environments
    '("equation" "equation*" "table" "table*" "figure" "figure*")
      "A list of LaTeX environment names in which `auto-fill-mode' should be inhibited.")

(defun my-LaTeX-auto-fill-function ()
    "This function checks whether point is currently inside one of
  the LaTeX environments listed in
  `my-LaTeX-no-autofill-environments'. If so, it inhibits automatic
  filling of the current paragraph."
    (let ((do-auto-fill t)
                  (current-environment "")
                  (level 0))
          (while (and do-auto-fill (not (string= current-environment "document")))
            (setq level (1+ level)
              current-environment (LaTeX-current-environment level)
                  do-auto-fill (not (member current-environment my-LaTeX-no-autofill-environments))))
          (when do-auto-fill
              (do-auto-fill))))

(defun my-LaTeX-setup-auto-fill ()
    "This function turns on auto-fill-mode and sets the function
  used to fill a paragraph to `my-LaTeX-auto-fill-function'."
    (auto-fill-mode)
      (setq auto-fill-function 'my-LaTeX-auto-fill-function))

(add-hook 'LaTeX-mode-hook 'my-LaTeX-setup-auto-fill)

(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(autoload 'gfm-mode "gfm-mode"
  "Major mode for editing GitHub Flavored Markdown files" t)
(add-to-list 'auto-mode-alist '("README\\.md\\'" . gfm-mode))



(setq org-use-sub-superscripts '{})
