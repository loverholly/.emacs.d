(let ((style "linux"))
  (setq format-command (format "astyle --style=%s" style)))

(global-auto-revert-mode t)

(defun format-code ()
  "Format current buffer"
  (interactive)
  (let ((file (buffer-file-name)))
	(save-excursion
	  (shell-command-to-string (format "%s %s" format-command file))
	  (message "Code formatted"))))

(global-set-key "\C-f" 'format-code)

(provide 'init-astyle)
