;;; init-crux.el --- crux support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'crux)

(global-set-key (kbd "C-a") 'crux-move-beginning-of-line)
(global-set-key (kbd "C-c ^") 'crux-top-join-line)
(global-set-key (kbd "C-x ,") 'crux-find-user-init-file)

(provide 'init-crux)
;;; init-crux.el ends here
