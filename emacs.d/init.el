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

;; variables
(defvar
  my-lisp-dir)

;; set some locations
(setq
 my-lisp-dir (expand-file-name "lisp" user-emacs-directory)
 custom-file (expand-file-name "custom.el" user-emacs-directory)
 )

;; add my lisp to load path
(add-to-list 'load-path my-lisp-dir)

;; Keep custom config out of init.el
(load custom-file 'noerror)

;; start emacs server
(load "server")
(unless (server-running-p) (server-start))

;; remove trailing whitespace before we save stuff
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; generic emacs settings
;; Disable the splash screen (to enable it agin, replace the t with 0)
(setq inhibit-splash-screen t)

;; Enable transient mark mode
(transient-mark-mode 1)

;;Display date and time
(setq display-time-day-and-date t)
(setq display-time-24hr-format t)
(display-time)

;;My first function to have list-buffers (buffer menu)
;; be focused when calling it
(defun buffer-list-moveto ()
  "Open buffer list and jump to that window."
  (interactive)
  (list-buffers)
  (other-window 1 nil)
  )
(global-set-key (kbd "C-x C-b") 'buffer-list-moveto)

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

;; ivy stuff
(ivy-mode 1)

;; deal with all weird emacs files, don't spread
;; them all over the system
(require 'init-housekeeping)

;; my magit config, with some gerrit settings
(require 'init-magit)

;; flycheck
(require 'init-flycheck)

;; have nice powerline thingy
(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

;; enable org mode
(require 'org)

(windmove-default-keybindings)

;;; init.el ends here
