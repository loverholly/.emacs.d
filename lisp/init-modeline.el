;;; init-modeline.el --- Integrate with the modeline -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'smart-mode-line)

(smart-mode-line-enable t)
(set-face-background 'mode-line "#000000") ; 设置活动模式行的背景颜色为黑色
(set-face-background 'mode-line-inactive "#1F1F1F") ; 设置非活动模式行的背景颜色为深灰色

(provide 'init-modeline)
