;;; init-csv.el --- CSV files -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(when (maybe-require-package 'csv-mode)
  (add-auto-mode 'csv-mode "\\.[Cc][Ss][Vv]\\'")

  (setq csv-separators '("," ";" "|" " "))
  (add-hook 'csv-mode-hook 'csv-align-mode))

(provide 'init-csv)
;;; init-csv.el ends here
