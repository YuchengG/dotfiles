;;; Start gnus:
                                        ;(setq user-full-name "zusongpeng")
                                        ;(setq user-mail-address "zusongpeng@gmail.com")

;;(auto-image-file-mode)
;;(set mm-inline-large-images t)
;;(add-to-list 'mm-inline-large-images "image/*")

(setq gnus-select-method
      '(nnimap "gmail"
               (nnimap-address "imap.gmail.com")
               (nnimap-server-port "imaps")
               (nnimap-stream ssl)))
(setq smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

                                        ;(setq message-send-mail-function 'smtpmail-send-it
                                        ;      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
                                        ;      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "zusongpeng@gmail.com" nil))
                                        ;      smtpmail-default-smtp-server "smtp.gmail.com"
                                        ;      smtpmail-smtp-server "smtp.gmail.com"
                                        ;      smtpmail-smtp-service 587
                                        ;      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;; (add-to-list 'gnus-secondary-select-methods)
;;             '(nnimap "gmail"
;;                      (nnimap-address "imap.gmail.com")
;;                      (nnimap-server-port 993)
;;                      (nnimap-stream ssl)))
;;
(setq message-send-mail-function 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "zusongpeng@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]")

;;; (provide '.gnus)
;;; .gnus ends here
