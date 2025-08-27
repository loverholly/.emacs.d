;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(when (version<= "30.0" emacs-version)
  (global-completion-preview-mode 1))

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (with-eval-after-load 'company
    (diminish 'company-mode)
    (define-key company-mode-map (kbd "M-/") 'company-complete)
    (define-key company-mode-map [remap completion-at-point] 'company-complete)
    (define-key company-active-map (kbd "M-/") 'company-other-backend)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
    (define-key company-active-map (kbd "M-.") 'company-show-location)
    (setq company-files-exclusions '(".git/" ".DS_Store"))
    (setq company-dabbrev-ignore-case 'keep-prefix)
    (setq-default company-dabbrev-other-buffers t
                  company-tooltip-align-annotations t
		  company-inhibit-inside-symbols t
		  company-minimum-prefix-length 1
		  company-show-numbers t
		  company-idle-delay 0.0
		  company-selection-wrap-around t
		  company-transformers '(delete-consecutive-dups company-sort-by-occurrence)
		  company-backends '((company-clang company-files company-ispell company-yasnippet company-keywords company-gtags company-capf company-dabbrev company-tempo company-cmake))))
  (global-set-key (kbd "M-C-/") 'company-complete)
  (when (maybe-require-package 'company-quickhelp)
    (add-hook 'after-init-hook 'company-quickhelp-mode)))

(provide 'init-company)
;;; init-company.el ends here
