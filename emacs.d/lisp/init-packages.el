;; init-packages.el --- packages init and configuration
;-*-Emacs-Lisp-*-

;;; Commentary:

;;; Code:

;; don't load packages before init is completed
(setq package-enable-at-startup nil)
(require 'package)


;; package providers
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))

;; package list
(setq elpa-packages '(
		      ansible
		      docker
		      dockerfile-mode
		      flycheck
		      flycheck-pycheckers
		      gitignore-mode
		      go-mode
		      ivy
		      magit
		      magit-gerrit
		      magit-popup
		      markdown-mode
		      org
		      pomidor
		      powerline
		      puppet-mode
		      pyenv-mode
		      rspec-mode
		      rubocop
		      use-package
		      yaml-mode
		      ))


(defun install-packages ()
  "Install packages if not already installed."
  (interactive)

  (when (not (packages-installed? elpa-packages))
    (package-refresh-contents)

    (install-package-list elpa-packages)
    ))

(defun packages-installed? (package-list)
  "Check if packages in PACKAGE-LIST have been installed."
  (cond
   ((null package-list) t)
   (t
    (if (package-installed? (car package-list))
        (packages-installed? (cdr package-list))
      nil)
    )))

(defun install-package-list (package-list)
  "Install packages in PACKAGE-LIST."
  (when package-list
    (install-package (car package-list))
    (install-package-list (cdr package-list))
    ))

(defun install-package (package)
  "Install PACKAGE if not already installed."
  (when (not (package-installed? package))
    (package-install package)))

(defun package-installed? (package)
  "Check if PACKAGE has been installed."
  (require package nil t))


(defun update-packages ()
  "Update all installed packages."
  (save-window-excursion
    (package-list-packages t)
    (package-menu-mark-upgrades)
    (package-menu-execute t)))

;; install packages
(install-packages)

;; very package related so I put this here
(eval-when-compile
  (require 'use-package))


(provide 'init-packages)
;;; init-packages.el ends here
