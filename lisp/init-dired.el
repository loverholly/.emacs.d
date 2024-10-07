;;; init-dired.el --- Dired customisations -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'dired-subtree)
(require-package 'dired-rainbow)
(require-package 'dired-rsync)
(require-package 'dired-sidebar)
(require-package 'ibuffer-sidebar)

(global-set-key (kbd "<f4>") 'dired-sidebar-show-sidebar)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(add-hook 'dired-mode-hook 'auto-revert-mode)

(defun revert-dired-on-find-file ()
  "Revert Dired buffer when a file is opened."
  (when (eq major-mode 'dired-mode)
    (revert-buffer)))

(add-hook 'find-file-hook 'revert-dired-on-find-file)

(setq-default dired-dwim-target t)

(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
  (define-key dired-mode-map (kbd "^") (lambda () (interactive) (find-alternate-file ".."))))  ; was dired-up-directory)

;; Prefer g-prefixed coreutils version of standard utilities when available
(let ((gls (executable-find "gls")))
  (when gls (setq insert-directory-program gls)))

(when (maybe-require-package 'diredfl)
  (with-eval-after-load 'dired
    (diredfl-global-mode)
    (require 'dired-x)))

;; Hook up dired-x global bindings without loading it up-front
(define-key ctl-x-map "\C-j" 'dired-jump)
(define-key ctl-x-4-map "\C-j" 'dired-jump-other-window)

(with-eval-after-load 'dired
  (setq dired-recursive-deletes 'top)
  (define-key dired-mode-map [mouse-2] 'dired-find-file)
  (define-key dired-mode-map (kbd "C-c C-q") 'wdired-change-to-wdired-mode))

(when (maybe-require-package 'diff-hl)
  (with-eval-after-load 'dired
    (add-hook 'dired-mode-hook 'diff-hl-dired-mode)))

(provide 'init-dired)
;;; init-dired.el ends here
