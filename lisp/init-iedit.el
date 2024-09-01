;;; init-iedit.el --- Integrate with iedit -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'iedit)
(require-package 'multiple-cursors)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'init-iedit)

;;; init-iedit.el ends here
