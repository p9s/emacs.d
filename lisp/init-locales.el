;;; init-locales.el --- Configure default locale -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defun get-year-and-month ()
  (list (format-time-string "%Y年") (format-time-string "%m月")))


(defun find-month-tree ()
   (let* ((path (get-year-and-month))
          (level 1)
          end)
     (unless (derived-mode-p 'org-mode)
       (error "Target buffer \"%s\" should be in Org mode" (current-buffer)))
     (goto-char (point-min))             ;移动到 buffer 的开始位置
     ;; 先定位表示年份的 headline，再定位表示月份的 headline
     (dolist (heading path)
       (let ((re (format org-complex-heading-regexp-format
                         (regexp-quote heading)))
             (cnt 0))
         (if (re-search-forward re end t)
             (goto-char (point-at-bol))  ;如果找到了 headline 就移动到对应的位置
           (progn                        ;否则就新建一个 headline
             (or (bolp) (insert "\n"))
             (if (/= (point) (point-min)) (org-end-of-subtree t t))
             (insert (make-string level ?*) " " heading "\n"))))
       (setq level (1+ level))
       (setq end (save-excursion (org-end-of-subtree t t))))
     (org-end-of-subtree)))

(defun sanityinc/utf8-locale-p (v)
  "Return whether locale string V relates to a UTF-8 locale."
  (and v (string-match-p "UTF-8" v)))

(defun sanityinc/locale-is-utf8-p ()
  "Return t iff the \"locale\" command or environment variables prefer UTF-8."
  (or (sanityinc/utf8-locale-p (and (executable-find "locale") (shell-command-to-string "locale")))
      (sanityinc/utf8-locale-p (getenv "LC_ALL"))
      (sanityinc/utf8-locale-p (getenv "LC_CTYPE"))
      (sanityinc/utf8-locale-p (getenv "LANG"))))

(when (or window-system (sanityinc/locale-is-utf8-p))
  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-selection-coding-system (if (eq system-type 'windows-nt) 'utf-16-le 'utf-8))
  (prefer-coding-system 'utf-8))


;;; Maximized setup 
(add-to-list 'initial-frame-alist '(fullscreen . maximized ))


;;; change default font
(set-default-font "Monaco-12")

;;; org-agenda setup
(setq org-agenda-files (list
                        "~/gtd/inbox.org"
                        "~/gtd/gtd.org"
                        "~/gtd/tickler.org"
                        "~/gtd/finace.org"
                        ))


;;; org-capture configuration
(setq org-capture-templates '( ("t" "Todo [inbox]"    entry
                                (file+headline "~/gtd/inbox.org" "Tasks")
                                "* TODO  %? %^g\n \
SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))\n \
:PROPERTIES:\n \
:CAPTURED: %U\n \
:END:\n
\n ")
                               ("c" "Caicai todo [gtd]"    entry
                                (file+olp "~/gtd/gtd.org" "Projects" "Caicai")
                                "* TODO  %? %^g\n \
SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))\n \
:PROPERTIES:\n \
:CAPTURED: %U\n \
:END:\n
\n ")
                               ("d" "DeHongMIS todo [gtd]"    entry
                                (file+olp "~/gtd/gtd.org" "Projects" "DeHong MIS")
                                "* TODO  %? %^g\n \
SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))\n \
:PROPERTIES:\n \
:CAPTURED: %U\n \
:END:\n
\n ")

                               ("f" "Finance" plain (file+function "~/gtd/finace.org" find-month-tree)
                                " | %U | %^{类别} | %^{描述} | %^{金额} |" :kill-buffer t)

                               ("n" "Notes" entry (file "~/gtd/note.org")
                                "* %^{heading} %T %^g\n  %?\n")

                               ("e" "XiXi Food" plain (file+function "~/gtd/xixi-food.org" find-month-tree)
                                " | %U | %^{时间(AM/PM} | %^{食物} |" :kill-buffer t)

                               ("T" "Tickler" entry (file+headline "~/gtd/tickler.org" "Tickler")
                                "* [#A] %i%? \n %T")
                               ))

(setq org-refile-targets '(("~/gtd/gtd.org" :maxlevel . 3)
                           ("~/gtd/someday.org" :maxlevel . 1)
                           ("~/gtd/tickler.org" :maxlevel . 2 )))

(setq org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "|" "DONE(d)" "CANCELLED(c)")))

;;; (add-hook 'org-mode-hook 'my-org-mode-auto-save-settings)
(defun my-org-mode-auto-save-settings()
;;; (auto-save-mode 1) ; this is unnecessar as it is on by default
  (set (make-local-variable 'auto-save-visited-file-name) t)
  (setq auto-save-interval 20))


;;; (load (expand-file-name "~/quicklisp/slime-helper.el"))
;; Replace "sbcl" with the path to your implementation
;;; (setq inferior-lisp-program "sbcl")


;;; for words guess
(add-hook 'GSW (lambda () (text-scale-decrease 1)))

(provide 'init-locales)
;;; init-locales.el ends here
