(let ((style "linux"))
  (setq format-command (format "astyle --style=%s -H -xV -xg -U -k3 -W3 -xb -xn -xc -xf -xh -xr -z2 -C -w -Y -N -L -m0 -M40 --pad-oper --suffix=none --indent=force-tab" style)))

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
