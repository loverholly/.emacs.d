;;; init-themes.el --- Defaults for themes -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'dracula-theme)

;; Don't prompt to confirm theme safety. This avoids problems with
;; first-time startup on Emacs > 26.3.
(setq custom-safe-themes t)

;; If you don't customize it, this is the theme you get.
(setq-default custom-enabled-themes '(dracula))

;; Ensure that themes will be applied even if they have not been customized
(defun reapply-themes ()
  "Forcibly load the themes listed in `custom-enabled-themes'."
  (dolist (theme custom-enabled-themes)
    (unless (custom-theme-p theme)
      (load-theme theme)))
  (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

(add-hook 'after-init-hook 'reapply-themes)

(when (maybe-require-package 'dimmer)
  (setq-default dimmer-fraction 0.15)
  (add-hook 'after-init-hook 'dimmer-mode)

  (with-eval-after-load 'dimmer
    ;; Emacs 31 compatibility: skip non-string face attribute values (e.g. foreground-color)
    (advice-add 'dimmer--dim-face-attribute :around
                (lambda (orig &rest args)
                  (let ((face (nth 0 args))
                        (attribute (nth 1 args)))
                    (when (stringp (face-attribute face attribute))
                      (apply orig args)))))

    ;; Refresh all dimmer states after background mode changes
    (advice-add 'frame-set-background-mode :after
                (lambda (&rest args) (dimmer-process-all)))

    ;; Do not dim in terminal windows to avoid poor contrast
    (defun sanityinc/display-non-graphic-p ()
      (not (display-graphic-p)))
    (add-to-list 'dimmer-exclusion-predicates 'sanityinc/display-non-graphic-p)))


(provide 'init-themes)
;;; init-themes.el ends here
