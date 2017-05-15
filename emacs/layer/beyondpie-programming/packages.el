(setq beyondpie-programming-packages '(
                                       ensime
                                       sbt-mode))
(defun beyondpie-programming/post-init-ensime ()
 (use-package ensime
   :commands ensime ensime-mode
   :ensure t
   :pin melpa-stable))

(defun beyondpie-programming/post-init-sbt-mode ()
 (use-package sbt-mode
   :commands sbt-start sbt-command
   :config
   (substitute-key-definition
    'minibuffer-complete-word
    'self-insert-command
    minibuffer-local-completion-map)))
