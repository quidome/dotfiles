;; init-whitespace.el --- whitespace configuration

;;; Commentary:

;;; Code:

(defun my-delete-trailing-blank-lines ()
      "Deletes all blank lines at the end of the file."
      (interactive)
      (save-excursion
	(save-restriction
	  (widen)
	  (goto-char (point-max))
	  (delete-blank-lines))))

(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'my-delete-trailing-blank-lines)

(provide 'init-whitespace)
;;; init-whitespace.el ends here
