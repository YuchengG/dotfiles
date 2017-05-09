;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     python
     csv
     html
     yaml
     auto-completion
     better-defaults
     emacs-lisp
     git
     gnus
     (markdown :variables
               markdown-command "/usr/local/bin/pandoc")
     org
     (shell :variables
            shell-default-shell 'eshell
            shell-default-term-shell "/bin/bash"
            shell-default-height 30
            shell-default-position 'bottom
            shell-default-full-span t)
     spell-checking
     syntax-checking
     version-control
     (latex :variables
            latex-enable-auto-fill t
            latex-build-command "LaTex"
            latex-enable-folding t)
     (scala :variables
            scala-indent:use-javadoc-style t
            scala-auto-insert-asterisk-in-comments t
            scala-use-unicode-arrows t
            scala-auto-start-ensime t)
     (java :variables
           java-backend 'ensime)
     ;;elpy
     ;; (python :variables
     ;;         python-enable-yapf-format-on-save t
     ;;         python-fill-column 79
     ;;         python-sort-imports-on-save t
     ;;         python-indent-offset 4)
     c-c++
     ess
     imenu-list
     (elfeed :variables
             rmh-elfeed-org-files (list "~/dotfiles/emacs/rssfeeds.org")
             elfeed-enable-web-interface t
             url-queue-timeout 30)
     ;; (mu4e :variables
     ;;       mu4e-installation-path "~/.emacs.d/mu-0.9.18/mu4e"
     ;;       mu4e-enable-mode-line t
     ;;       mu4e-enable-notifications t
     ;;       mu4e-account-alist nil)
     osx
     (pdf-tools :config
                (setq TeX-view-program-selection '((output-pdf "pdf-tools")))
                (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view"))))
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(mwe-log-commands
                                      gnugo
                                      youdao-dictionary
                                      latex-extra
                                      bbdb
                                      w3m
                                      counsel-bbdb
                                      cdlatex
                                      cl-lib
                                      ensime
                                      sbt-mode
                                      ;;ac-emacs-eclim
                                      gradle-mode
                                      py-autopep8
                                      )
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(smartparens
                                    semantic)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configurat ion-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

(defun my-setup-indent (n)
  ;; java/c/c++
  (setq c-basic-offset n)
  ;; web development
  (setq coffee-tab-width n) ; coffeescript
  (setq javascript-indent-level n) ; javascript-mode
  (setq js-indent-level n) ; js-mode
  (setq js2-basic-offset n) ; js2-mode, in latest js2-mode, it's alias of js-indent-level
  (setq web-mode-markup-indent-offset n) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offset n) ; web-mode, css in html file
  (setq web-mode-code-indent-offset n) ; web-mode, js code in html file
  (setq css-indent-offset n) ; css-mode
)



(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; One of `vim', `emacs' or `hybrid'. Evil is always enabled but if the
   ;; variable is `emacs' then the `holy-mode' is enabled at startup. `hybrid'
   ;; uses emacs key bindings for vim's insert mode, but otherwise leaves evil
   ;; unchanged. (default 'vim)
   dotspacemacs-editing-style 'hybrid
   ;; dotspacemacs-editing-style '(hybrid :variables
   ;;                             hybrid-mode-enable-evilified-state t
   ;;                             hybrid-mode-enable-hjkl-bindings nil
   ;;                             hybrid-mode-default-state-backup 'normal)
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading t
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(projects recents bookmarks)
   ;; Number of recent files to show in the startup buffer. Ignored if
   ;; `dotspacemacs-startup-lists' doesn't include `recents'. (default 5)
   dotspacemacs-startup-recent-list-size 5
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(monokai
                         spacemacs-light
                         spacemacs-dark
                         solarized-light
                         leuven
                         zenburn)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Source Code Pro"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m)
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; If non nil `Y' is remapped to `y$'. (default t)
   dotspacemacs-remap-Y-to-y$ t
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location nil
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f), `find-spacemacs-file' (SPC f e s), and
   ;; `find-contrib-file' (SPC f e c) are replaced. (default nil)
   dotspacemacs-use-ido nil
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-micro-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar nil
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup t
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 50
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; If non nil line numbers are turned on in all `prog-mode' and `text-mode'
   ;; derivatives. If set to `relative', also turns on relative line numbers.
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all',
   ;; `trailing', `changed' or `nil'. Default is `changed' (cleanup whitespace
   ;; on changed lines) (default 'changed)
   dotspacemacs-whitespace-cleanup 'changed
   dotspacemacs-helm-use-fuzzy 'source
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init'.  You are free to put almost any
user code here.  The exception is org related code, which should be placed in
`dotspacemacs/user-config'."
  ;;(fset 'xterm-color-unfontify-region 'font-lock-default-unfontify-region)
  ;; set custom-file.
  (setq custom-file "~/.emacs.d/.emacs-custom.el")
  (load custom-file)
  (push '("melpa-stable" . "stable.melpa.org/packages/") configuration-layer--elpa-archives)
  (push '("ensime" . "melpa-stable") package-pinned-packages)
  (my-setup-indent 4)
)

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  ;; to set path and PATH
  (setq exec-path (append exec-path '("/usr/local/bin")))
  (setq exec-path (append exec-path '("/usr/local/sbin")))
  ;; (setenv "PATH" (shell-command-to-string "/bin/bash -c 'echo -n $PATH'"))
  ;;(setq-default indent-tabs-mode nil)
  ;;(setq-default default-tab-width 4)
  ;; set for java and scala to use ensime.
  (use-package ensime
    :commands ensime ensime-mode
    :ensure t
    :pin melpa-stable)
  (setq ensime-startup-notification t)
  (setq ensime-startup-snapshot-notification t)
  ;;(add-hook 'java-mode-hook 'ensime-mode)
  (add-hook 'scala-mode-hook 'ensime-mode)
  (use-package sbt-mode
    :commands sbt-start sbt-command
    :config
    (substitute-key-definition
     'minibuffer-complete-word
     'self-insert-command
     minibuffer-local-completion-map))
  ;; set for eclim
  ;;  (setq eclimd-autostart t)
  ;; (setq eclim-eclipse-dirs "/Applications/Eclipse.app/Contents/MacOS/eclipse"
  ;;       eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim"
  ;;       eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd")
  ;; auto-complete-mode for java eclim
  ;; (require 'auto-complete-config)
  ;; (ac-config-default)
  ;; (require 'ac-emacs-eclim-source)
  ;; (ac-emacs-eclim-config)
  ;; configure company-mode for java eclim.
  (require 'company)
  ;; (require 'company-emacs-eclim)
  ;; (company-emacs-eclim-setup)
  ;; (global-company-mode t)
  ;; (setq company-emacs-eclim-ignore-case t)
  ;; start server
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (ispell-change-dictionary "american" t)
  (setq gnugo-xpms 'gnugo-imgen-create-xpms)
  ;;(setq mac-command-modifier 'control)
  (defun szu/gnugo/help()
    "return gnugo help by running shell command."
    (interactive)
    (shell-command "gnugo --help"))
  (global-set-key (kbd "C-SPC") 'set-mark-command)
  (setq org-agenda-files (list "~/BeyondPie/GTD/gtd-2017.org"))
  (defun notify-osx (title message)
    (call-process "terminal-notifier"
                  nil 0 nil
                  "-group" "Emacs"
                  "-title" title
                  "-sender" "org.gnu.Emacs"
                  "-message" message
                  "-activate" "org.gnu.Emacs"))
  (add-hook 'org-pomodoro-finished-hook
            (lambda ()
              (notify-osx "Pomodoro completed!" "Time for a break.")))
  (add-hook 'org-pomodoro-break-finished-hook
            (lambda ()
              (notify-osx "Pomodoro Short Break Finished." "Ready for Another?")))
  (add-hook 'org-pomodoro-long-break-finished-hook
            (lambda ()
              (notify-osx "Pomodoro Long Break Finished." "Ready for Another?")))
  (add-hook 'org-pomodoro-killed-hook
            (lambda ()
              (notify-osx "Pomodoro Killed." "One does not simply kill a pomodoro!")))
  (setq org-todo-keywords
        (quote ((sequence "TODO" "NEXT" "|" "DONE")
                (sequence "WAITING" "HOLD" "|" "CANCELED" "MOVED" "PHONE" "MEETING"))))
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  ;; (when (eq system-type 'darwin)
  ;;   (add-to-list 'load-path "/usr/local/Cellar/mu/HEAD/share/emacs/site-lisp/mu4e"))

  (add-hook 'LaTeX-mode-hook #'latex-extra-mode)

  ;; turn on cdlatex minor mode in latex and org.
  (add-hook 'LaTeX-mode-hook 'turn-on-cdlatex)
  (add-hook 'latex-mode-hook 'turn-on-cdlatex)
  (add-hook 'org-mode-hook 'turn-on-org-cdlatex)
  (setq TeX-view-program-selection '((output-pdf "pdf-tools")))
  (setq TeX-view-program-list '(("pdf-tools" "TeX-pdf-tools-sync-view")))
  (defun th/pdf-view-revert-buffer-maybe (file)
    (let ((buf (find-buffer-visiting file)))
      (when buf
        (with-current-buffer buf
          (when (derived-mode-p 'pdf-view-mode)
            (pdf-view-revert-buffer nil t))))))
  (add-hook 'TeX-after-TeX-LaTeX-command-finished-hook
            #'th/pdf-view-revert-buffer-maybe)

  ;; set tramp
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
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
  ;; set org chinese font output
  (setq org-latex-pdf-process '("xelatex -interaction nonstopmode %f"
                                "xelatex -interaction nonstopmode %f"))
  (defun szu/clear-R-shell ()
    (interactive)
    (let ((old-max comint-buffer-maximum-size))
      (setq comint-buffer-maximum-size 0)
      (comint-truncate-buffer)
      (setq comint-buffer-maximum-size old-max)))
  (defun szu/python-shell-send-line ()
    ;; send line to python shell, but not work
    ;; on multiple lines, such as comma as end
    ;; of current line.
    (interactive)
    (save-excursion
      (setq script_buffer (format (buffer-name)))
      (end-of-line)
      (kill-region (point) (progn (back-to-indentation) (point)))
      (if (get-buffer "*Python*")
          (message "")
        (run-python "ipython" nil nil))
      (setq py_buffer "*Python*")
      (switch-to-buffer-other-window py_buffer)
      (goto-char (buffer-end 1))
      (yank)
      (comint-send-input)
      (switch-to-buffer-other-window script_buffer)
      (yank))
    (end-of-line)
    (next-line))
  (add-hook 'python-mode-hook
            (lambda ()
              (define-key python-mode-map "\C-c\C-n" 'szu/python-shell-send-line)))
  ;;(add-to-list 'Info-default-directory-list "~/home/songpeng/git-recipes/dotfiles/info")
  (add-to-list 'Info-directory-list "~/dotfiles/emacs/info")
  (setq bookmark-default-file "~/dotfiles/emacs/bookmarks")
  (setq bookmark-save-flag t) ;; save bookmark when emacs quits.
  (autoload 'dired-async-mode "dired-async.el" nil t)
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1)
  ;; set zsh
  ;; (setq multi-term-program "/bin/zsh")
  ;; python
  (add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
  (setq py-autopep9-options '("--max-line-length=79"))
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"))
  (setq python-shell-interpreter-args "-i --simple-prompt --pylab")
  ;;(setq python-shell-completion-native-enable nil)
  (setenv "IPY_TEST_SIMPLE_PROMPT" "1")
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
  ;; optional key bindings, easier than hs defaults
  (define-key nxml-mode-map (kbd "C-c h") 'hs-toggle-hiding)
)
