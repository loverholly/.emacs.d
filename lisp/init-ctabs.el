;;; init-ctabs.el --- centaur-tabs support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'centaur-tabs)
(setq centaur-tabs-set-icons t)
(setq centaur-tabs-plain-icons t)
(setq centaur-tabs-set-modified-marker t)
(setq centaur-tabs-mode t)

;; Unset the default behavior of the C-x <left> and <right> arrow key navigation
(global-unset-key (kbd "C-x <left>"))
(global-unset-key (kbd "C-x <right>"))

(use-package centaur-tabs
  :after (dashboard org)

  :config
  (centaur-tabs-mode 1)

  (defun centaur-tabs-buffer-groups ()
    "Groups tabs based on which project root they are in if possible"
    (let ((get-closest-projectile-project
	   (lambda (path)
	     (let ((expanded-path (f-long path)))
	       (-first (lambda (proj)
			 (s-starts-with? proj
					 expanded-path))
		       (-map (lambda (proj)
			       (f-long proj))
			     projectile-known-projects))))))
      (list (cond
	     ;; Group as part of projectile project if directly part of it
	     ((condition-case _err
		  (projectile-project-root)
		(error nil))
	      (f-expand (projectile-project-root)))
	     ;; Try to group as part of projectile project if indirectly part of it (started from the same directory, not yet tracked, or maybe temporary buffer)
	     (get-closest-projectile-project default-directory)
	     ((string-equal "*" (substring (buffer-name) 0 1))
	      "proc-buffers")
	     ;; ... other groupings ...
	     (t
	      "Other")))))

  :custom
  (centaur-tabs-set-icons t)
  (centaur-tabs-plain-icons t)
  (centaur-tabs-set-modified-marker t)

  :bind
  (("C-x <left>" . centaur-tabs-backward-tab)
   ("C-x <right>" . centaur-tabs-forward-tab))

  :hook
  ((dashboard-mode . centaur-tabs-local-mode)
   (org-src-mode . centaur-tabs-local-mode)
   (calendar-mode . centaur-tabs-local-mode)))

(provide 'init-ctabs)
