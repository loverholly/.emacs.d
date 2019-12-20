;;; init-whitespace.el --- Special handling for whitespace -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(setq-default show-trailing-whitespace nil)


;;; Whitespace

(defun sanityinc/show-trailing-whitespace ()
  "Enable display of trailing whitespace in this buffer."
  (setq-local show-trailing-whitespace t))

(defun sanityinc/hide-trailing-whitespace ()
  "hide display of trailing whitespace in this buffer."
  (setq-local show-trailing-whitespace nil))

(dolist (hook '(special-mode-hook
				Info-mode-hook
				eww-mode-hook
				term-mode-hook
				c-mode-hook
				comint-mode-hook
				compilation-mode-hook
				twittering-mode-hook
				minibuffer-setup-hook
				prog-mode-hook
				text-mode-hook
				conf-mode-hook))
  (add-hook hook #'sanityinc/hide-trailing-whitespace))

(require-package 'whitespace-cleanup-mode)
(add-hook 'after-init-hook 'global-whitespace-cleanup-mode)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
;; in c/c++ programmer mode, comment it
;; (add-hook 'before-save-hook 'whitespace-cleanup)
;; (add-hook 'before-save-hook 'delete-blank-lines)
(after-load 'whitespace-cleanup-mode
  (diminish 'whitespace-cleanup-mode))

(setq whitespace-style '(face empty lines-tail trailing))
(global-whitespace-mode t)

(setq-default whitespace-cleanup-mode t)

(global-set-key [remap just-one-space] 'cycle-spacing)


(provide 'init-whitespace)
;;; init-whitespace.el ends here
