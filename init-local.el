;; provide init local.
;; Songpeng Zu  who uses Purcell setting rules.

;; change to other windows.
(define-key global-map [f6] 'other-window)

;;(add-to-list 'load-path "/Users/wangchao/home/git-recipe/evernote-mode")
;;(require 'evernote-mode)
;;(setq evernote-username "zusongpeng") ; optional: you can use this username as default.
;;(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8")) ; option
;;(global-set-key "\C-cec" 'evernote-create-note)
;;(global-set-key "\C-ceo" 'evernote-open-note)
;;(global-set-key "\C-ces" 'evernote-search-notes)
;;(global-set-key "\C-ceS" 'evernote-do-saved-search)
;;(global-set-key "\C-cew" 'evernote-write-note)
;;(global-set-key "\C-cep" 'evernote-post-region)
;;(global-set-key "\C-ceb" 'evernote-browser)

;; set the default coding
(setq default-buffer-file-encoding-system "gbk")

;; def global key for redraw-display
(global-set-key (kbd "\C-c \C-p") 'redraw-display)

;; set agenda files
(setq org-agenda-files (list "~/home/songpeng/git-recipes/BeyondPie/diary/diary.org"))

;; set tab indentation
(set-default indent-tabs-mode nil)
(setq tab-width 4)

(provide 'init-local)
;;; init-local.el ends here
