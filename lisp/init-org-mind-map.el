;;; init-org-mind-map.el --- creates graphviz directed graphs from org-mode files
;;; Commentary:
;;; Code:

;; This is an Emacs package that creates graphviz directed graphs from
;; the headings of an org file

;;; (require-package 'ox-org)
(require-package 'org-mind-map)
(setq org-mind-map-engine "dot")

(provide 'init-org-mind-map)
;;; init-org-mind-map.el ends here
