;;; init-ai.el --- ai-mode support -*- lexical-binding: t -*-
;;; Commentary:

(use-package aidermacs
  :bind ("C-c a" . aidermacs-transient-menu)
  :config
  ;; 这里只演示环境变量，也可以放 password-store
  (setenv "OPENAI_API_KEY" "sk-...")
  :custom
  (aidermacs-default-model "gpt-4o")
  (aidermacs-default-chat-mode 'architect))

(provide 'init-ai)
