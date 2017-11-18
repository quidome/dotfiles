;; init-housekeeping.el --- Powerline configuration

;;; Commentary:

;;; Code:

;; create the autosave dir if necessary, since emacs won't.
(make-directory "~/.emacs.d/auto-save/" t)
(make-directory "~/.emacs.d/auto-backup/" t)

;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(custom-set-variables
  '(auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save/\\1" t)))
  '(backup-directory-alist '((".*" . "~/.emacs.d/auto-backup/"))))


;; Disable stupid lockfiles (.#file-name)
(setq create-lockfiles nil)

;; ;; put auto saves into user-emacs-directory/autosave
;; (setq auto-save-file-name-transforms
;; 	  `((".*" ,(concat user-emacs-directory "auto-save/") t)))

;; ;; put auto backups into user-emacs-directory/autosave
;; (setq backup-directory-alist
;; 	  `((".*" ,(concat user-emacs-directory "auto-backup/") t)))

(provide 'init-housekeeping)
;;; init-housekeeping.el ends here
