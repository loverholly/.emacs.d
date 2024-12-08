;;; init-pdf.el --- Use pdf for pdf manager -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
(use-package pdf-tools
  :diminish pdf-view-themed-minor-mode
  :functions (pdf-view-refresh-themed-buffer)
  :defines (pdf-view-themed-minor-mode)
  :mode ("\\.pdf\\'" . pdf-view-mode)
  :hook ((pdf-view-mode . pdf-view-themed-minor-mode)
         (pdf-view-mode . pdf-isearch-minor-mode))
  :custom (pdf-view-display-size 3.85)
  :bind
  (:map
   pdf-view-mode-map
   ("C-s" . isearch-forward)
   ("C-r" . isearch-backward)
   ("C-o" . pdf-occur)
   ("C-l" . pdf-view-center-in-window)
   ("j" . (lambda ()
            "Next line within page"
            (interactive)
            (image-next-line 10)))
   ("k" . (lambda ()
            "Previous line within page"
            (interactive)
            (image-next-line -10)))
   ("n" . kimim/pdf-view-next-page)
   ("p" . kimim/pdf-view-previous-page)
   ("o" . other-window)
   ("<home>". (lambda ()
                (interactive)
                (image-scroll-up -999)))
   ("<end>". (lambda ()
               (interactive)
               (image-scroll-up 999)))
   ("C-c C-z" . pdf-view-open-bibtex-notes)
   ("/" . (lambda ()
            (interactive)
            (let ((filename (file-name-nondirectory
                             (buffer-file-name))))
              (kill-new
               filename)
              (message "Copied %s" filename))))
   ("t" . kimim/pdf-view-pagetext)
   ("`" . kimim/fanyi-in-pdf)
   ("<mouse-3>" . kimim/fanyi-in-pdf))
  :config
  (require 'pdf-tools)
  (require 'fanyi)
  (defun kimim/fanyi-in-pdf ()
    "Invoke fanyi in pdf-view."
    (interactive)
    (pdf-view-assert-active-region)
    (if-let ((word (car (pdf-view-active-region-text))))
        (progn
          (fanyi-dwim word)
          (cl-pushnew word fanyi-history))
      (call-interactively #'fanyi-dwim)))

  (advice-add 'enable-theme :after
              (lambda (&rest _)
                (when pdf-view-themed-minor-mode
                  (pdf-view-refresh-themed-buffer t))))

  (require 'bibtex-completion)
  (defun kimim/pdf-view-next-page (&optional n)
    (interactive "p")
    (pdf-view-next-page n)
    (image-bob))

  (defun kimim/pdf-view-previous-page (&optional n)
    (interactive "p")
    (pdf-view-previous-page n)
    (image-bob))

  (defun pdf-view-open-bibtex-notes ()
    "From PDF file, open the notes if they exist."
    (interactive)
    (bibtex-completion-edit-notes (list (pdf-view-get-bibtex-key))))

  (defun pdf-view-get-bibtex-key ()
    "Get bibtex key from PDF buffer name in pdf-view mode"
    (car (string-split (buffer-name) "[-\\(_\\.]+")))

  (defun kimim/pdf-view-pagetext ()
    "Show pdf text in a buffer."
    (interactive)
    (pdf-view-mark-whole-page)
    (pdf-view-kill-ring-save)
    (switch-to-buffer "*pdf-view-pagetext*")
    (yank)))

(provide 'init-pdf)
