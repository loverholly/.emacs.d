(add-hook 'after-init-hook 'recentf-mode)
(setq-default
 recentf-max-saved-items 20
 recentf-exclude '("/tmp/" "/ssh:"))


(provide 'init-recentf)
