;;; init-locales.el --- Configure default locale -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

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
  (set-language-environment 'utf-8)
  (setq locale-coding-system 'utf-8)
  (set-selection-coding-system (if (eq system-type 'windows-nt) 'utf-16-le 'utf-8))
  (prefer-coding-system 'utf-8))


;;; Maximized setup 
(add-to-list 'initial-frame-alist '(fullscreen . maximized ))


;;; change default font
(set-default-font "Monaco-16")

;;; org-agenda setup
(setq org-agenda-files (list "~/org-notes/Finance.org"
                                "~/org-notes/Todo.org"
                                "~/org-notes/Note.org"
                                "~/org-notes/NoNMatchs.org"
                                "~/org-notes/Project.org"))


;;; org-capture configuration
(setq org-capture-templates '( ("t" "Work todo"    entry (file+headline "~/org-notes/Todo.org" "Work")
           "* TODO [#A] %? %^g\n \
SCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+1d\"))\n \
DEADLINE: %(org-insert-time-stamp (org-read-date nil t \"+1w\"))\n \
:PROPERTIES:\n \
:CAPTURED: %U\n \
:END:\n
\n ")
          ("f" "Finance" plain (file+function "~/org-notes/Finance.org" find-month-tree)
            " | %U | %^{类别} | %^{描述} | %^{金额} |" :kill-buffer t)

          ("n" "Notes" entry (file "~/org-notes/Note.org")
           "* %^{heading} %T %^g\n  %?\n")

          ("m" "MatchMissing" entry (file "~/org-notes/NoNMatchs.org")
           "* %^{heading} %T %^g\n  %?\n")
          ))

(provide 'init-locales)
;;; init-locales.el ends here
