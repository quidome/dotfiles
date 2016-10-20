;;; init.el -- My Emacs configuration
;-*-Emacs-Lisp-*-

;;; Commentary:
;;
;; I have nothing substantial to say here.
;;
;;; Code:

;; Leave this here, or package.el will just add it again.
(package-initialize)

(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))

;; Also add all directories within "lisp"
;; I use this for packages I'm actively working on, mostly.
(let ((files (directory-files-and-attributes "~/.emacs.d/lisp" t)))
  (dolist (file files)
    (let ((filename (car file))
          (dir (nth 1 file)))
      (when (and dir
                 (not (string-suffix-p "." filename)))
        (add-to-list 'load-path (car file))))))

;; Package providers
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/"))
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))


;; Keep init clean
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Package stuff
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;; Settings
(setq auto-save-file-name-transforms
          `((".*" ,(concat user-emacs-directory "auto-save/") t)))

(global-set-key (kbd "C-x C-b") 'buffer-menu)
(load-theme 'leuven t)

(use-package exec-path-from-shell
  :ensure t
  :config
  (push "HISTFILE" exec-path-from-shell-variables)
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :init
  ;; Ask for the branch name first when creating a branch rather than
  ;; specifying upstream
  (setq magit-branch-read-upstream-first nil))

;; if remote url is not using the default gerrit port and
;; ssh scheme, need to manually set this variable
(use-package magit-gerrit)

(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package yaml-mode :ensure t :defer t)

(use-package which-key
  :ensure t
  :diminish ""
  :config
  (which-key-mode t))
