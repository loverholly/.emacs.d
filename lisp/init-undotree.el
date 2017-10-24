;; -*- coding: utf-8 -*-

;; undo tree mode
(require-package 'undo-tree)
(require 'undo-tree)
(setq undo-tree-mode-lighter " UT")
(global-undo-tree-mode)
(global-set-key (kbd "M-/") 'undo-tree-undo)
(provide 'init-undotree)
