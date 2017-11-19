;; os-tweaks.el --- some generic configuration
;; including os related stuff

;;; Commentary:

;;; Code:

;; tweak some gui settings
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(when (eq system-type 'gnu/linux)
  (menu-bar-mode -1)
  )

(provide 'os-tweaks)
;;; os-tweaks.el ends here
