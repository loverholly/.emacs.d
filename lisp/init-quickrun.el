;;; init-quickrun.el --- amx support -*- lexical-binding: t -*-
;;; Commentary:
;; Use this parameter as C++ default
(require-package 'quickrun)
(quickrun-add-command "c++/c1z"
  '((:command . "g++")
    (:exec    . ("%c -std=c++1z %o -o %e %s"
		 "%e %a"))
    (:remove  . ("%e")))
  :default "c++")

;; Use this parameter in pod-mode
(quickrun-add-command "pod"
  '((:command . "perldoc")
    (:exec    . "%c -T -F %s"))
  :mode 'pod-mode)

;; You can override existing command
(quickrun-add-command "c/gcc"
  '((:exec . ("%c -std=c++1z %o -o %e %s"
	      "%e %a")))
  :override t)

(provide 'init-quickrun)
