;;; package --- summary
;;; Commentary:
;; provide init local.
;; Songpeng Zu  who uses Purcell setting rules.

;; change to other windows.
;;; Code:
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
(setq default-buffer-file-encoding-system "utf-8")

;; def global key for redraw-display
(global-set-key (kbd "\C-c \C-p") 'redraw-display)

;; set agenda files
(setq org-agenda-files (list "~/home/songpeng/git-recipes/BeyondPie/diary/diary.org"))

;; set tab indentation
(set-default indent-tabs-mode nil)
(setq tab-width 4)

;; org-mode set up
;; Add the indentation
;; Another way is
;; (defun set-newline-and-indent() (local-set-key (kbd "\C-j") 'newline-and-indent))
(add-hook 'org-mode-hook (lambda () (local-set-key "\C-j" 'newline-and-indent)))

;; Update the ispell directory
(setq ispell-program-name "/usr/local/Cellar/aspell/0.60.6.1/bin/aspell")

;; Env for auctex
(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex) ; with AUCTex LaTex mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex) ; with Emacs latex mode.
;;(local-set-key (kbd "$ $ \C-b") 'my-local-math-env)
;;(add-hook 'latex-mode-hook 'my-local-math-env)

;; Used for GNU GO GAME.
;; First, download and install gnugo with version 3.8. See the document, and on mac
;; configure might need additional parameters. Not use the gnugo from package-list,
;; instead download the latest version gnugo.el recommended by the GNU GO.Then load
;; gnugo.el and gnu-xpms.el from the game-go-download-dict/interface. cp the files
;; above to ~/.emacs.d/ then

;; Edit: gnugo from pakcage-list also works. Need install gnugo first. Then try
;; (setq gnugo-option-history (list "--komi 5.5 --boardsize 13")) and
;; (setq gnugo-xpms 'gnugo-imgen-create-xpms)
;; (add-hook 'gnugo-start-game-hook 'gnugo-image-display-mode)
;; See www.gnuvola.org/software/gnugo for details.
;; Maybe they are the same one. But the 'i' for generate the beautiful display not
;; work now for gnugo from package-list.

(load-file "~/.emacs.d/gnugo.el")
(load-file "~/.emacs.d/gnugo-xpms.el")

(provide 'init-local)
;;; init-local.el ends here
