;;; init-ace-window.el --- ace-window support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'ace-window)
(ace-window t)
(global-set-key (kbd "C-x o") 'ace-window)

(provide 'init-ace-window)
