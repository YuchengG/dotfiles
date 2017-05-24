
(setq ensime-startup-notification t)
(setq ensime-startup-snapshot-notification t)

;;(add-hook 'java-mode-hook 'ensime-mode)
(add-hook 'scala-mode-hook 'ensime-mode)

(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\C-c\C-n" 'szu/python-shell-send-line)))

(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep9-options '("--max-line-length=79"))
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))
(setq python-shell-interpreter-args "-i --simple-prompt --pylab")
;;(setq python-shell-completion-native-enable nil)
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
