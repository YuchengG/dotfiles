;; general
;;; add to prog-mode
(add-hook 'prog-mode-hook 'linum-mode)
(add-hook 'prog-mode-hook 'auto-fill-mode)
(add-hook 'prog-mode-hook 'fci-mode)
(add-hook 'prog-mode-hook 'outline-minor-mode)

;; Specific lang
;;; python
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))
(add-hook 'python-mode-hook
          (lambda ()
            (define-key python-mode-map "\C-c\C-n"
              'szu/python-shell-send-line)))
(add-hook 'python-mode-hook 'beyondpie/set-buffer-read-only)
(add-hook 'python-mode-hook 'py-autopep8-enable-on-save)
(setq py-autopep8-options '("--max-line-length=79"))
(when (executable-find "ipython")
  (setq python-shell-interpreter "ipython"))
(setq python-shell-interpreter-args "-i --simple-prompt --pylab")
(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
;;; Java
(add-hook 'java-mode-hook 'beyondpie/set-buffer-read-only)

;; set ensime for scala
(setq ensime-startup-notification nil)
(setq ensime-startup-snapshot-notification nil)
(setq flycheck-scalastyle-jar
      "/usr/local/Cellar/scalastyle/0.8.0/libexec/scalastyle_2.11-0.8.0-batch.jar")
(setq flycheck-scalastylerc
      "/usr/local/etc/scalastyle_config.xml")
(add-hook 'scala-mode-hook 'beyondpie/set-buffer-read-only)

;;; set ESS
(add-hook 'ess-mode-hook 'beyondpie/set-buffer-read-only)

;;; set Latex
(add-hook 'LaTeX-mode-hook 'beyondpie/set-buffer-read-only)
