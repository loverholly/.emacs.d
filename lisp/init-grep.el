(setq-default grep-highlight-matches t
              grep-scroll-output t)
;;; redefine the default grep template;some times emacs for windows the arguments is wrong
;; (setq-default grep-find-template '[grep -nH --null "{}" ";"])
(setq-default grep-use-null-device nil)
(setq-default grep-command "grep  -nH ")

(when *is-a-mac*
  (setq-default locate-command "mdfind"))

(when (and (executable-find "ag")
           (maybe-require-package 'ag))
  (require-package 'wgrep-ag)
  (setq-default ag-highlight-search t)
  (global-set-key (kbd "M-?") 'ag-project))

(when (and (executable-find "rg")
           (maybe-require-package 'rg))
  (global-set-key (kbd "M-?") 'rg-project))


(provide 'init-grep)
