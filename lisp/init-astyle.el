(let ((style "linux"))
  (setq format-command (format "astyle --style=%s --indent=4 -H -xV -xg -U -k3 -W3 -xb -xn -xc -xf -xh -xr -z2 -C -xW -xL -Y -N -m0 -M40 -xC80 --pad-oper --suffix=none --indent=force-tab" style))) ;;indent=8 should be used to linux kernel and init-edit-utils also be set indent=8

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
