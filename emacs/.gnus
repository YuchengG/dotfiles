;; most of codes from
;; https://github.com/redguardtoo/mastering-emacs-in-one-year-guide/blob/master/gnus-guide-en.org
(require 'nnir)

(setq gnus-select-method '(nntp "news.gmane.org"))
(add-to-list 'gnus-secondary-select-methods '(nntp "news.gnus.org"))

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
(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-most-recent-date
        (not gnus-thread-sort-by-number)))

;; NO 'passive
(setq gnus-use-cache t)
;; BBDB: Address list

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

;; Read HTML mail
;; You need install the command line web browser 'w3m' and Emacs plugin 'w3m'
(setq mm-text-html-renderer 'w3m)
;; http://www.gnu.org/software/emacs/manual/html_node/gnus/_005b9_002e2_005d.html
(setq gnus-use-correct-string-widths nil)

(add-hook 'message-mode-hook
          '(lambda ()
             (cond ((string-match "qq" gnus-newsgroup-name) (setQQ))
                   ((string-match "tsinghua" gnus-newsgroup-name) (setTsinghua))
                   ;; ((string-match "163" gnus-newsgroup-name) (set163))
                   (t (setGmail)))))

;; set return email address based on incoming email address
(setq gnus-posting-styles
      '(((header "to" "zusongpeng@qq.com")
         (address "zusongpeng@qq.com"))
        ((header "to" "zsp07@mails.tsinghua.edu.cn")
         (address "zsp07@mails.tsinghua.edu.cn"))
        ((header "to" "zusongpeng@gmail.com")
         (address "zusongpeng@gmail.com"))))

(eval-after-load 'gnus-topic
  '(progn
     (setq gnus-topic-topology '(("Gnus" visible)
                                 (("misc" visible))
                                 (("qq" visible))
                                 (("tsinghua" visible))
                                 (("gmail" visible))))
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
                              ("tsinghua"
                               "nnimap+tsinghua:INBOX")
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

;; try hydra for gnus
(eval-after-load 'gnus-group
  '(progn
     (defhydra hydra-gnus-group (:color blue)
       "Do?"
       ("a" gnus-group-list-active "REMOTE groups A A")
       ("l" gnus-group-list-all-groups "LOCAL groups L")
       ("c" gnus-topic-catchup-articles "Read all c")
       ("G" gnus-group-make-nnir-group "Search server G G")
       ("g" gnus-group-get-new-news "Refresh g")
       ("s" gnus-group-enter-server-mode "Servers")
       ("m" gnus-group-new-mail "Compose m OR C-x m")
       ("#" gnus-topic-mark-topic "mark #")
       ("q" nil "cancel"))
     ;; y is not used by default
     (define-key gnus-group-mode-map "y" 'hydra-gnus-group/body)))

;; gnus-summary-mode
(eval-after-load 'gnus-sum
  '(progn
     (defhydra hydra-gnus-summary (:color blue)
       "Do?"
       ("s" gnus-summary-show-thread "Show thread")
       ("h" gnus-summary-hide-thread "Hide thread")
       ("n" gnus-summary-insert-new-articles "Refresh / N")
       ("f" gnus-summary-mail-forward "Forward C-c C-f")
       ("!" gnus-summary-tick-article-forward "Mail -> disk !")
       ("p" gnus-summary-put-mark-as-read "Mail <- disk")
       ("c" gnus-summary-catchup-and-exit "Read all c")
       ("e" gnus-summary-resend-message-edit "Resend S D e")
       ("R" gnus-summary-reply-with-original "Reply with original R")
       ("r" gnus-summary-reply "Reply r")
       ("W" gnus-summary-wide-reply-with-original "Reply all with original S W")
       ("w" gnus-summary-wide-reply "Reply all S w")
       ("#" gnus-topic-mark-topic "mark #")
       ("q" nil "cancel"))
     ;; y is not used by default
     (define-key gnus-summary-mode-map "y" 'hydra-gnus-summary/body)))

;; gnus-article-mode
(eval-after-load 'gnus-art
  '(progn
     (defhydra hydra-gnus-article (:color blue)
       "Do?"
       ("f" gnus-summary-mail-forward "Forward")
       ("R" gnus-article-reply-with-original "Reply with original R")
       ("r" gnus-article-reply "Reply r")
       ("W" gnus-article-wide-reply-with-original "Reply all with original S W")
       ("o" gnus-mime-save-part "Save attachment at point o")
       ("w" gnus-article-wide-reply "Reply all S w")
       ("q" nil "cancel"))
     ;; y is not used by default
     (define-key gnus-article-mode-map "y" 'hydra-gnus-article/body)))

(eval-after-load 'message
  '(progn
     (defhydra hydra-message (:color blue)
       "Do?"
       ("ca" mml-attach-file "Attach C-c C-a")
       ("cc" message-send-and-exit "Send C-c C-c")
       ("q" nil "cancel"))
     (global-set-key (kbd "C-c C-y") 'hydra-message/body)))

