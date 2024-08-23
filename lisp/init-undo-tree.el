;;; init-undo-tree.el --- undo-tree support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'undo-tree)

(global-undo-tree-mode 1)

(setq undo-tree-visualizer-timestamps t)
(setq undo-tree-visualizer-diff t)
(setq undo-tree-auto-save-history t)
(setq undo-tree-history-directory-alist
      '(("." . "~/.saves/")))

(setq undo-tree-visualizer-undo-method
      'undo-tree-visualize-undo-with-diff)
(add-hook 'undo-tree-visualizer-mode-hook
          (lambda ()
            (define-key undo-tree-visualizer-mode-map "~" 'undo-tree-visualize-undo)
            (define-key undo-tree-visualizer-mode-map "#" 'undo-tree-visualize-redo)))

(provide 'init-undo-tree)
;;; init-undo-tree.el ends here
