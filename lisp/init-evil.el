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
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  )

(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)

(provide 'init-evil)
;;; init-evil.el ends here
