;;; init-treesitter.el
;;; Commentary:
;;; Code:

(add-to-list 'treesit-extra-load-path
             (expand-file-name "~/.emacs.d/tree-sitter"))

(require-package 'treesit-auto)
(require-package 'treesit-ispell)
(setq-default global-treesit-auto-mode t)

(add-hook 'c-or-c++-mode #'tree-sitter-hl-mode)
(add-hook 'c-or-c++-ts-mode #'tree-sitter-hl-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
;;; for parser best result
(setq-default tree-sitter-hl-mode t)
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

(setq treesit-language-source-alist
      '((bash "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-bash")
	(cmake "https://gh-proxy.com/https://github.com/uyha/tree-sitter-cmake")
	(css "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-css")
	(elisp "https://gh-proxy.com/https://github.com/Wilfred/tree-sitter-elisp")
	(go "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-go")
	(html "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-html")
	(javascript "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
	(json "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-json")
	(make "https://gh-proxy.com/https://github.com/alemuller/tree-sitter-make")
	(markdown "https://gh-proxy.com/https://github.com/ikatyang/tree-sitter-markdown")
	(python "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-python")
	(toml "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-toml")
	(cpp "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-cpp")
	(c "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-c")
	(tsx "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	(typescript "https://gh-proxy.com/https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(yaml "https://gh-proxy.com/https://github.com/ikatyang/tree-sitter-yaml")
	(zig "https://gh-proxy.com/https://github.com/GrayJack/tree-sitter-zig")))


(provide 'init-treesitter)
;;; init-treesitter.el ends here
