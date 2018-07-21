(setq cppcheck-command (format "cppcheck --enable=all"))

(global-auto-revert-mode t)

(defun cppcheck-code ()
  "Cppcheck current buffer"
  (interactive)
  (let ((file (buffer-file-name)))
	(save-excursion
	  (async-shell-command (format "%s %s" cppcheck-command file))
	  (message "cppchecked over"))))

(global-set-key  (kbd "C-c k") 'cppcheck-code)

(provide 'init-cppcheck)
