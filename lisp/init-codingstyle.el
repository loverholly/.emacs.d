;;; init-codingstyle.el --- Day-to-day editing helpers -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(defun c-lineup-arglist-tabs-only (ignored)
  "Line up argument lists by tabs, not spaces"
  (let* ((anchor (c-langelem-pos c-syntactic-element))
		 (column (c-langelem-2nd-pos c-syntactic-element))
		 (offset (- (1+ column) anchor))
		 (steps (floor offset c-basic-offset)))
	(* (max steps 1)
	   c-basic-offset)))

(add-hook 'c-mode-common-hook
		  (lambda ()
			;; Add kernel style
			(c-add-style
			 "linux-tabs-only"
			 '("linux" (c-offsets-alist
						(arglist-cont-nonempty
						 c-lineup-gcc-asm-reg
						 c-lineup-arglist-tabs-only))))))

(add-hook 'c-mode-hook
		  (lambda ()
			(let ((filename (buffer-file-name)))
			  ;; Enable kernel mode for the appropriate files
			  (when (and filename
						 (string-match (expand-file-name "~/src/linux-trees")
									   filename))
				(setq indent-tabs-mode t)
				(setq show-trailing-whitespace t)
				(c-set-style "linux-tabs-only")))))

(provide 'init-codingstyle)
;;; init-codingstyle.el ends here
