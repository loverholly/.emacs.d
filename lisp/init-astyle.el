(let ((style "linux"))
  (setq format-command (format "astyle --style=%s -s4 -S -N -L -m0 -M40 --pad-oper --suffix=none --convert-tabs" style)))

(global-auto-revert-mode t)

(defun format-code ()
  "Format current buffer"
  (interactive)
  (let ((file (buffer-file-name)))
	(save-excursion
	  (shell-command-to-string (format "%s %s" format-command file))
	  (message "Code formatted"))))

(global-set-key  (kbd "C-c i") 'format-code)

(provide 'init-astyle)
