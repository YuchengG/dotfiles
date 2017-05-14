(require 'nnir)
(setq gnus-select-method '(nntp "news.gmane.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp "news.gnus.org"))
;;(setq gnus-select-method '(nnml ""))
(add-to-list 'gnus-secondary-select-methods
             '(nnimap "qq"
                      (nnimap-address "imap.qq.com")
                      (nnimap-server-port 993)
                      (nnimap-stream ssl)
                      (nnir-search-engine imap)
                      (nnmail-expiry-wait 90)))
(add-to-list 'gnus-secondary-select-methods
             '(nnimap "tsinghua"
                      (nnimap-address "mails.tsinghua.edu.cn")
                      (nnimap-server-port 993)
                      (nnimap-stream ssl)
                      (nnir-search-engine imap)
                      (nnmail-expiry-wait 90)))
(add-to-list 'gnus-secondary-select-methods
             '(nnimap "gmail"
                      (nnimap-address "imap.gmail.com")
                      (nnimap-server-port "imaps")
                      (nnimap-stream ssl)
                      (nnir-search-engine imap)
                      (nnmail-expiry-target "nnimap+gmail:[Gmail]/Trash")
                      (nnmail-expiry-wait 90)))
;; (add-to-list 'gnus-secondary-select-methods
;;              '(nnimap "163"
;;                       (nnimap-address "imap.163.com")
;;                       (nnimap-server-port 993)
;;                       (nnimap-stream ssl)
;;                       (nnir-search-engine imap)
;;                       (nnmail-expiry-wait 90)))

(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-most-recent-date
        (not gnus-thread-sort-by-number)))

;; NO 'passive
(setq gnus-use-cache t)
;; BBDB: Address list
;;(add-to-list 'load-path "/where/you/place/bbdb/")
(require 'bbdb)
(bbdb-initialize 'message 'gnus 'sendmail)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(setq bbdb/mail-auto-create-p t
      bbdb/news-auto-create-p t)
(add-hook 'message-mode-hook
          '(lambda ()
             (flyspell-mode t)
             (local-set-key "<TAB>" 'bbdb-complete-name)))
;; open attachment
;; (eval-after-load 'mailcap
;;   '(progn
;;      (cond
;;       ;; on OSX, maybe change mailcap-mime-data?
;;       ((eq system-type 'darwin))
;;       ;; on Windows, maybe change mailcap-mime-data?
;;       ((eq system-type 'windows-nt))
;;       (t
;;        ;; Linux, read ~/.mailcap
;;        (mailcap-parse-mailcaps)))))

;; Tree view for groups.
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)

;; Threads!  I hate reading un-threaded email -- especially mailing
;; lists.  This helps a ton!
(setq gnus-summary-thread-gathering-function 'gnus-gather-threads-by-subject)
;; Also, I prefer to see only the top level message.  If a message has
;; several replies or is part of a thread, only show the first message.
;; `gnus-thread-ignore-subject' will ignore the subject and
;; look at 'In-Reply-To:' and 'References:' headers.
(setq gnus-thread-hide-subtree t)
(setq gnus-thread-ignore-subject t)

;; Personal Information
(setq user-full-name "szu")
(setq user-mail-address "zusongpeng@gmail.com")

(defun setTsinghua ()
  (interactive)
  (message "from tsinghua")
  (setq user-mail-address "zsp07@mails.tsinghua.edu.cn")
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-auth-credentials '(("mails.tsinghua.edu.cn" 25 "zsp07@mails.tsinghua.edu.cn" nil))
        smtpmail-default-smtp-server "mails.tsinghua.edu.cn"
        smtpmail-smtp-server "mails.tsinghua.edu.cn"
        smtpmail-smtp-service 25
        smtpmail-local-domain "homepc"
        gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]"))
(defun setQQ ()
  (interactive)
  (message "from qq")
  (setq user-mail-address "zusongpeng@qq.com")
  (setq message-send-mail-function 'smtpmail-send-it
        smtpmail-auth-credentials '(("smtp.qq.com" 587 "zusongpeng@qq.com" nil))
        smtpmail-default-smtp-server "smtp.qq.com"
        smtpmail-smtp-server "smtp.qq.com"
        smtpmail-smtp-service 587
        smtpmail-local-domain "homepc"
        gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]"))
(defun setGmail ()
  (interactive)
  (message "from gmail")
  (setq user-mail-address "zusongpeng@gmail.com")
  (setq message-send-mail-function 'smtpmail-send-it
       ;; smtpmail-auth-credentials '(("smtp.gmail.com" 587 "zusongpeng@gmail.com" nil))
        smtpmail-default-smtp-server "smtp.gmail.com"
        smtpmail-smtp-server "smtp.gmail.com"
        smtpmail-smtp-service 587
        smtpmail-local-domain "homepc"
        gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]"))
;; (defun set163 ()
;;   (interactive)
;;   (message "from 163")
;;   (setq user-mail-address "zusongpeng@163.com")
;;   (setq message-send-mail-function 'smtpmail-send-it
;;         smtpmail-auth-credentials '(("smtp.163.com" 25 "zusongpeng@163.com" nil))
;;         smtpmail-default-smtp-server "smtp.163.com"
;;         smtpmail-smtp-server "smtp.163.com"
;;         smtpmail-smtp-service 25
;;         smtpmail-local-domain "homepc"
;;         gnus-ignored-newsgroups "^to\\.\\|^[0-9. ]+\\( \\|$\\)\\|^[\"]\"[#'()]"))

;; Read HTML mail
;; You need install the command line web browser 'w3m' and Emacs plugin 'w3m'
(setq mm-text-html-renderer 'w3m)
;; http://www.gnu.org/software/emacs/manual/html_node/gnus/_005b9_002e2_005d.html
(setq gnus-use-correct-string-widths nil)

(add-hook 'message-mode-hook
          '(lambda ()
             (cond ((string-match "qq" gnus-newsgroup-name) (setQQ))
                   ((string-match "gmail" gnus-newsgroup-name) (setGmail))
                   ;; ((string-match "163" gnus-newsgroup-name) (set163))
                   (t (setTsinghua)))))

;; set return email address based on incoming email address
(setq gnus-posting-styles
      '(((header "to" "zusongpeng@qq.com")
         (address "zusongpeng@qq.com"))
        ((header "to" "zsp07@mails.tsinghua.edu.cn")
         (address "zsp07@mails.tsinghua.edu.cn"))
        ((header "to" "zusongpeng@gmail.com")
         (address "zusongpeng@gmail.com"))))
        ;;((header "to" "zusongpeng@163.com")
        ;; (address "zusongpeng@163.com"))))

(eval-after-load 'gnus-topic
  '(progn
     (setq gnus-topic-topology '(("Gnus" visible)
                                 (("misc" visible))
                                 (("qq" visible))
                                 (("tsinghua" visible))
                                 (("gmail" visible))))
                                 ;;(("163" visible))))
     (setq gnus-topic-alist '(("qq"
                               "nnimap+qq:INBOX"
                               "nnimap+qq:Sent Messages"
                               "nnimap+qq:Drafts"
                               "nnimap+qq:Deleted Messages")
                              ("gmail"
                               "nnimap+gmail:INBOX"
                               "nnimap+gmail:[Gmail]/Sent Mail"
                               "nnimap+gmail:[Gmail]/Trash"
                               "nnimap+gmail:[Gmail]/Important"
                               "nnimap+gmail:[Gmail]/Starred"
                               "nnimap+gmail:[Gmail]/Drafts"
                               "nnimap+gmail:[Gmail]/All Mail")
                             ;; ("163"
                              ;; "nnimap+163:INBOX")
                              ("tsinghua"
                               "nnimap+tsinghua:INBOX"
                               "nnimap+tsinghua:Sent Items"
                               "nnimap+tsinghua:Trash"
                               "nnimap+tsinghua:Drafts"
                               "nnimap+tsinghua:Junk E-mail")
                              ("misc"
                               "nnfolder+archive:sent.2017"
                               "nndraft:drafts")
                              ("Gnus")))))

(defun my-gnus-group-list-subscribed-groups ()
  "List all subscribed groups with or without un-read messages"
  (interactive)
  (gnus-group-list-all-groups 5))

(define-key gnus-group-mode-map
  ;; list all the subscribed groups even they contain zero un-read messages
  (kbd "o") 'my-gnus-group-list-subscribed-groups)
;; Ignore certificate hostname.
(setq starttls-extra-arguments '("--insecure"))