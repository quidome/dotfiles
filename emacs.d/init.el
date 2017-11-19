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
(setq
 my-lisp-dir (expand-file-name "lisp" user-emacs-directory)
 custom-file (expand-file-name "custom.el" user-emacs-directory)
 )

;; add my lisp to load path
(add-to-list 'load-path my-lisp-dir)

;; Keep custom config out of init.el
(setq )
(load custom-file 'noerror)

;; start emacs server
(load "server")
(unless (server-running-p) (server-start))

;; remove trailing whitespace before we save stuff
(add-hook 'before-save-hook 'delete-trailing-whitespace)


;; load additional elisp files
(require 'init-packages)


;; import variables from environment
(use-package exec-path-from-shell
  :ensure t
  :config
  (push "HISTFILE" exec-path-from-shell-variables)
  (push "GERRIT_SSH_CREDS" exec-path-from-shell-variables)
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))


;; perform app settings, possibly based on OS
;; sets: osx, linux
(require 'os-tweaks)


;; deal with all weird emacs files, don't spread
;; them all over the system
(require 'init-housekeeping)


;; my magit config, with some gerrit settings
(require 'init-magit)


;; have nice powerline thingy
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))


(provide 'init)
;;; init.el ends here
