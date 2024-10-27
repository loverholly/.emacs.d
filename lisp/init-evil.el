;;; init-evil.el --- Integrate with the evil -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(require-package 'evil)
(require-package 'evil-visual-mark-mode)
(require-package 'evil-visual-replace)
(require-package 'evil-search-highlight-persist)
(require-package 'powerline)
(require-package 'goto-chg)
(require-package 'evil-leader)
(require-package 'evil-surround)
(require-package 'evil-snipe)
(require-package 'evil-matchit)
(require-package 'evil-anzu)
(require-package 'evil-collection)
(require-package 'evil-nerd-commenter)
(require-package 'evil-org)

(setq evil-want-keybinding nil)
(setq evil-want-C-u-scroll t)
(setq evil-shift-width 8)
(global-set-key (kbd "C-x e") 'evil-mode)

(evil-mode 1)
(evil-visual-mark-mode 1)
(global-evil-search-highlight-persist t)
(powerline-vim-theme)
(display-time-mode t)
(evil-snipe-mode 1)
(evil-collection-init)
(global-evil-matchit-mode 1)
(global-evil-surround-mode 1)
(evilnc-default-hotkeys)

(define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)
(define-key evil-normal-state-map (kbd "<tab>") 'c-indent-line-or-region)
(define-key evil-motion-state-map (kbd "RET") 'nil)

(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)
(define-key evil-normal-state-map (kbd ",p") 'previous-buffer)
(define-key evil-normal-state-map (kbd ",n") 'next-buffer)

(define-key evil-normal-state-map
	    (kbd "gd") 'helm-gtags-dwim)
(add-hook 'org-mode-hook 'evil-org-mode)

(provide 'init-evil)
;;; init-evil.el ends here
