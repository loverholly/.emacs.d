;;; init-emojify.el --- emojify support -*- lexical-binding: t -*-
;;; Commentary:

(require-package 'emojify)
(add-hook 'after-init-hook #'global-emojify-mode)
(setq emojify-user-emojis '((":trollface:" . (("name" . "Troll Face")
                                              ("image" . "~/.emacs.d/emojis/trollface.png")
                                              ("style" . "github")))
                            (":neckbeard:" . (("name" . "Neckbeard")
                                              ("image" . "~/.emacs.d/emojis/neckbeard.png")
                                              ("style" . "github")))))

;; If emojify is already loaded refresh emoji data
(when (featurep 'emojify)
  (emojify-set-emoji-data))

(provide 'init-emojify)
