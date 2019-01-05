(setq-default grep-highlight-matches t
              grep-scroll-output t)
;;; redefine the default grep template;some times emacs for windows the arguments is wrong
;; (setq-default grep-find-template '[grep -nH --null "{}" ";"])
(setq-default grep-use-null-device nil)
(setq-default grep-command "grep  -nwH --color ")

(when *is-a-mac*
  (setq-default locate-command "mdfind"))

(require-package 'wgrep)
(after-load 'grep
  (dolist (key (list (kbd "C-c C-q") (kbd "w")))
    (define-key grep-mode-map key 'wgrep-change-to-wgrep-mode)))

(when (and (executable-find "ag")
           (maybe-require-package 'ag))
  (require-package 'wgrep-ag)
  (setq-default ag-highlight-search t)
  (global-set-key (kbd "M-?") 'ag-project))

(when (and (executable-find "rg")
           (maybe-require-package 'rg))
  (maybe-require-package 'deadgrep)
  (global-set-key (kbd "M-?") 'rg-project))


(provide 'init-grep)
