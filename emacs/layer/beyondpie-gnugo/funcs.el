(defun beyondpie/gnugo/help()
  "return gnugo help by running shell command."
  (interactive)
  (shell-command "gnugo --help"))
