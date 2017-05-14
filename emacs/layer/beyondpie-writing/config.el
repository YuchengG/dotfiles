
(add-hook 'LaTeX-mode-hook #'latex-extra-mode)

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

(add-hook 'doc-view-mode-hook 'auto-revert-mode)

(ispell-change-dictionary "american" t)
