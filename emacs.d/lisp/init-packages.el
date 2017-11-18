;; init-packages.el --- packages init and configuration

;;; Commentary:

;;; Code:

;; don't load packages before init is completed
(setq package-enable-at-startup nil)	; don't activate packages before init is read
(require 'package)
(package-initialize)


;; package providers
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; package list
(setq elpa-packages '(
		     ansible
		     flycheck
		     gitignore-mode
		     go-mode
		     leuven-theme
		     magit
		     magit-gerrit
		     magit-popup
		     markdown-mode
		     org
		     powerline
		     puppet-mode
		     pyenv-mode
		     rubocop
		     yaml-mode
		     ))


(defun install-packages ()
  "Install packages if not already installed"
  (interactive)

  (when (not (packages-installed? elpa-packages))
    (package-refresh-contents)

    (install-package-list elpa-packages)
    ))

(defun packages-installed? (package-list)
  (cond
   ((null package-list) t)
   (t
    (if (package-installed? (car package-list))
        (packages-installed? (cdr package-list))
      nil)
    )))

(defun install-package-list (package-list)
  (when package-list
    (install-package (car package-list))
    (install-package-list (cdr package-list))
    ))

(defun install-package (package)
  (when (not (package-installed? package))
    (package-install package)))

(defun package-installed? (package)
  (require package nil t))


(defun update-packages ()
  "Update all installed packages"
  (save-window-excursion
    (package-list-packages t)
    (package-menu-mark-upgrades)
    (package-menu-execute t)))

(provide 'init-packages)
;;; init-packages.el ends here
