;; save a list of open files in ~/.emacs.d/.emacs.desktop
(setq desktop-path (list user-emacs-directory)
      desktop-auto-save-timeout 600)
(desktop-save-mode 1)

(defadvice desktop-read (around time-restore activate)
    (let ((start-time (current-time)))
      (prog1
          ad-do-it
        (message "Desktop restored in %.2fms"
                 (sanityinc/time-subtract-millis (current-time)
                                                 start-time)))))

(defadvice desktop-create-buffer (around time-create activate)
  (let ((start-time (current-time))
        (filename (ad-get-arg 1)))
    (prog1
        ad-do-it
      (message "Desktop: %.2fms to restore %s"
               (sanityinc/time-subtract-millis (current-time)
                                               start-time)
               (when filename
                 (abbreviate-file-name filename))))))

;;----------------------------------------------------------------------------
;; Restore histories and registers after saving
;;----------------------------------------------------------------------------
(setq-default history-length 50)
(add-hook 'after-init-hook 'savehist-mode)

(require-package 'session)

(setq session-save-file (expand-file-name ".session" user-emacs-directory))
(setq session-name-disable-regexp "\\(?:\\`'/tmp\\|\\.git/[A-Z_]+\\'\\)")
(add-hook 'after-init-hook 'session-initialize)

;; save a bunch of variables to the desktop file
;; for lists specify the len of the maximal saved data also
(setq desktop-globals-to-save
      (append '((comint-input-ring        . 20)
                (compile-history          . 20)
                desktop-missing-file-warning
                (dired-regexp-history     . 20)
                (extended-command-history . 20)
                (face-name-history        . 20)
                (file-name-history        . 10)
                (grep-find-history        . 20)
                (grep-history             . 20)
                (ido-buffer-history       . 20)
                (ido-last-directory-list  . 20)
                (ido-work-directory-list  . 20)
                (ido-work-file-list       . 20)
                (ivy-history              . 20)
                (magit-read-rev-history   . 20)
                (minibuffer-history       . 20)
                (org-clock-history        . 20)
                (org-refile-history       . 20)
                (org-tags-history         . 20)
                (query-replace-history    . 20)
                (read-expression-history  . 20)
                (regexp-history           . 20)
                (regexp-search-ring       . 20)
                register-alist
                (search-ring              . 20)
                (shell-command-history    . 20)
                tags-file-name
                tags-table-list)))


(provide 'init-sessions)
