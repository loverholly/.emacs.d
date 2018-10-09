(defun sanityinc/utf8-locale-p (v)
  "Return whether locale string V relates to a UTF-8 locale."
  (and v (string-match "UTF-8" v)))

(defun sanityinc/locale-is-utf8-p ()
  "Return t iff the \"locale\" command or environment variables prefer UTF-8."
  (or (sanityinc/utf8-locale-p (and (executable-find "locale") (shell-command-to-string "locale")))
      (sanityinc/utf8-locale-p (getenv "LC_ALL"))
      (sanityinc/utf8-locale-p (getenv "LC_CTYPE"))
      (sanityinc/utf8-locale-p (getenv "LANG"))))

(when (or window-system (sanityinc/locale-is-utf8-p))
  (set-language-environment 'Chinese-GB)
  (setq w32-enable-synthesized-fonts t)
  (set-default-coding-systems 'gb2312)
  (set-terminal-coding-system 'utf-8)
  (set-selection-coding-system (if (eq system-type 'windows-nt) 'gb2312  'utf-8 ))
  (setq default-buffer-file-coding-system 'gb2312)
  (prefer-coding-system 'utf-16)
  (prefer-coding-system 'utf-8-dos)
  (prefer-coding-system 'utf-8-unix)
  (prefer-coding-system 'utf-8)
  (prefer-coding-system 'cp950)
  (prefer-coding-system 'cp936)
  (prefer-coding-system 'gb2312)
  (setq-default pathname-coding-system 'gb2312)
  (setq file-name-coding-system 'gb2312))


(provide 'init-locales)
