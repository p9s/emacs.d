;;; init-evil.el --- 支持vim key bind
;;; Commentary:
;;; Code:

(require 'evil)
(evil-mode 1)

(require 'evil-surround
         :ensure t
         :config
         (global-evil-surround-mode 1))


(require 'general)
(general-evil-setup t)
;; use ', as leader key

(general-create-definer my-comma-leader-def
  :prefix ","
  :state '(normal visual))


(my-comma-leader-def
 "aa" 'copy-to-x-clipboard ; used frequently
 "zz" 'paste-from-x-clipboard ; used frequently
 "fn" 'cp-filename-of-current-buffer
 "fp" 'cp-fullpath-of-current-buffer
 "ff" 'toggle-full-window ;; I use WIN+F in i3
 ;; org-do-demote/org-do-premote support selected region
 "cxi" 'org-clock-in ; `C-c C-x C-i'
 "cxo" 'org-clock-out ; `C-c C-x C-o'
 "cxr" 'org-clock-report ; `C-c C-x C-r'
 "jb" 'js-beautify
 "og" 'org-agenda
 )


(provide 'init-evil)
;;; init-evil.el ends here
