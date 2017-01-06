(require 'nnir)
(add-to-list 'gnus-secondary-select-methods
             '(nnimap "tsinghua"
                      (nnimap-address "mails.tsinghua.edu.cn")
                      (nnimap-server-port 993)
                      (nnimap-stream ssl)
                      (nnir-server-to-search-engine imap)
                      (nnmail-expiry-wait 90)))
(add-to-list 'gnus-secondary-select-methods
             '(nnimap "qq"
                      (nnimap-address "imap.qq.com")
                      (nnimap-server-port 993)
                      (nnimap-stream ssl)
                      (nnir-server-to-search-engine imap)
                      (nnmail-expiry-wait 90)))

(setq gnus-thread-sort-functions
      '(gnus-thread-sort-by-most-recent-date
        (not gnus-thread-sort-by-number)))

;; NO 'passive
(setq gnus-use-cache t)
;; Fetch only part of the article if we can.
;; I saw this in someone's .gnus
(setq gnus-read-active-file 'some)
;; open attachment
(eval-after-load 'mailcap
  '(progn
     (cond
      ;; on OSX, maybe change mailcap-mime-data?
      ((eq system-type 'darwin))
      ;; on Windows, maybe change mailcap-mime-data?
      ((eq system-type 'windows-nt))
      (t
       ;; Linux, read ~/.mailcap
       (mailcap-parse-mailcaps)))))

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
;; Read HTML mail
;; You need install the command line web browser 'w3m' and Emacs plugin 'w3m'
(setq mm-text-html-renderer 'w3m)
;; http://www.gnu.org/software/emacs/manual/html_node/gnus/_005b9_002e2_005d.html
(setq gnus-use-correct-string-widths nil)
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

(add-hook 'message-mode-hook
          '(lambda ()
             (cond ((string-match "qq" gnus-newsgroup-name) (setQQ))
                   (t (setTsinghua)))))
