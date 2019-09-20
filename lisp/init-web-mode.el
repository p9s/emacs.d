;;; init-web-mode.el --- major-mode for editing web templates
;;; Commentary:
;;; Code:

(require-package 'web-mode)

(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("html\\.ep\\'" . web-mode))   ;;; Mojolicious default template format suffix

;;; 所有html结尾的文档都开 web-mode
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))

(provide 'init-web-mode)

;;; init-web-mode.el ends here
