;;; init-english.el

(require 'company-english-helper)
(require 'insert-translated-name)
;;; default enable english-helper
(toggle-company-english-helper)

;;; 输入很长一串中文字符 注释
;;; This is a long Chinese comment.
(def 中文函数名 chinese-function-name)
(provide 'init-english)

;;; init-english.el ends here
