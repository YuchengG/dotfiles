
(setq-default indent-tabs-mode nil
              default-tab-width 4)

(setq exec-path (append exec-path '("/usr/local/bin", "/usr/local/sbin")))

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
;;(add-to-list 'Info-directory-list "~/dotfiles/emacs/info")
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

(setq eclimd-autostart t)
(setq eclim-eclipse-dirs "/Applications/Eclipse.app/Contents/MacOS/eclipse"
      eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim"
      eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")
;;(require 'company)
;;(require 'company-emacs-eclim)
;;(company-emacs-eclim-setup)
;;(global-company-mode t)
;;(setq company-emacs-eclim-ignore-case t)

(setq mac-command-modifier 'control)
