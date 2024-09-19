;;; init-treesitter.el
;;; Commentary:
;;; Code:

(add-hook 'c-or-c++-mode #'tree-sitter-hl-mode)
(add-hook 'c-or-c++-ts-mode #'tree-sitter-hl-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
;;; for parser best result
(setq-default treesit-font-lock-level 4)
(setq-default c-ts-mode-indent-offset 8)
(setq-default c-ts-mode-indent-style 'linux)

(setq major-mode-remap-alist
      '((yaml-mode . yaml-ts-mode)
        (sh-mode . bash-ts-mode)
        (js-mode . js-ts-mode)
        (css-mode . css-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (python-mode . python-ts-mode)))

(setq tree-sitter-hl-mode t)

(provide 'init-treesitter)
;;; init-treesitter.el ends here
