;; init-magit.el --- Magit configuration

;;; Commentary:

;;; Code:

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status)
  :init
  ;; Ask for the branch name first when creating a branch rather than
  ;; specifying upstream
  (setq magit-branch-read-upstream-first nil))
	
(provide 'init-magit)
;;; init-magit.el ends here
