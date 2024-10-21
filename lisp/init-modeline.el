;;; init-modeline.el --- Integrate with the modeline -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'smart-mode-line)

(setq sml/theme 'respectful)
(sml/setup)

(provide 'init-modeline)
