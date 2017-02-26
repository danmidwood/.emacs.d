
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(let* ((conf-dir (file-name-directory (or load-file-name "~/.emacs.d/")))
      (preload-dir (expand-file-name "preload" conf-dir))
      (custom-dir (expand-file-name "postload" conf-dir)))
  (add-to-list 'load-path preload-dir)
  (add-to-list 'load-path custom-dir)
  (mapc 'load (directory-files preload-dir 't "^[^#].*el$"))
  (install-packages
   '(;;; General crap
     helm
     solarized-theme
     company
     magit
     expand-region
     ;;; Lisp
     paredit
     rainbow-delimiters
     ;;; Clojure
     clojure-mode
     cider))
  (mapc 'load (directory-files custom-dir 't "^[^#].*el$")))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (cider clojure-mode rainbow-delimiters paredit expand-region magit company solarized-theme helm))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
