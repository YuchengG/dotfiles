;;; package --- summary
;;; Commentary:
;; provide init local.
;; Songpeng Zu  who uses Purcell setting rules.

;;; Code:
;; set the default coding
(setq default-buffer-file-encoding-system "utf-8")

;; require evil
(require 'evil)
;;(evil-mode 1)

;; def global key for redraw-display
;;(global-set-key (kbd "\C-c \C-p") 'redraw-display)

;; set agenda files
;;(setq org-agenda-files (list "~/home/songpeng/git-recipes/BeyondPie/diary/diary.org"))

;; set tab indentation
;;(set-default indent-tabs-mode nil)
(setq-default tab-width 2)

;; org-mode set up
;; Add the indentation
;; Another way is
(defun set-newline-and-indent() (local-set-key (kbd "\C-j") 'newline-and-indent))
(add-hook 'org-mode-hook '(lambda () (local-set-key "\C-j" 'newline-and-indent)))
(add-hook 'org-mode-hook 'turn-on-org-cdlatex)

;; Update the ispell directory
(setq ispell-program-name "/usr/local/Cellar/aspell/0.60.6.1/bin/aspell")

;; Env for auctex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook 'turn-on-cdlatex) ; with AUCTex LaTex mode
(add-hook 'latex-mode-hook 'turn-on-cdlatex) ; with emacs latex mode.
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTex-mode-hook 'flyspell-mode)
(add-hook 'LaTex-mode-hook 'LaTex-math-mode)
(add-hook 'LaTex-mode-hook 'turn-on-reftex)
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

;; Set for doc-view as vim normal-mode:j for next-line; k for previous-line
(add-hook 'doc-view-mode-hook (lambda () (local-set-key (kbd "j") 'next-line)))
(add-hook 'doc-view-mode-hook (lambda () (local-set-key (kbd "k") 'previous-line)))

;; Set for ESS mode.
(setq ess-indent-or-complete t)
(setq comint-input-ring-size 1000)
(setq ess-indent-level 4)
(setq ess-arg-function-offset 4)
(setq ess-else-offset 4)

;; Set for FCI(fill column indicator)
(setq-default fill-column 80) ; use set-fill-column to set locally
;;(setq fci-rule-color "green")
(define-globalized-minor-mode global-fci-mode fci-mode (lambda()(fci-mode 1)))
(global-fci-mode 1) ; to close it in a buffer, try M-x fci-mode
;;(auto-fill-mode 1) ; open auto-fill-mode

;; Add the ctags setup.
(defun create-tags (dir-name)
  "Create tags file for DIR-NAME."
  (interactive "DDirectory: ")
  (shell-command
   (format "/usr/local/bin/ctags -e -R %s" (directory-file-name dir-name))))

;; Add cmake-mode.
;;(setq load-path (cons (expand-file-name "/dir/with/cmake-mode") load-path))

;; C++/C setting.
(require 'helm-gtags)
(require 'setup-helm)
(require 'setup-helm-gtags)
(require 'function-args)
(require 'cmake-mode)

;; error no such package.
;;(require 'hs-minor-mode)

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))
;;(define-key c-mode-map [(tab)] 'company-complete) ;; error value is void.
;;(define-key c++-mode-map [(tab)] 'company-complete)
;; need install companu-c-headers
(add-to-list 'company-backends 'company-c-headers)

;; error : symbole's value as variable is void
;;(add-to-list 'company-c-headers-path-system "/usr/local/Cellar/boost/1.60.0_1/include")

;;install flycheck-google-cpplint and google-c-style
(eval-after-load 'flycheck
  '(progn
     (require 'flycheck-google-cpplint)
     ;; Add Google C++ Style checker.
     ;; In default, syntax checked by Clang and Cppcheck.
     (flycheck-add-next-checker 'c/c++-clang
                                'c/c++-googlelint 'append)))

;; Not work, but custom set works. for the function below.
;; (add-hook 'c++-mode-hook
;;           (lambda () (setq flycheck-clang-include-path
;;                       (list (expand-file-name "~/home/songpeng/git-recipes/GIFT/dev_version/dev_src/src")
;;                             "/usr/local/Cellar/boost/1.60.0_1/include"))))

(require 'cc-mode)
(require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)
;; (add-hook 'c++-mode-hook 'google-c-style)

;; Use transparent window
(set-frame-parameter (selected-frame) 'alpha '(80 80))
(add-to-list 'default-frame-alist '(alpha 80 80))

;; C++ ENV Not complete:
;; GOOD REF: tuhdo.github.io/c-ide.html.

;; Visible Bell Work-Around on OS X EI Capitan.
(setq visible-bell nil) ;; The default
(setq ring-bell-function 'ignore)

;; Close the buffers.
(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer
        (delq (current-buffer) (remove-if-not 'buffer-file-name (buffer-list)))))

(defun kill-all-buffers ()
  "Kill all the buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; nyan-mode
(case window-system ((x w32) (nyan-mode)))

;; golden-ratio
(require 'golden-ratio)
(add-to-list 'golden-ratio-exclude-modes "ediff-mode")
(add-to-list 'golden-ratio-exclude-modes "helm-mode")
(add-to-list 'golden-ratio-exclude-modes "dired-mode")
(add-to-list 'golden-ratio-inhibit-functions 'pl/helm-alive-p)
(defun pl/helm-alive-p ()
  (if (boundp 'helm-alive-p)
      (symbol-value 'helm-alive-p)))
;; do not enable golden-raio in these modes
(setq golden-ratio-exclude-modes '("ediff-mode"
                                   "gud-mode"
                                   "magit-log-mode"
                                   "magit-reflog-mode"
                                   "magit-status-mode"
                                   "IELM"
                                   "eshell-mpde"
                                   "dired-mode"))
(golden-ratio-mode)

(provide 'init-local)
;;; init-local ends here
