(defconst doggypoo-packages
  '())
(defgroup doggypoo nil
  "A smart, lovely, loyalty dog named doggypoo."
  :group 'pets)

(defcustom doggypoo-whose-name "doggypoo"
  "The name of the dog."
  :type 'string
  :group 'doggypoo)

(defvar doggypoo-mode nil
  "Determines if doggypoo minor mode is active.")
(make-variable-buffer-local 'doggypoo-mode)

(defvar doggypoo-mode-map (make-sparse-keymap))

(defvar doggypoo-mode-menu nil)

;;;###autoload
(defun wake-up-doggypoo ()
  "Wake up doggypoo minor mode."
  (doggypoo-mode t))

;;;###autoload
(defun doggypoo-mode (&optional arg)
  "Minor mode for a smart, lovely, and loyalty dog."
  (interactive "P")
  (setq doggypoo-mode (not (or (and (null arg) doggypoo-mode)
                               (<= (prefix-numeric-value arg) 0))))
  (if doggypoo-mode
      (progn
        (easy-menu-add doggypoo-mode-menu)
        (run-hooks 'doggypoo-mode-hook)))
  )
