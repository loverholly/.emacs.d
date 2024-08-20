;;; init-ace-jump.el --- ace-jump-mode support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'ace-jump-mode)
(ace-jump-mode t)
(global-set-key (kbd "C-x o") 'ace-jump-mode)

(provide 'init-ace-jump)
