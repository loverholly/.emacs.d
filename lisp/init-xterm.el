(require 'init-frame-hooks)

(global-set-key [mouse-4] (lambda () (interactive) (scroll-down 1)))
(global-set-key [mouse-5] (lambda () (interactive) (scroll-up 1)))

(autoload 'mwheel-install "mwheel")

(defun sanityinc/console-frame-setup ()
  (xterm-mouse-mode 1) ; Mouse in a terminal (Use shift to paste with middle button)
  (mwheel-install))

;; set open multi shell
(defun wcy-shell-mode-auto-rename-buffer (text)
  (if (eq major-mode 'shell-mode)
	  (rename-buffer  (concat "shell:" default-directory) t)))
(add-hook 'comint-output-filter-functions'wcy-shell-mode-auto-rename-buffer)

(add-hook 'after-make-console-frame-hooks 'sanityinc/console-frame-setup)

(provide 'init-xterm)
