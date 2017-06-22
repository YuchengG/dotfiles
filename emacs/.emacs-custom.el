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
 '(bookmark-default-file "/Users/songpeng.zu/dotfiles/emacs/bookmarks")
 '(browse-url-browser-function (quote browse-url-default-macosx-browser))
 '(compilation-message-face (quote default))
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#839496")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-file "/Users/songpeng.zu/dotfiles/emacs/.emacs-custom.el")
 '(custom-safe-themes
   (quote
    ("67e998c3c23fe24ed0fb92b9de75011b92f35d3e89344157ae0d544d50a63a72" "6b1e6953a08acf12843973ec25d69dbfa1a53d869f649dc991a56fbdf0d7eb9e" "9b349c5c09056c292d635725cecf587b44780e061c3d2477383d7eb25d4cdd68" "363de9fd1194546e7461bdb766793b1442c222376faa8254b8eafaf25afe48dc" "84f35ac02435aa65aef82f510756ab21f173624fcb332dd81e3c9f2adaf6b85b" "6bde11b304427c7821b72a06a60e8d079b8f7ae10b407d8af37ed5e5d59b1324" "9f3181dc1fabe5d58bbbda8c48ef7ece59b01bed606cfb868dd147e8b36af97c" "227e2c160b0df776257e1411de60a9a181f890cfdf9c1f45535fc83c9b34406b" "f78de13274781fbb6b01afd43327a4535438ebaeec91d93ebdbba1e3fba34d3c" "6df30cfb75df80e5808ac1557d5cc728746c8dbc9bc726de35b15180fa6e0ad9" "0ae09e79d0a3a7c9f31522fa325c7b9f248e5f5481e9b4a0c3bb9f3a91f221f1" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(doc-view-continuous t)
 '(eclimd-default-workspace "~/hulu/reco/")
 '(elfeed-feeds nil)
 '(evil-want-Y-yank-to-eol t)
 '(fci-rule-color "#073642")
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
 '(imenu-list-minor-mode nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#1B2229" "#51afef"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#1B2229" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#1B2229" "#3B3F46"))
 '(magit-diff-use-overlays nil)
 '(meghanada-use-company t t)
 '(meghanada-use-flycheck t t)
 '(nrepl-message-colors
   (quote
    ("#dc322f" "#cb4b16" "#b58900" "#546E00" "#B4C342" "#00629D" "#2aa198" "#d33682" "#6c71c4")))
 '(ns-alternate-modifier (quote (:ordinary meta :function meta :mouse meta)))
 '(org-agenda-files
   (quote
    ("~/home/songpeng/git-recipes/BeyondPie/GTD/gtd-2017.org")))
 '(org-ellipsis "  ")
 '(org-fontify-done-headline t)
 '(org-fontify-quote-and-verse-blocks t)
 '(org-fontify-whole-heading-line t)
 '(out-of-memory-warning-percentage 0)
 '(package-selected-packages
   (quote
    (evil-org editorconfig lsp-python lsp-java doom-themes realgud test-simple loc-changes load-relative ensiem reveal-in-osx-finder pbcopy osx-trash osx-dictionary launchctl mwe-log-commands symon string-inflection winum helm-purpose window-purpose groovy-imports browse-at-remote meghanada groovy-mode sbt-mode elpy csv-mode py-autopep8 scala-mode gradle-mode ac-emacs-eclim ensime cl-lib xpm ascii-art-to-unicode names chinese-word-at-point goto-chg diminish ivy counsel-bbdb bbdb w3m web-mode tagedit slim-mode scss-mode sass-mode pug-mode less-css-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data yaml-mode geeknote pdf-tools tablist mu4e-maildirs-extension mu4e-alert ht engine-mode ace-jump-mode noflet hide-comnt pcache undo-tree elfeed-web simple-httpd elfeed-goodies elfeed-org elfeed imenu-list latex-extra yapfify uuidgen py-isort org-projectile org-download mwim live-py-mode link-hint git-link flyspell-correct-helm flyspell-correct eyebrowse evil-visual-mark-mode evil-unimpaired evil-ediff eshell-z dumb-jump company-emacs-eclim column-enforce-mode youdao-dictionary helm-itunes eclim ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode disaster company-c-headers cmake-mode clang-format pyvenv pytest pyenv-mode py-yapf pip-requirements hy-mode helm-pydoc emacs-eclim cython-mode company-anaconda anaconda-mode pythonic f org zenburn-theme monokai-theme solarized-theme company-auctex auctex-latexmk xterm-color toc-org smeargle shell-pop orgit org-repo-todo org-present org-pomodoro alert log4e gntp org-plus-contrib org-bullets multi-term mmm-mode markdown-toc markdown-mode magit-gitflow htmlize helm-gitignore request helm-flyspell helm-company helm-c-yasnippet gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flycheck-pos-tip flycheck evil-magit magit magit-popup git-commit with-editor eshell-prompt-extras esh-help diff-hl company-statistics company-quickhelp pos-tip company auto-yasnippet yasnippet auto-dictionary ac-ispell auto-complete hydra powerline spinner parent-mode projectile pkg-info epl flx smartparens iedit anzu highlight packed helm avy helm-core popup async cdlatex auctex go gnugo hl-todo bracketed-paste ws-butler window-numbering volatile-highlights vi-tilde-fringe spaceline smooth-scrolling restart-emacs rainbow-delimiters popwin persp-mode pcre2el paradox page-break-lines open-junk-file neotree move-text macrostep lorem-ipsum linum-relative leuven-theme info+ indent-guide ido-vertical-mode hungry-delete highlight-parentheses highlight-numbers highlight-indentation help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery expand-region exec-path-from-shell evil-visualstar evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-args evil-anzu eval-sexp-fu elisp-slime-nav define-word clean-aindent-mode buffer-move auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line evil which-key quelpa package-build use-package bind-key bind-map s dash spacemacs-theme)))
 '(pdf-view-midnight-colors (quote ("#DCDCCC" . "#383838")))
 '(pos-tip-background-color "#073642")
 '(pos-tip-foreground-color "#93a1a1")
 '(safe-local-variable-values
   (quote
    ((Tex-engine . xetex)
     (End . %%%)
     (TeX-command-extra-options . "-shell-escape"))))
 '(send-mail-function (quote smtpmail-send-it))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#073642" 0.2))
 '(smtpmail-smtp-server "smtp.qq.com")
 '(smtpmail-smtp-service 25)
 '(term-default-bg-color "#002b36")
 '(term-default-fg-color "#839496")
 '(tramp-remote-path
   (quote
    (tramp-default-remote-path "/bin" "/usr/bin" "/sbin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin" "/local/bin" "/local/freeware/bin" "/local/gnu/bin" "/usr/freeware/bin" "/usr/pkg/bin" "/usr/contrib/bin" "/opt/bin" "/opt/sbin" "/opt/local/bin" "/data/home/szu/DrugSensitivity/tools/R/bin")))
 '(vc-annotate-background nil)
 '(vc-annotate-background-mode nil)
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
