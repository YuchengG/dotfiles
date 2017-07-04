(add-to-list 'load-path "~/.emacs.d/elpa")

(setq-default indent-tabs-mode nil
              default-tab-width 4)

;;(setq exec-path (append exec-path '("/usr/local/bin", "/usr/local/sbin")))

;; set tramp
;; ERROR: as symbols is empty.
;;(add-to-list 'tramp-remote-path 'tramp-own-remote-path)
(setq tramp-ssh-controlmaster-options
      "-o ControlMaster=auto -o ControlPath='tramp.%%C' -o ControlPersist=no")
(setq tramp-chunksize 500)
(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
(setq tramp-completion-reread-directory-timeout nil)
(setq vc-ignore-dir-regexp
      (format "\\(%s\\)\\|\\(%s\\)"
              vc-ignore-dir-regexp
              tramp-file-name-regexp))
(setq tramp-auto-save-directory "/tmp")
(setq tramp-verbose 6)

;; ERROR: as symbles is empty
(add-to-list 'Info-default-directory-list "~/dotfiles/emacs/info")
(setq bookmark-default-file "~/dotfiles/emacs/bookmarks")
(setq bookmark-save-flag t) ;; save bookmark when emacs quits.

;; nxml fold
(require 'hideshow)
(require 'sgml-mode)
(require 'nxml-mode)
(add-to-list 'hs-special-modes-alist
             '(nxml-mode
               "<!--\\|<[^/>]*[^/]>"
               "-->\\|</[^/>]*[^/]>"

               "<!--"
               sgml-skip-tag-forward
               nil))
(add-hook 'nxml-mode-hook 'hs-minor-mode)

(autoload 'gmail2bbdb-import-file "gmail2bbdb" nil t nil)

;;(add-hook 'find-file-hook (lambda () (setq buffer-read-only t)))

(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))
