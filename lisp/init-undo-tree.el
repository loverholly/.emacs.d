;;; init-undo-tree.el --- undo-tree support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'undo-tree)

(global-undo-tree-mode t)
(setq-default undo-tree-save-history nil)

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
