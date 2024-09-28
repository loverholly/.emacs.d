;;; init-fflp.el --- fflp support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'find-file-in-project)
(require-package 'dired-subtree)
(require-package 'dired-rainbow)
(require-package 'dired-single)
(require-package 'dired-rsync)
(require-package 'dired-sidebar)
(require-package 'ibuffer-sidebar)

(global-set-key (kbd "<f4>") 'dired-sidebar-show-sidebar)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(add-hook 'dired-mode-hook 'auto-revert-mode)

(defun revert-dired-on-find-file ()
  "Revert Dired buffer when a file is opened."
  (when (eq major-mode 'dired-mode)
    (revert-buffer)))

(add-hook 'find-file-hook 'revert-dired-on-find-file)

(provide 'init-fflp)
