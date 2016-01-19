;; RSS
(add-to-list 'load-path "~/git-recipes/emacs.d/ESS/lisp/")
(load "ess-site")
(setq ess-indent-or-complete t)

;;(provide 'init-local)
;;Latex
(add-to-list 'load-path "~/auctex/auctex-11.88/")
(load "auctex.el" nil t t)
(load "preview-latex.el" nil t t)

;; Molokai theme 
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/molokai-theme/")
;;(setq molokai-theme-kit t)

;; Add the easy-shift mode 
;(define-key global-map [f1] 'Control-X-prefix)
;;(define-key global-map [f3] 'find-file)
;(define-key global-map [f2] 'save-buffer)
;(define-key global-map [f8] 'kill-buffer)
;(define-key global-map [f5] 'switch-to-buffer)
(define-key global-map [f6] 'other-window)
;(define-key global-map [f9] 'ess-load-file)

;; Define the tab in the ESS
(setq comint-input-ring-size 1000)
(setq ess-indent-level 4)
(setq ess-arg-function-offset 4)
(setq ess-else-offset 4)

;; Recall the R statement history
;(add-hook 'inferior-ess-mode-hook
;          '(lambda nil   
;             (define-key inferior-ess-mode-map [\C-up] 'comint-previous-matching-in;put-from-input)
;             (define-key inferior-ess-mode-map [\C-down] 'comint-next-matching-inpu;t-from-input)
;             (define-key inferior-ess-mode-map [\C-x \t] 'comint-dynamic-complete-f;ilename)
;             )
;          )
;; Set the tramp
;;(setq tramp-default-method "ssh")
;(setq tramp-chunksize 500)
;; Diable version control.
;(setq vc-ignore-dir-regexp
;      (format "\\(%s\\)\\|\\(%s\\)"
;              vc-ignore-dir-regexp
;              tramp-file-name-regexp))

;; Binding TAB as AC
(define-key ac-completing-map [tab] 'ac-complete)
(define-key ac-completing-map [return] nil)

;; Use unicad to help input and output Chinese.
;(add-to-list 'load-path "~/.emacs.d/site-lisp/")
;(require 'unicad)

;; Undo to previous window
(when (fboundp 'winner-mode)
  (winner-mode)
  (windmove-default-keybindings))

;; Add w3m
;load & init
;(autoload 'w3m "w3m" "interface for w3m on emacs" t)
;(autoload 'w3m-browse-url "w3m" "Ask a WWW brouer to show a URL." t)
;(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
;(autoload 'w3m-search "w3m-search" "Search words using emacs-w3m." t)
; settings
;(setq w3m-use-cookies t)
;(setq w3m-home-page "http://www.newsmth.net")

;(require 'mime-w3m)
;(setq w3m-default-display-inline-image t)
;(setq w3m-default-toggle-inline-images t)

; UTF-8 
;(setq w3m-coding-system 'utf-8
;      w3m-file-coding-system 'utf-8
;      w3m-file-name-coding-system 'utf-8
;      w3m-input-coding-system 'utf-8
;      w3m-output-coding-system 'utf-8
;      w3m-terminal-coding-system 'utf-8)
; Add GBK
(setq default-buffer-file-encoding-system "gbk")

; Add Spell Chack
;; Add aspell as defualt spell check
(setq-default ispell-program-name "aspell")
(ispell-change-dictionary "english" t)

;;; Evernote
(add-to-list 'load-path "~/Downloads/evernote-mode")
(require 'evernote-mode)
                                        ;(setq evernote-enml-formatter-command '("w3m" "-dump" "-I" "UTF8" "-O" "UTF8"))
(global-set-key "\C-cec" 'evernote-create-note)
(global-set-key "\C-ceo" 'evernote-open-note)
(global-set-key "\C-ces" 'evernote-search-notes)
(global-set-key "\C-ceS" 'evernote-do-saved-search)
(global-set-key "\C-cew" 'evernote-write-note)
(global-set-key "\C-cep" 'evernote-post-region)
(global-set-key "\C-ceb" 'evernote-browser)
(setq evernote-username "zusongpeng@163.com")
                                        ;(setq evernote-developer-token "S=s162:U=11881d9:E=1551623cfd5:C=14dbe72a148:P=1cd:A=en-devtoken:V=2:H=32aecad086ebc5334f3d0ae749a3c822")

;; Set the fill column indicator
                                        ; (setq fci-rule-width 1)
                                        ; (setq fci-rule-color "darkblue")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda()(fci-mode 1)))
(global-fci-mode 1)

;; Set for ipython
(require 'python-mode)
(setq-default py-shell-name "ipython")
(setq-default py-which-bufname "IPython")
;(setq py-python-command-args
;      '("--gui=wx" "--pylab=wx" "-colors" "Linux"))
(setq py-force-py-shell-name-p t)
;(setq py-shell-switch-buffers-on-execute-p t)
(setq py-swith-buffers-on-execute-p t)
(setq py-split-windows-on-execute-p nil)
(setq py-smart-indentation t)
;(define-key python-mode-map [?\C-\r] 'py-execute-line)
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

(provide 'init-local)

