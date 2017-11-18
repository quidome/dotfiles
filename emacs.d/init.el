;;; init.el -- My Emacs configuration
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; I have nothing substantial to say here.
;;
;;; Code:


;; seems out of place here but package will add this
;; if we remove it, don't remove this line
(package-initialize)

;; set some locations
(setq my-lisp-dir (expand-file-name "lisp" user-emacs-directory))

;; add my lisp to load path
(add-to-list 'load-path my-lisp-dir)

;; Keep custom config out of init.el
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; start emacs server
(load "server")
(unless (server-running-p) (server-start))

;; init and configure package related stuff
(require 'init-packages)

;; keeping the filesystem clean
(require 'init-housekeeping)

;; load GUI tweaks
(toggle-scroll-bar -1)
(tool-bar-mode -1) 

;;; init.el ends here
(put 'upcase-region 'disabled nil)
