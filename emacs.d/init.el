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

;; simple configuration, possibly OS related
(require 'os-tweaks)

;; keeping the filesystem clean
(require 'init-housekeeping)

;; store all non-complex package loading here
;; move that stuff to own files if it gets too messy


;; have nice powerline thingy
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))


;; import shell variables
(use-package exec-path-from-shell
  :ensure t
  :config
  (push "HISTFILE" exec-path-from-shell-variables)
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))


;;; init.el ends here
