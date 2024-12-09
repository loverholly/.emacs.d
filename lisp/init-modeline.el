;;; init-modeline.el --- Integrate with the modeline -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package smart-mode-line
  :ensure t
  :init
  (sml/setup)
  :config
  (setq sml/theme 'respectful)
  (setq sml/vc t)
  (setq sml/vc-mode-show-backend t)
  (setq keycast-mode-line-insert-after 'mode-line-end-spaces))

(use-package keycast
  :ensure t
  :config
  (keycast-mode-line-mode 1))

(provide 'init-modeline)
