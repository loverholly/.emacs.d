;;; init-flycheck.el --- Configure Flycheck global behaviour -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'flycheck)
  (add-hook 'after-init-hook 'global-flycheck-mode)
  (setq flycheck-display-errors-function #'flycheck-display-error-messages-unless-error-list)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (setq flycheck-indication-mode 'right-fringe)
  (setq flycheck-fringe-indicator-position 'right)

  (when (maybe-require-package 'flycheck-color-mode-line)
    (add-hook 'flycheck-mode-hook 'flycheck-color-mode-line-mode)))

(require-package 'flycheck-pkg-config)
(require-package 'flycheck-irony)
(require-package 'flycheck-checkbashisms)
(require-package 'flycheck-ledger)
(require-package 'flycheck-pycheckers)

(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))
(eval-after-load 'flycheck
  '(require 'flycheck-ledger))
(eval-after-load 'flycheck '(add-hook 'flycheck-mode-hook #'flycheck-checkbashisms-setup))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
