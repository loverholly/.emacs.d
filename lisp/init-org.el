;;; init-org.el --- Org-mode config -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; -*- coding: utf-8 -*-
;; org-complete����

;; ����org��״̬�仯��ǩ
;;�ڣ����ж��帽��ѡ�����:
;;�ַ�����״̬�Ŀ�ݼ�
;;�����л�����״̬ʱ���Զ�����ʱ���
;;@ ���л�����״̬ʱҪ����������˵��
;;���ͬʱ�趨@�ͣ���ʹ�á�@/!��
(setq org-todo-keywords
      '((sequence "TODO(t@/!)" "|" "CANCELED(c@/!)" "DELAY(l@/!)" "ABORT(a@/!)" "DONE(d@/!)")
        (sequence "REPORT(r@)" "BUG(b@)" "KNOWNCAUSE(k)" "|" "FIXED(f@)")
        ))

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)
(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c b") 'org-switchb)

;; Various preferences
(setq org-log-done t
      org-edit-timestamp-down-means-later t
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)

;; ����org���﷨����
(setq org-src-fontify-natively t)

;; ����org����ʱ���ĵ�ǰ������һ���½�Ŀ¼��
(setq org-export-with-toc t)

;; ���ÿ���ת�����з�
(setq org-export-preserve-breaks t)

;; ���õ���ʱ���ɶ�Ӧ��Ŀ¼�㼶,������Ϊ6��
(setq org-export-with-section-numbers 6)

;; �������������û����ɣ���ô�������ܽ���
(setq org-enforce-todo-dependencies t)

;; �����������ʱ��ʱ��,��¼�ʼ�
(setq org-log-done 'note)
(setq org-log-done 'time)

;; ����org���ѹ���
(setq org-agenda-to-appt t)

;; ����һ��ȫ�ֵ�org��ǩ
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("@happy" . ?p) ("@friend" . ?f) ("@study" . ?s) ("@note" . ?n)))

;; ���ò�ͬ�ı��⼶����ʾ��ͬ�����ִ�С
;; (set-face-attribute 'org-level-1 nil :height 1.8 :bold t)
;; (set-face-attribute 'org-level-2 nil :height 1.6 :bold t)
;; (set-face-attribute 'org-level-3 nil :height 1.4 :bold t)
;; (set-face-attribute 'org-level-4 nil :height 1.2 :bold t)

;; �����»���ת��
(setq-default org-export-with-sub-superscripts nil)

;; ����Ƶ���л����뷨�ˣ�����״̬Ҳ��������*
(defun org-mode-my-init ()
  (define-key org-mode-map (kbd "x") (kbd "*"))
  (define-key org-mode-map (kbd "��") (kbd "-"))
  )

(add-hook 'org-mode-hook 'org-mode-my-init)

;; ����orgȫ���б�
(setq org-agenda-list (list "~/.emacs.d/org"))
(setq org-agenda-files (list "~/.emacs.d/org"))

;; Ĭ�Ͻ����е�org indent����
(setq org-startup-indented t)

;; ������ʾ�����ڼ���
(setq mark-holidays-in-calendar t)
(setq org-support-shift-select t)

(let ((active-project-match "-INBOX/PROJECT"))

  (setq org-stuck-projects
        `(,active-project-match ("NEXT")))

  (setq org-agenda-compact-blocks t
        org-agenda-sticky t
        org-agenda-start-on-weekday nil
        org-agenda-span 'day
        org-agenda-include-diary nil
        org-agenda-sorting-strategy
        '((agenda habit-down time-up user-defined-up effort-up category-keep)
          (todo category-up effort-up)
          (tags category-up effort-up)
          (search category-up))
        org-agenda-window-setup 'current-window
        org-agenda-custom-commands
        `(("N" "Notes" tags "NOTE"
           ((org-agenda-overriding-header "Notes")
            (org-tags-match-list-sublevels t)))
          ("g" "GTD"
           ((agenda "" nil)
            (tags "INBOX"
                  ((org-agenda-overriding-header "Inbox")
                   (org-tags-match-list-sublevels nil)))
            (stuck ""
                   ((org-agenda-overriding-header "Stuck Projects")
                    (org-agenda-tags-todo-honor-ignore-options t)
                    (org-tags-match-list-sublevels t)
                    (org-agenda-todo-ignore-scheduled 'future)))
            (tags-todo "-INBOX"
                       ((org-agenda-overriding-header "Next Actions")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-skip-function
                         '(lambda ()
                            (or (org-agenda-skip-subtree-if 'todo '("HOLD" "WAITING"))
                                (org-agenda-skip-entry-if 'nottodo '("NEXT")))))
                        (org-tags-match-list-sublevels t)
                        (org-agenda-sorting-strategy
                         '(todo-state-down effort-up category-keep))))
            (tags-todo ,active-project-match
                       ((org-agenda-overriding-header "Projects")
                        (org-tags-match-list-sublevels t)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-INBOX/-NEXT"
                       ((org-agenda-overriding-header "Orphaned Tasks")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-skip-function
                         '(lambda ()
                            (or (org-agenda-skip-subtree-if 'todo '("PROJECT" "HOLD" "WAITING" "DELEGATED"))
                                (org-agenda-skip-subtree-if 'nottododo '("TODO")))))
                        (org-tags-match-list-sublevels t)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "/WAITING"
                       ((org-agenda-overriding-header "Waiting")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "/DELEGATED"
                       ((org-agenda-overriding-header "Delegated")
                        (org-agenda-tags-todo-honor-ignore-options t)
                        (org-agenda-todo-ignore-scheduled 'future)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            (tags-todo "-INBOX"
                       ((org-agenda-overriding-header "On Hold")
                        (org-agenda-skip-function
                         '(lambda ()
                            (or (org-agenda-skip-subtree-if 'todo '("WAITING"))
                                (org-agenda-skip-entry-if 'nottodo '("HOLD")))))
                        (org-tags-match-list-sublevels nil)
                        (org-agenda-sorting-strategy
                         '(category-keep))))
            ;; (tags-todo "-NEXT"
            ;;            ((org-agenda-overriding-header "All other TODOs")
            ;;             (org-match-list-sublevels t)))
            )))))


(add-hook 'org-agenda-mode-hook 'hl-line-mode)

;;; Org clock

;; Save the running clock and all clock history when exiting Emacs, load it on startup
(after-load 'org
  (org-clock-persistence-insinuate))
(setq org-clock-persist t)
(setq org-clock-in-resume t)
;; Save clock data and notes in the LOGBOOK drawer
(setq org-clock-into-drawer t)
;; Save state changes in the LOGBOOK drawer
(setq org-log-into-drawer t)
;; Removes clocked tasks with 0:00 duration
(setq org-clock-out-remove-zero-time-clocks t)

;; Show clock sums as hours and minutes, not "n days" etc.
(setq org-time-clocksum-format
      '(:hours "%d" :require-hours t :minutes ":%02d" :require-minutes t))

;; orgģʽ���书��
(setq org-capture-templates
      '(("w" "work" entry (file+headline "~/.emacs.d/org/projects.org" "projects")
             "* TODO %?\n %i\n")
        ("h" "Home" entry (file+datetree "~/.emacs.d/org/home.org")
         "* %?\nEntered on %U\n %i\n")
        ("n" "Note" entry (file+datetree "~/.emacs.d/org/notes.org")
         "* %?\nEntered on %U\n %i\n")
        ("s" "Study" entry (file "~/.emacs.d/org/study.org")
         "* %?\nEntered on %U\n %i\n")
        ("f" "Funy" entry (file+datetree "~/.emacs.d/org/funy.org")
         "* %?\nEntered on %U\n %i\n")
        ))


;; ����������״̬����ʱ��������Ҳ����
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; ����org refile
;; (setq org-refile-targets (quote (("projects.org":maxlevel . 1)
;;                                  ("home.org":level . 2))))

;; ���ճ̱�
(org-agenda-list t)

;; �����ճ̱�Ĳ鿴���ʱ��Ϊ21��
(setq org-agenda-ndays 21)
(setq org-agenda-include-diary t)
(setq mark-holidays-in-calendar t)

(setq my-holidays
      '(;; ��������
        (holiday-fixed 1 1   "Ԫ����")
        (holiday-fixed 2 14  "���˽�")
        (holiday-fixed 5 1   "�Ͷ���")
        (holiday-fixed 9 10  "��ʦ��")
        (holiday-fixed 10 1  "�����")
        (holiday-float 6 0 3 "���׽�")
        ;; ũ������
        (holiday-lunar 1 1   "����"       0)
        (holiday-lunar 1 15  "Ԫ����"     0)
        (holiday-solar-term  "������"      )
        (holiday-lunar 5 5   "�����"     0)
        (holiday-lunar 7 7   "��Ϧ���˽�" 0)
        (holiday-lunar 8 15  "�����"     0)
        ;; ������
        (holiday-lunar 10 15 "Ů������"   0)
        (holiday-lunar 11 05 "��������"   0)
        (holiday-lunar 04 14 "�ҵ�����"   0)
        (holiday-lunar 02 05 "��������"   0)
        (holiday-lunar 07 01 "ĸ������"   0)
        (holiday-lunar 03 14 "�������"   0)
        ))
(setq calendar-holidays my-holidays)  ;ֻ��ʾ�Ҷ��ƵĽڼ���

;; �ر���������
(delete-other-windows)
(provide 'init-org)
;;; init-org.el ends here
