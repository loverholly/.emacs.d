;;; init-treesitter.el
;;; Commentary:
;;; Code:

(require-package 'treesit-auto)
(require-package 'tree-sitter)
(require-package 'tree-sitter-langs)
(require-package 'treesit-ispell)

(require 'tree-sitter)
(require 'tree-sitter-hl)
(require 'tree-sitter-langs)
(require 'tree-sitter-query)
(global-tree-sitter-mode)
(add-hook 'c-or-c++-mode #'tree-sitter-hl-mode)
(add-hook 'c-or-c++-ts-mode #'tree-sitter-hl-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)
;;; for parser best result
(setq-default treesit-font-lock-level 4)
(setq-default c-ts-mode-indent-offset 8)
(setq-default c-ts-mode-indent-style 'linux)

(setq major-mode-remap-alist
      '((yaml-mode . yaml-ts-mode)
        (sh-mode . bash-ts-mode)
        (js-mode . js-ts-mode)
        (css-mode . css-ts-mode)
        (c-mode . c-ts-mode)
        (c++-mode . c++-ts-mode)
        (c-or-c++-mode . c-or-c++-ts-mode)
        (python-mode . python-ts-mode)))

(setq tree-sitter-hl-mode t)
(setq treesit-font-lock-level 4)

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
	(cmake "https://github.com/uyha/tree-sitter-cmake")
	(css "https://github.com/tree-sitter/tree-sitter-css")
	(elisp "https://github.com/Wilfred/tree-sitter-elisp")
	(go "https://github.com/tree-sitter/tree-sitter-go")
	(html "https://github.com/tree-sitter/tree-sitter-html")
	(javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
	(json "https://github.com/tree-sitter/tree-sitter-json")
	(make "https://github.com/alemuller/tree-sitter-make")
	(markdown "https://github.com/ikatyang/tree-sitter-markdown")
	(python "https://github.com/tree-sitter/tree-sitter-python")
	(toml "https://github.com/tree-sitter/tree-sitter-toml")
	(cpp "https://github.com/tree-sitter/tree-sitter-cpp")
	(c "https://github.com/tree-sitter/tree-sitter-c")
	(tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
	(typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
	(yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; You can download per-architecture pre-compiled release from
;; https://github.com/emacs-tree-sitter/tree-sitter-langs Rename
;; contained grammars to add prefix "libtree-sitter-", place in
;; ~/.emacs.d/tree-sitter.
;;
;; Nix users can pre-install all grammars alongside their Emacs, see
;; https://github.com/nix-community/emacs-overlay/issues/341
;;
;; Note that grammar files from different sources can be differently
;; named and configured, so there could be different results. Some
;; common remappings are included below.
(setq treesit-load-name-override-list nil
      major-mode-remap-alist nil)

(defun sanityinc/auto-configure-treesitter ()
  "Find and configure installed grammars, remap to matching -ts-modes if present.
Return a list of languages seen along the way."
  (let ((grammar-name-to-emacs-lang '(("c-sharp" . "csharp")
                                      ("cpp" . "c++")
                                      ("gomod" . "go-mod")
                                      ("javascript" . "js")))
        seen-grammars)
    (dolist (dir (cons (expand-file-name "tree-sitter" user-emacs-directory)
                       treesit-extra-load-path))
      (when (file-directory-p dir)
        (dolist (file (directory-files dir))
          (let ((fname (file-name-sans-extension (file-name-nondirectory file))))
            (when (string-match "libtree-sitter-\\(.*\\)" fname)
              (let* ((file-lang (match-string 1 fname))
                     (emacs-lang (or (cdr (assoc-string file-lang grammar-name-to-emacs-lang)) file-lang)))
                ;; Override library if its filename doesn't match the Emacs name
                (unless (or (memq (intern emacs-lang) seen-grammars)
                            (string-equal file-lang emacs-lang))
                  (let ((libname (concat "tree_sitter_" (replace-regexp-in-string "-" "_" file-lang))))
                    (add-to-list 'treesit-load-name-override-list
                                 (list (intern emacs-lang) fname libname))))
                ;; If there's a corresponding -ts mode, remap the standard mode to it
                (let ((ts-mode-name (intern (concat emacs-lang "-ts-mode")))
                      (regular-mode-name (intern (concat emacs-lang "-mode"))))
                  (when (fboundp ts-mode-name)
                    (add-to-list 'major-mode-remap-alist
                                 (cons regular-mode-name ts-mode-name))))
                ;; Remember we saw this language so we don't squash its config when we
                ;; find another lib later in the treesit load path
                (push (intern emacs-lang) seen-grammars)))))))
    seen-grammars))

(sanityinc/auto-configure-treesitter)

(provide 'init-treesitter)
;;; init-treesitter.el ends here
