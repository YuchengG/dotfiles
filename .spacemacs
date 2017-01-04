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
     html
     yaml
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     better-defaults
     emacs-lisp
     git
     (markdown :variables
               markdown-command "/usr/local/bin/pandoc")
     org
     ;(org :variables
     ;     org-todo-keywords '((sequence "TODO" "DONE" "CANCEL" "WAIT")))
     (shell :variables
            shell-default-shell 'multiterm
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
     java
     (python :variables
             python-enable-yapf-format-on-save t
             python-fill-column 99
             python-sort-imports-on-save t
             python-indent-offset 4)
     c-c++
     ess
     imenu-list
     (elfeed :variables
             rmh-elfeed-org-files (list "~/home/songpeng/git-recipes/dotfiles/rssfeeds.org")
             elfeed-enable-web-interface t
             url-queue-timeout 30)
     search-engine
     (mu4e :variables
           mu4e-installation-path "~/.emacs.d/mu-0.9.18/mu4e"
           mu4e-enable-mode-line t
           mu4e-enable-notifications t
           mu4e-account-alist nil)
     gnus
     ;;pdf-tools epdfinfo cannot found.
     (pdf-tools :ensure t)
     )

   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(gnugo youdao-dictionary latex-extra geeknote)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '()
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configurat ion-layers'. (default t)
   dotspacemacs-delete-orphan-packages t))

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
   dotspacemacs-startup-banner 'random
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'.
   ;; (default '(recents projects))
   dotspacemacs-startup-lists '(recents bookmarks projects)
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
   dotspacemacs-default-font '("Consolas"
                               :size 14
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
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
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
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration. You are free to put any user code."
  (add-to-list 'load-path "~/.emacs.d/cl-lib/")
  (require 'cl-lib)
  (server-start)
  (add-hook 'doc-view-mode-hook 'auto-revert-mode)
  (ispell-change-dictionary "american" t)
  (setq gnugo-xpms 'gnugo-imgen-create-xpms)
  (setq mac-command-modifier 'control)
  (defun szu/gnugo/help()
    "return gnugo help by running shell command."
    (interactive)
    (shell-command "gnugo --help"))
  (global-set-key (kbd "\C-d") 'backward-delete-char)
  (setq org-agenda-files (list "~/home/songpeng/git-recipes/BeyondPie/GTD/tasks-2016.org"
                               "~/home/songpeng/git-recipes/BeyondPie/GTD/diary_GTD_2016.org"
                               "~/todo.org"))
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
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path)
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
  (add-to-list 'Info-directory-list "~/home/songpeng/git-recipes/dotfiles/info")
  (setq bookmark-default-file "~/home/songpeng/git-recipes/dotfiles/bookmarks")
  (setq bookmark-save-flag t) ;; save bookmark when emacs quits.
  (autoload 'dired-async-mode "dired-async.el" nil t)
  (dired-async-mode 1)
  (async-bytecomp-package-mode 1)
  (require 'smtpmail-async)
  (setq send-mail-function 'async-smtpmail-send-it
        message-send-mail-function 'async-smtpmail-send-it)
  (setq mu4e-maildir "~/mail"
        mu4e-drafts-folder "/Drafts"
        mu4e-sent-folder "/Sent Messages"
        mu4e-refile-folder "/Archive"
        mu4e-trash-folder "/Deleted Messages"
        mu4e-compose-signature-auto-include t
        mu4e-view-show-images t
        mu4e-view-show-addresses t
        )
   (setq mu4e-compose-signature (concat "Songpeng Zu\n"
                                        "Tsinghua University, Beijing, China\n"
                                        "https://github.com/songpeng\n"))
  (setq mu4e-maildir-shortcuts
        '(("/INBOX" . ?i)
          ("/Sent Messages" . ?s)
          ("/Junk" . ?j)
          ("/Deleted Messages" .?t)
          ))
  (setq mu4e-get-mail-command "offlineimap"
        mu4e-update-interval 300)
  (setq user-mail-address "zusongpeng@qq.com"
        user-full-name "szu")
  (require 'smtpmail)
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-stream-type 'starttls
        smtpmail-default-smtp-server "smtp.qq.com"
        smtpmail-smtp-server "smtp.qq.com"
        smtpmail-smtp-service 587)
  (setq mu4e-index-cleanup nil
        mu4e-index-lazy-check t)
  (setq mu4e-attachment-dir "~/Downloads")
  (with-eval-after-load 'mu4e-alert
    (mu4e-alert-set-default-style 'growl))
  (setq mu4e-compose-format-flowed t)
  (require 'org-mu4e)
  (setq org-mu4e-link-query-in-headers-mode nil)
  (setq org-capture-templates
        '(("t" "todo" entry (file+headline "~/todo.org" "Tasks")
           "* TODO [#A] %?\nSCHEDULED: %(org-insert-time-stamp (org-read-date nil t \"+0d\"))\n%a\n")))
  (spacemacs/toggle-transparency)
  ;; (setq mu4e-account-alist
  ;;       '(("qq"
  ;;          ;; Under each account, set the account-specific variables you want.
  ;;          (mu4e-sent-messages-behavior delete)
  ;;          (mu4e-sent-folder "/mail/Sent Messages")
  ;;          (mu4e-drafts-folder "/mail/Drafts")
  ;;          (user-mail-address "zusongpeng@qq.com")
  ;;          (user-full-name "szu")
  ;;          (smtpmail-default-smtp-server "smtp.qq.com")
  ;;          (smtpmail-smtp-server "smtp.qq.com")
  ;;          (smtpmail-smtp-service 587))
  ;;         ("college"
  ;;          (mu4e-sent-messages-behavior sent)
  ;;          (mu4e-sent-folder "/mail_college/Sent Items")
  ;;          (mu4e-drafts-folder "/mail_college/Drafts")
  ;;          (user-mail-address "zsp07@mails.tsinghua.edu.cn")
  ;;          (user-full-name "szu")
  ;;          (smtpmail-default-smtp-server "mails.tsinghua.edu.cn")
  ;;          (smtpmail-smtp-server "mails.tsinghua.edu.cn")
  ;;          (smtpmail-smtp-service 465))))
  ;; (mu4e/mail-account-reset)
  ;; (setq mu4e-contexts
  ;;       `( ,(make-mu4e-context
  ;;            :name "QQ"
  ;;            :enter-func (lambda () (mu4e-message "Entering QQ context"))
  ;;            :leave-func (lambda () (mu4e-message "Leaving QQ context"))
  ;;            :match-func (lambda (msg)
  ;;                          (when msg
  ;;                            (mu4e-message-contact-field-matches msg
  ;;                                                                :to "zusongpeng@qq.com")))
  ;;            :vars '((user-mail-address . "zusongpeng@qq.com")
  ;;                    (user-full-name . "szu")
  ;;                    (mu4e-sent-folder . "/mail/Sent Messages")
  ;;                    (mu4e-drafts-folder . "/mail/Drafts")
  ;;                    (smtpmail-default-smtp-server . "smtp.qq.com")
  ;;                    (smtpmail-smtp-server . "smtp.qq.com")
  ;;                    (smtpmail-smtp-service . 587)
  ;;                    (smtpmail-stream-type starttls)
  ;;                    ))
  ;;          ,(make-mu4e-context
  ;;            :name "College"
  ;;            :enter-func (lambda () (mu4e-message "Switch to the College context"))
  ;;            :match-func (lambda (msg)
  ;;                          (when msg
  ;;                            (mu4e-message-contact-field-matches msg
  ;;                                                                :to "zsp07@mails.tsinghua.edu.cn")))
  ;;            :vars '((user-mail-address . "zsp07@mails.tsinghua.edu.cn")
  ;;                    (user-full-name . "szu")
  ;;                    (mu4e-sent-folder . "/mail_college/Sent Items")
  ;;                    (mu4e-drafts-folder . "/mail_college/Drafts")
  ;;                    (smtpmail-default-smtp-server . "mails.tsinghua.edu.cn")
  ;;                    (smtpmail-smtp-server . "mails.tsinghua.edu.cn")
  ;;                    (smtpmail-smtp-service . 465)
  ;;                    (smtpmail-stream-type . starttls)
  ;;                    ))))
  ;; (setq mu4e-context-policy 'pick-first)
  ;; (setq mu4e-compose-context-policy nil)
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-engine (quote xetex))
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(browse-url-browser-function (quote browse-url-default-macosx-browser))
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" "0ae09e79d0a3a7c9f31522fa325c7b9f248e5f5481e9b4a0c3bb9f3a91f221f1" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(doc-view-continuous t)
 '(elfeed-feeds nil)
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#073642" t)
 '(highlight-changes-colors (quote ("#d33682" "#6c71c4")))
 '(highlight-symbol-colors
   (--map
    (solarized-color-blend it "#002b36" 0.25)
    (quote
     ("#b58900" "#2aa198" "#dc322f" "#6c71c4" "#859900" "#cb4b16" "#268bd2"))))
 '(highlight-symbol-foreground-color "#93a1a1")
 '(highlight-tail-colors
   (quote
    (("#073642" . 0)
     ("#546E00" . 20)
     ("#00736F" . 30)
     ("#00629D" . 50)
     ("#7B6000" . 60)
     ("#8B2C02" . 70)
     ("#93115C" . 85)
     ("#073642" . 100))))
 '(hl-bg-colors
   (quote
    ("#7B6000" "#8B2C02" "#990A1B" "#93115C" "#3F4D91" "#00629D" "#00736F" "#546E00")))
 '(hl-fg-colors
   (quote
    ("#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36" "#002b36")))
 '(hl-sexp-background-color "#efebe9")
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(package-selected-packages
   (quote
    (web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data yaml-mode geeknote pdf-tools tablist mu4e-maildirs-extension mu4e-alert ht engine-mode ace-jump-mode noflet hide-comnt pcache undo-tree elfeed-web simple-httpd elfeed-goodies elfeed-org elfeed imenu-list latex-extra yapfify uuidgen py-isort org-projectile org-download mwim live-py-mode link-hint git-link flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump company-emacs-eclim column-enforce-mode youdao-dictionary helm-itunes eclim ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode disaster company-c-headers cmake-mode clang-format pyvenv pytest pyenv-mode py-yapf pip-requirements hy-mode helm-pydoc emacs-eclim cython-mode company-anaconda anaconda-mode pythonic f org zenburn-theme monokai-theme solarized-theme company-auctex auctex-latexmk xterm-color toc-org smeargle shell-pop orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore request helm-flyspell helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flycheck-pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-prompt-extras esh-help diff-hl company-statistics company-quickhelp pos-tip company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete hydra powerline spinner parent-mode projectile pkg-info epl flx smartparens iedit anzu highlight packed helm avy helm-core popup async cdlatex auctex go gnugo hl-todo bracketed-paste ws-butler window-numbering volatile-highlights vi-tilde-fringe spaceline smooth-scrolling restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox page-break-lines open-junk-file neotree move-text macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu elisp-slime-nav define-word clean-aindent-mode buffer-move auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line evil which-key quelpa package-build use-package bind-key bind-map s dash spacemacs-theme)))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values
   (quote
    ((Tex-engine . xetex)
     (End . %%%)
     (TeX-command-extra-options . "-shell-escape"))))
 '(send-mail-function (quote smtpmail-send-it))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tramp-remote-path
   (quote
    (tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin" "/data/home/szu/DrugSensitivity/tools/R/bin")))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#dc322f")
     (40 . "#c85d17")
     (60 . "#be730b")
     (80 . "#b58900")
     (100 . "#a58e00")
     (120 . "#9d9100")
     (140 . "#959300")
     (160 . "#8d9600")
     (180 . "#859900")
     (200 . "#669b32")
     (220 . "#579d4c")
     (240 . "#489e65")
     (260 . "#399f7e")
     (280 . "#2aa198")
     (300 . "#2898af")
     (320 . "#2793ba")
     (340 . "#268fc6")
     (360 . "#268bd2"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list
   (quote
    (unspecified "#002b36" "#073642" "#990A1B" "#dc322f" "#546E00" "#859900" "#7B6000" "#b58900" "#00629D" "#268bd2" "#93115C" "#d33682" "#00736F" "#2aa198" "#839496" "#657b83")))
 '(xterm-color-names
   ["#073642" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#eee8d5"])
 '(xterm-color-names-bright
   ["#002b36" "#cb4b16" "#586e75" "#657b83" "#839496" "#6c71c4" "#93a1a1" "#fdf6e3"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip-common ((t (:inherit company-tooltip :weight bold :underline nil))))
 '(company-tooltip-common-selection ((t (:inherit company-tooltip-selection :weight bold :underline nil))))
 '(term ((t (:inherit default)))))
