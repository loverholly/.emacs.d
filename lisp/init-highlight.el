;;; init-highlight.el --- highlight customisations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'highlight-symbol)
(require-package 'highlight-parentheses)

(global-set-key (kbd "<f3>") 'highlight-symbol)
(highlight-parentheses-mode 1)

(provide 'init-highlight)
;;; init-highlight.el ends here
