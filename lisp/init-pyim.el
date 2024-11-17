;;; init-pyim.el --- pyim support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'pyim)
(require-package 'pyim-basedict)
(require-package 'ace-pinyin)
(pyim-basedict-enable)
(setq default-input-method "pyim")
(setq-default pyim-punctuation-translate-p '(auto))
(setq pyim-page-tooltip '(posframe popup minibuffer))
(pyim-default-scheme 'quanpin)
(pyim-isearch-mode 1)
(setq pyim-page-length 5)

(global-set-key (kbd "C-c e") 'pyim-activate)
(global-set-key (kbd "C-c q") 'pyim-deactivate)

(provide 'init-pyim)
