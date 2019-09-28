;;; init-perl.el --- Some helpful Perl code

(exec-path-from-shell-copy-envs '("LANG" "LC_ALL" "LC_CTYPES"))
(defalias 'perl-mode 'cperl-mode)

(eval-after-load 'cperl-mode
  '(progn
     (define-key cperl-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key cperl-mode-map (kbd "C-M-h") 'backward-kill-word)))

(global-set-key (kbd "C-h P") 'perldoc)

(add-to-list 'auto-mode-alist '("\\.(?:cgi|p[lm])$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pod$" . pod-mode))
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))


;;; Just space 
(setq-default indent-tabs-mode nil)

(setq cperl-indent-level 4
      cperl-close-paren-offset -4
      cperl-indent-subs-specially nil
      cperl-continued-statement-offset 4
      cperl-indent-parens-as-block t
      cperl-tabs-always-indent t)


(defun perltidy-dwim (arg)
  "Perltidy a region of the entire buffer"
  (interactive "P")
  (let ((old-point (point))
	(old-mark (mark t))
	(currconf (current-window-configuration))
	(buffer (generate-new-buffer "*perltidy*"))
	(start)
	(end))
    (if (and mark-active transient-mark-mode)
	(setq start (region-beginning)
	      end (region-end))
      (setq start (point-min)
	    end (point-max)))
    ;; set the PERLTIDY environment variable to the closest instance
    ;; of .perltidyrc, but keep its value if it was set before.
    (let ((old-perltidy-env (getenv "PERLTIDY")))
      (setenv "PERLTIDY" (or old-perltidy-env
			     (expand-file-name
			      (locate-dominating-file (buffer-file-name) "~/.perltidyrc"))))
      (shell-command-on-region start end "perltidy" buffer)
      (setenv "PERLTIDY" old-perltidy-env))
    (delete-region start end)
    (insert-buffer buffer)
    (kill-buffer buffer)
    (goto-char (min old-point (point-max)))
    (if old-mark (push-mark (min old-mark (point-max)) t))
    (set-window-configuration currconf)))

(add-hook 'cperl-mode-hook
	  (lambda ()
	    (local-set-key (kbd "C-c t") 'perltidy-dwim)))

(provide 'init-perl)
;;; init-perl.el ends here
