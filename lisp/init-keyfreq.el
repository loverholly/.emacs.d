;;; init-keyfreq.el --- Keyfreq support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)
(setq keyfreq-file "~/.emacs.d/keyfreq-log")

(provide 'init-keyfreq)
;;; init-keyfreq.el ends here
