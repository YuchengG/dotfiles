;; general
(add-hook 'prog-mode-hook 'whitespace-mode)
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'auto-fill-mode)
(add-hook 'prog-mode-hook 'fci-mode)
;; ensime
(setq ensime-startup-notification nil)
(setq ensime-startup-snapshot-notification nil)
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\C-c\C-n" 'szu/python-shell-send-line)))

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=79"))
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))
(setq python-shell-interpreter-args "-i --simple-prompt --pylab")
;;(setq python-shell-completion-native-enable nil)
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
;; set eclim
;; (setq eclimd-autostart t)
;; (setq eclim-eclipse-dirs "/Applications/Eclipse.app/Contents/MacOS/eclipse"
;;       eclim-executable "/Applications/Eclipse.app/Contents/Eclipse/eclim"
;;       eclimd-executable "/Applications/Eclipse.app/Contents/Eclipse/eclimd"
;;       eclimd-default-workspace "~/hulu/reco")
;; (setq eclim-auto-save nil)
;; (setq eclimd-wait-for-process nil)
