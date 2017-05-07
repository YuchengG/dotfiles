;;; packages.el --- doggypoo layer packages file for Spacemacs.
;;
;; Copyright (c) 2017 Songpeng Zu
;;
;; Author: Songpeng Zu <zusongpeng@gmail>
;; URL: https://github.com/songpeng/doggypoo.git
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `doggypoo-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `doggypoo/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `doggypoo/pre-init-PACKAGE' and/or
;;   `doggypoo/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

;; (defconst doggypoo-packages
;;   '(doggypoo
;;     :location local)
;;   )

;; (defun doggypoo/init-doggypoo ()
;;    (use-package doggypoo))

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

(defun hi-doggypoo()
  (interactive)
  (message "Master, Doggypoo is here!"))



;;; packages.el ends here
