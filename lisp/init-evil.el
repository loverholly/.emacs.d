;;; init-evil.el --- Integrate with the evil -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'evil)
(require-package 'evil-visual-mark-mode)
(require-package 'evil-visual-replace)

(evil-mode 1)
(evil-visual-mark-mode 1)

(provide 'init-evil)
;;; init-evil.el ends here
