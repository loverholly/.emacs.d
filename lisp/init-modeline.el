;;; init-modeline.el --- Integrate with the modeline -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'smart-mode-line)

(setq sml/theme 'respectful)
(setq sml/vc t)
(setq sml/vc-mode-show-backend t)
(sml/setup)

(provide 'init-modeline)
