;;; init-perl.el --- Some helpful Perl code

(defalias 'perl-mode 'cperl-mode)

(eval-after-load 'cperl-mode
  '(progn
     (define-key cperl-mode-map (kbd "RET") 'reindent-then-newline-and-indent)
     (define-key cperl-mode-map (kbd "C-M-h") 'backward-kill-word)))

(global-set-key (kbd "C-h P") 'perldoc)

(add-to-list 'auto-mode-alist '("\\.(?:cgi|p[lm])$" . cperl-mode))
(add-to-list 'auto-mode-alist '("\\.pod$" . pod-mode))
(add-to-list 'auto-mode-alist '("\\.tt$" . tt-mode))

(setq cperl-indent-level 2
      cperl-close-paren-offset -2
      ;; cperl-continued-statement-offset 4
      ;; cperl-indent-parens-as-block t
      ;; cperl-tab-always-indent t
      )

(exec-path-from-shell-copy-envs '("LANG" "LC_ALL" "LC_CTYPES"))

(defun perltidy ()
  "Run perltidy on the current region or buffer."
  (interactive)
  (save-excursion
    (unless mark-active (mark-defun))
    (shell-command-on-region (point) (mark) "perltidy -q" nil t)))

(global-set-key "\C-ct" 'perltidy)

(add-hook 'cperl-mode-hook '(lambda ()
                              (setq indent-tabs-mode nil)
                              ;; BestPractices からぱくったがなんかうごいてない
                              (setq fill-column 78)
                              (setq auto-fill-mode t)
                              ;; face設定。これはどっかちがうとこにうつす
                              (set-face-background 'cperl-hash-face (face-background 'default))
                              (setq cperl-hash-face 'cperl-hash-face)
                              (make-face 'cperl-array-face)
                              (set-face-foreground 'cperl-array-face "color-69")
                              (set-face-background 'cperl-array-face (face-background 'default))
                              (setq cperl-array-face 'cperl-array-face)
                              ))
(provide 'init-perl)
;;; init-perl.el ends here
