(defun beyondpie/clear-R-shell ()
  (interactive)
  (let ((old-max comint-buffer-maximum-size))
    (setq comint-buffer-maximum-size 0)
    (comint-truncate-buffer)
    (setq comint-buffer-maximum-size old-max)))
(defun beyondpie/python-shell-send-line ()
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

(defun beyondpie/set-java-fci-column ()
  (interactive)
  (setq fci-rule-column 120)
  )
