;; init-magit.el --- my magit configuration
;-*-Emacs-Lisp-*-

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :init
  ;; Ask for the branch name first when creating a branch rather than
  ;; specifying upstream
  (setq magit-branch-read-upstream-first nil)

  (use-package magit-gerrit
    :config
    (when (getenv "GERRIT_SSH_CREDS")
      (setq-default magit-gerrit-ssh-creds (getenv "GERRIT_SSH_CREDS")))
  )
)




(provide 'init-magit)
;;; init-magit.el ends here
