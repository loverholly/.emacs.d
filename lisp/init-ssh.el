;;; init-ssh.el --- ssh for remote access files
;;; Commentary:
;;; Code:

(require-package 'ssh)
(add-hook 'ssh-mode-hook
          (lambda ()
            (setq ssh-directory-tracking-mode t)
            (shell-dirtrack-mode t)
            (setq dirtrackp nil)))

(provide 'init-ssh)

;;; init-ssh.el ends here
