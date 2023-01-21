;;; init-dashboard.el --- dashboard support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'dashboard)

(setq dashboard-banner-logo-title "Welcome to Emacs!")
(setq dashboard-projects-backend 'projectile)
(setq dashboard-startup-banner 'official)
(setq dashboard-items '((recents  . 5)
			(bookmarks . 5)
			(projects . 10)))

(dashboard-setup-startup-hook)

(provide 'init-dashboard)
;;; init-dashboard.el ends here
