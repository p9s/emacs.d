;;; init-evil.el --- 支持vim key bind
;;; Commentary:
;;; Code:

(require 'evil)
(evil-mode 1)

;; (use-package evil-surround
;;              :ensure t
;;              :config
;;              (global-evil-surround-mode 1))


(defun evil-keyboard-quit ()
  "Keyboard quit and force normal state."
  (interactive)
  (and evil-mode (evil-force-normal-state))
  (keyboard-quit))

(define-key evil-normal-state-map   (kbd "C-g") #'evil-keyboard-quit)
(define-key evil-motion-state-map   (kbd "C-g") #'evil-keyboard-quit)
(define-key evil-insert-state-map   (kbd "C-g") #'evil-keyboard-quit)
(define-key evil-window-map         (kbd "C-g") #'evil-keyboard-quit)
(define-key evil-operator-state-map (kbd "C-g") #'evil-keyboard-quit)


(provide 'init-evil)
;;; init-evil.el ends here
