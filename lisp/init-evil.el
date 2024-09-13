;;; init-evil.el --- Integrate with the evil -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'evil)
(require-package 'evil-visual-mark-mode)
(require-package 'evil-visual-replace)
(require-package 'evil-search-highlight-persist)
(require-package 'powerline)

(evil-mode 1)
(evil-visual-mark-mode 1)
(global-evil-search-highlight-persist t)
(powerline-vim-theme)
(display-time-mode t)
(setq make-backup-files nil)
(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

(provide 'init-evil)
;;; init-evil.el ends here
