;; os-tweaks.el --- some generic configuration
;-*-Emacs-Lisp-*-

;;; Commentary:

;;; Code:


;;
(defun osx ()
  "Easy function to check if OS is OSX."
  (eq system-type 'darwin))

(defun linux ()
  "Easy function to check if OS is linux."
  (eq system-type 'gnu/linux))

;; tweak some gui settings
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(when (linux)
  (menu-bar-mode -1))

(provide 'os-tweaks)
;;; os-tweaks.el ends here
