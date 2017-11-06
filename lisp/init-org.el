;; -*- coding: utf-8 -*-
;; org-complete设置

;; 设置org的状态变化标签
;;在（）中定义附加选项，包括:
;;字符：该状态的快捷键
;;！：切换到该状态时会自动增加时间戳
;;@ ：切换到该状态时要求输入文字说明
;;如果同时设定@和！，使用“@/!”
 (setq org-todo-keywords
           '((sequence "TODO(t@/!)" "|" "CANCELED(c@/!)" "DELAY(l@/!)" "ABORT(a@/!)" "DONE(d@/!)")
             (sequence "REPORT(r@)" "BUG(b@)" "KNOWNCAUSE(k)" "|" "FIXED(f@)")
             ))
	     
(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; Various preferences
(setq org-log-done t
      org-edit-timestamp-down-means-later t
      org-archive-mark-done nil
      org-hide-emphasis-markers t
      org-catch-invisible-edits 'show
      org-export-coding-system 'utf-8
      org-fast-tag-selection-single-key 'expert
      org-html-validation-link nil
      org-export-kill-product-buffer-when-displayed t
      org-tags-column 80)

;; 设置org中语法高亮
(setq org-src-fontify-natively t)

;; 设置如果子任务没有完成，那么父任务不能结束
(setq org-enforce-todo-dependencies t)

;; 设置任务结束时的时间,记录笔记
(setq org-log-done 'note)
(setq org-log-done 'time)

;; 设置org提醒功能
(setq org-agenda-to-appt t)


;; 设置一个全局的org标签
(setq org-tag-alist '(("@work" . ?w) ("@home" . ?h) ("@happy" . ?p) ("@friend" . ?f) ("@study" . ?s) ("@note" . ?n)))

;; 设置不同的标题级别显示不同的文字大小
;; (set-face-attribute 'org-level-1 nil :height 1.8 :bold t)
;; (set-face-attribute 'org-level-2 nil :height 1.6 :bold t)
;; (set-face-attribute 'org-level-3 nil :height 1.4 :bold t)
;; (set-face-attribute 'org-level-4 nil :height 1.2 :bold t)

;; 禁用下划线转义
(setq-default org-use-sub-superscripts nil)

;; 不用频繁切换输入法了，中文状态也可以输入*
(defun org-mode-my-init ()
  ; ......
  (define-key org-mode-map (kbd "×") (kbd "*"))
  (define-key org-mode-map (kbd "－") (kbd "-"))
  )

(add-hook 'org-mode-hook 'org-mode-my-init)

;; 配置中英文无法对齐的问题
(set-default-font "Microsoft Yahei 20")
;; (set-fontset-font "fontset-default" 'unicode"WenQuanYi Bitmap Song 12") ;;for linux
(set-fontset-font "fontset-default" 'unicode "宋体 20") ;; for windows

;; 设置org全局列表
(setq org-agenda-list (list "~/.emacs.d/org"))
(setq org-agenda-files (list "~/.emacs.d/org"))

;; 设置org快捷键
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; 默认将所有的org indent都打开
(setq org-startup-indented t)

;; 配置显示日历节假日
(setq mark-holidays-in-calendar t)
(setq org-support-shift-select t)
(global-set-key (kbd "C-c c") 'org-capture)

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

;; org模式记忆功能
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


;; 设置子任务状态更新时，父任务也更新
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
    (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
    
(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

;; 设置org refile
;; (setq org-refile-targets (quote (("projects.org":maxlevel . 1)
;;                                  ("home.org":level . 2))))

;; 打开日程表
(org-agenda-list t)
;; 关闭其他窗口
(delete-other-windows)
(provide 'init-org)
