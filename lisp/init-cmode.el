;;; init-cmode.el --- cmode support -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:
;; See also init-cmode.el

(setq-default c-doc-comment-style
              '((java-mode   . javadoc)
                (pike-mode   . autodoc)
                (c-mode      . doxygen)
                (c++-mode    . doxygen)
                (c-ts-mode   . doxygen)
                (c++-ts-mode . doxygen)))

(c-set-offset 'arglist-cont '(c-lineup-ternary-bodies
                              c-lineup-gcc-asm-reg))
(c-set-offset 'arglist-cont-nonempty '(c-lineup-ternary-bodies
                                       c-lineup-gcc-asm-reg
                                       c-lineup-arglist))
(c-set-offset 'statement-cont '(c-lineup-ternary-bodies +))

(provide 'init-cmode)
;;; init-cmode.el ends here
