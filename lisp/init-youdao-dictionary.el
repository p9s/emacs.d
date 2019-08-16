;;; init-youdao-dictionary.el --- 有道翻译
;;; Commentary:
;;; Code:

(require-package 'youdao-dictionary)

(setq url-automatic-caching t)

;; Example Key binding
(global-set-key (kbd "C-c y") 'youdao-dictionary-search-at-point+)


(provide 'init-youdao-dictionary)
;;; init-youdao-dictionary.el ends here
