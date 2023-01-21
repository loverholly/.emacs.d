;;; init-mwim.el --- mwim support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'mwim)

(global-set-key (kbd "C-a") 'mwim-beginning-of-code-or-line)
(global-set-key (kbd "C-e") 'mwim-end-of-code-or-line)

(provide 'init-mwim)
;;; init-mwim.el ends here
