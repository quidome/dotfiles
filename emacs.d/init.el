:;;; init.el -- My Emacs configuration
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

(defconst my-savefile-dir (expand-file-name "savefile" user-emacs-directory))

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/auto-backup/"))))

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/auto-save/" t)
(make-directory "~/.emacs.d/auto-backup/" t)

;; Disable stupid lockfiles
(setq create-lockfiles nil)

;; Keep init clean
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; Package stuff
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

;;
;; Settings
;;
(setq auto-save-file-name-transforms
	  `((".*" ,(concat user-emacs-directory "auto-save/") t)))

(global-set-key (kbd "C-x C-b") 'buffer-menu)

;; cleanup whitespace on save
(add-hook 'before-save-hook 'whitespace-cleanup)

;; add markdown mode
;; brew install homebrew/emacs/markdown-mode
;; AUR: emacs-markdown-mode-git
(autoload 'markdown-mode "markdown-mode.el"
  "Major mode for editing Markdown files" t)
(setq auto-mode-alist
      (cons '("\.md" . markdown-mode) auto-mode-alist))

;; Disable scrollbar
(scroll-bar-mode -1)

;; Include config files
(require 'init-magit)
(require 'init-flycheck)
(require 'init-powerline)
;; (require 'init-whitespace)

(use-package exec-path-from-shell
  :ensure t
  :config
  (push "HISTFILE" exec-path-from-shell-variables)
  (setq exec-path-from-shell-check-startup-files nil)
  (exec-path-from-shell-initialize))

(use-package ido
  :ensure t
  :config
  (setq ido-enable-prefix nil
	ido-enable-flex-matching t
	ido-create-new-buffer 'always
	ido-use-filename-at-point 'guess
	ido-max-prospects 10
	ido-save-directory-list-file (expand-file-name "ido.hist" my-savefile-dir)
	ido-default-file-method 'selected-window
	ido-auto-merge-work-directories-length -1)
  (ido-mode +1))

(use-package magit-gerrit)

(use-package yaml-mode :ensure t :defer t)

(use-package which-key
  :ensure t
  :diminish ""
  :config
  (which-key-mode t))

(provide 'init)
;;; init.el ends here
