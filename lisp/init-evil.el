;;; init-evil.el --- Integrate with the evil -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'evil)
(require-package 'evil-visual-mark-mode)
(require-package 'evil-visual-replace)
(require-package 'evil-search-highlight-persist)
(require-package 'powerline)
(require-package 'evil-leader)
(require-package 'evil-surround)
(require-package 'evil-nerd-commenter)

(evil-mode 1)
(evil-visual-mark-mode 1)
(global-evil-search-highlight-persist t)
(powerline-vim-theme)
(display-time-mode t)
(global-evil-surround-mode)
(evilnc-default-hotkeys)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "RET") 'nil)

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map (kbd "[ SPC") (lambda () (interactive) (evil-insert-newline-above) (forward-line)))
(define-key evil-normal-state-map (kbd "] SPC") (lambda () (interactive) (evil-insert-newline-below) (forward-line -1)))
(define-key evil-normal-state-map (kbd "[ b") 'previous-buffer)
(define-key evil-normal-state-map (kbd "] b") 'next-buffer)
(define-key evil-normal-state-map
  (kbd "gd") 'helm-gtags-dwim)

(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)

(provide 'init-evil)
;;; init-evil.el ends here
